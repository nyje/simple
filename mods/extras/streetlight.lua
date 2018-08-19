
if extras.streetlight then
    local schems = { "empty","park1","park2","park3","park4","small_glass","small_concrete","small_redbrick","small_redstone","small_yellowstone","big_glass","big_brownstone","big_concrete","big_redbrick","big_redstone"}

    local function get_intersects (p1, p2)
        local res = ""
        for id, area in pairs(areas.areas) do
            local a1=area.pos1
            local a2=area.pos2
            if ((a1.x >= p1.x and a1.x <= p2.x) or (a2.x >= p1.x and a2.x <= p2.x) or (a1.x < p1.x and a2.x > p2.x)) and
                ((a1.y >= p1.y and a1.y <= p2.y) or (a2.y >= p1.y and a2.y <= p2.y) or (a1.y < p1.y and a2.y > p2.y)) and
                ((a1.z >= p1.z and a1.z <= p2.z) or (a2.z >= p1.z and a2.z <= p2.z) or (a1.z < p1.z and a2.z > p2.z)) then
                res = res..","..area.owner.." owns "..area.name.." ("..a1.x.." "..a1.y.." "..a1.z..")-("..a2.x.." "..a2.y.." "..a2.z..")"
            end
        end
        if res ~= "" then
            return "!!! Cannot Change Area !!!,Protected areas found:"..res
        else
            return nil
        end
    end

    local sl_menu = function(pos,intersects)
        local bg=""
        local prot=""
        if intersects then
            bg="bgcolor[#F00]"
            prot="button_exit[0,0.5;2,1;unprotect;Unprotect]"
        else
            prot="button_exit[0,0.5;2,1;protect;Protect]"
        end
        return "size[2,3]"
               ..bg
               .."label[0.45,-0.1;Streetlight]"
               .."label[0.45,0.15;Controller]"
               ..prot
               .."button_exit[0,1.3;2,1;save;Save]"
               .."button_exit[0,2.1;2,1;load;Load]"
               .."field[1,9;1,1;x:"..pos.x..";"..pos.x..";X]"
               .."field[1,10;1,1;y:"..(pos.y - 1)..";"..(pos.y - 1)..";Y]"
               .."field[1,11;1,1;z:"..pos.z..";"..pos.z..";Z]"
    end

    local chooser = function(pos)
        return "size[4,8]"
               .."label[0,0;Chose what to create:]"
               .."textlist[0,1;4,6;schematic;"..table.concat(schems,",")..";0;true]"
               .."button_exit[0,7;4,1;exit;Cancel]"
               .."field[9,1;1,1;x:"..pos.x..";"..pos.x..";X]"
               .."field[9,1;1,1;y:"..(pos.y - 1)..";"..(pos.y - 1)..";Y]"
               .."field[9,1;1,1;z:"..pos.z..";"..pos.z..";Z]"
    end

    local protected = function(intersects)
        return "size[5,8]"
               ..""
               .."textlist[0,0;5,7;;"..intersects.."]"
               .."button_exit[0,7;4,1;player_list_exit;Close]"
    end


    local function getpos(pos)
        local x = math.floor((pos.x-8)/40)*40+8
        local y = pos.y
        local z = math.floor((pos.z-8)/40)*40+8
        return {x=x,y=y,z=z}
    end

    local function showarea(pos)
        local x = math.floor((pos.x-8)/40)*40+8
        local y = pos.y
        local z = math.floor((pos.z-8)/40)*40+8
        local pos1={x=x,y=y,z=z}
        local mpos={x=(pos1.x+19.5),y=(pos1.y+18.5),z=(pos1.z+19.5)}
        minetest.add_entity(mpos, "extras:display")
    end

    minetest.register_node("extras:streetlight", {
        description = "Magic Streetlight",
        tiles = {"extras_streetlight.png"},
        paramtype = "light",
        light_source = 14,
        paramtype2 = "facedir",
        drawtype = "nodebox",
        node_box = { type = "fixed",
            fixed = {
                {0.1, 2.5, -0.1, -0.1, -0.5, 0.1},
                {0.05, 2.5, -0.5, -0.05, 2.4, -0.1},
                {0.1, 2.5, -0.7, -0.1, 2.35, -0.5},
            } },
        drops = {},
        groups = {cracky = 2, level=2},
        --sounds = default.node_sound_stone_defaults(),
        on_place = minetest.rotate_and_place,
        on_punch = showarea,
        on_rightclick = function(pos, node, player, itemstack, pointed_thing)
            if pointed_thing.under then
                local pt = pointed_thing.under
                local pos1 = getpos(pos)
                local pos2 = { x = pos1.x+40, y = pos1.y+40, z= pos1.z+40 }
                local intersects = get_intersects(pos1,pos2)
                local privs = minetest.get_player_privs(player:get_player_name())
                minetest.show_formspec(player:get_player_name(), "choose_schematic", sl_menu(getpos(pos1),intersects,privs))
            end
        end,
    })

    minetest.register_on_player_receive_fields(function(player, formname, fields)
        if formname == "choose_schematic" then
            if fields.schematic then
                local name = player:get_player_name()
                minetest.close_formspec(name, formname)
                local idx=minetest.explode_textlist_event(fields.schematic).index
                local filename = "lp_"..schems[idx]..".mts"
                local pos,itab = {},{}
                for i,v in pairs(fields) do
                    itab=string.split(i,":")
                    if itab[2] then
                        pos[itab[1]] = tonumber(itab[2])
                    end
                end
                local pos2 = { x = pos.x+25, y = pos.y+100, z= pos.z+25 }
                local stuffed = worldedit.set(pos, pos2, "air")
                minetest.place_schematic(pos, extras.path.."/schematics/"..filename)
                return true
            end
        end
    end)

    -- display entity shown when protector node is punched
    minetest.register_entity("extras:display", {
        physical = false,
        collisionbox = {0, 0, 0, 0, 0, 0},
        visual = "wielditem",
        -- wielditem seems to be scaled to 1.5 times original node size
        visual_size = {x = 1.0 / 1.5, y = 1.0 / 1.5},
        textures = {"extras:display_node"},
        timer = 0,

        on_step = function(self, dtime)

            self.timer = self.timer + dtime

            -- remove after 5 seconds
            if self.timer > 15 then
                self.object:remove()
            end
        end,
    })


    -- Display-zone node, Do NOT place the display as a node,
    -- it is made to be used as an entity (see above)

    local x = 19.5
    minetest.register_node("extras:display_node", {
        tiles = {"extras_display.png"},
        use_texture_alpha = true,
        walkable = false,
        drawtype = "nodebox",
        node_box = {
            type = "fixed",
            fixed = {
                -- sides
                {-(x+.55), -(x+.55), -(x+.55), -(x+.45), (x+.55), (x+.55)},
                {-(x+.55), -(x+.55), (x+.45), (x+.55), (x+.55), (x+.55)},
                {(x+.45), -(x+.55), -(x+.55), (x+.55), (x+.55), (x+.55)},
                {-(x+.55), -(x+.55), -(x+.55), (x+.55), (x+.55), -(x+.45)},
                -- top
                {-(x+.55), (x+.45), -(x+.55), (x+.55), (x+.55), (x+.55)},
                -- bottom
                {-(x+.55), -(x+.55), -(x+.55), (x+.55), -(x+.45), (x+.55)},
                -- middle (surround protector)
                {-.55,-.55,-.55, .55,.55,.55},
            },
        },
        selection_box = {
            type = "regular",
        },
        paramtype = "light",
        groups = {dig_immediate = 3, not_in_creative_inventory = 1},
        drop = "",
    })
end


