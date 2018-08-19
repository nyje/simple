-- Initial Stuff

minetest.register_privilege("spill", { description = "Allows one to use liquids" })


minetest.register_node("stuff:ladder", {
	description = "Steel Ladder",
	drawtype = "signlike",
	tiles = {"default_ladder_steel.png"},
	inventory_image = "default_ladder_steel.png",
	wield_image = "default_ladder_steel.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
		--wall_top = = <default>
		--wall_bottom = = <default>
		--wall_side = = <default>
	},
	groups = {cracky = 2},
	sounds = default.node_sound_metal_defaults(),
})




minetest.register_on_newplayer(function(player)

player:get_inventory():add_item('main', 'color:white')
player:get_inventory():add_item('main', 'color:black')
player:get_inventory():add_item('main', 'color:red')
player:get_inventory():add_item('main', 'color:orange')
player:get_inventory():add_item('main', 'color:yellow')
player:get_inventory():add_item('main', 'color:pink')
player:get_inventory():add_item('main', 'color:green')
player:get_inventory():add_item('main', 'color:blue')
player.hud_set_hotbar_itemcount(player,8)
end)

-- Mobs

minetest.register_on_player_receive_fields(function(player, formname, fields)
		local name = player:get_player_name()
				if fields.mobs then --main page

				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'ccmobs:white_block')
player:get_inventory():add_item('main', 'ccmobs:black_block')
player:get_inventory():add_item('main', 'ccmobs:red_block')
player:get_inventory():add_item('main', 'ccmobs:orange_block')
player:get_inventory():add_item('main', 'ccmobs:yellow_block')
player:get_inventory():add_item('main', 'ccmobs:pink_block')
player:get_inventory():add_item('main', 'ccmobs:green_block')
player:get_inventory():add_item('main', 'ccmobs:blue_block')
player.hud_set_hotbar_itemcount(player,8)
end
end
)

-- Fence

minetest.register_on_player_receive_fields(function(player, formname, fields)
    local name = player:get_player_name()
    if fields.fence then --main page
        player:get_inventory():set_list("main", {})
        player:get_inventory():add_item('main', 'fence:white')
        player:get_inventory():add_item('main', 'fence:black')
        player:get_inventory():add_item('main', 'fence:red')
        player:get_inventory():add_item('main', 'fence:orange')
        player:get_inventory():add_item('main', 'fence:yellow')
        player:get_inventory():add_item('main', 'fence:pink')
        player:get_inventory():add_item('main', 'fence:green')
        player:get_inventory():add_item('main', 'fence:blue')
        player.hud_set_hotbar_itemcount(player,8)
    end
end)


-- Bench

minetest.register_on_player_receive_fields(function(player, formname, fields)
    local name = player:get_player_name()
    if fields.bench then --main page
        player:get_inventory():set_list("main", {})
        player:get_inventory():add_item('main', 'ts_furniture:color_white_bench')
        player:get_inventory():add_item('main', 'ts_furniture:color_black_bench')
        player:get_inventory():add_item('main', 'ts_furniture:color_red_bench')
        player:get_inventory():add_item('main', 'ts_furniture:color_orange_bench')
        player:get_inventory():add_item('main', 'ts_furniture:color_yellow_bench')
        player:get_inventory():add_item('main', 'ts_furniture:color_pink_bench')
        player:get_inventory():add_item('main', 'ts_furniture:color_green_bench')
        player:get_inventory():add_item('main', 'ts_furniture:color_blue_bench')
        player.hud_set_hotbar_itemcount(player,8)
    end
end)

-- Chair

minetest.register_on_player_receive_fields(function(player, formname, fields)
    local name = player:get_player_name()
    if fields.chair then --main page
        player:get_inventory():set_list("main", {})
        player:get_inventory():add_item('main', 'ts_furniture:color_white_chair')
        player:get_inventory():add_item('main', 'ts_furniture:color_black_chair')
        player:get_inventory():add_item('main', 'ts_furniture:color_red_chair')
        player:get_inventory():add_item('main', 'ts_furniture:color_orange_chair')
        player:get_inventory():add_item('main', 'ts_furniture:color_yellow_chair')
        player:get_inventory():add_item('main', 'ts_furniture:color_pink_chair')
        player:get_inventory():add_item('main', 'ts_furniture:color_green_chair')
        player:get_inventory():add_item('main', 'ts_furniture:color_blue_chair')
        player.hud_set_hotbar_itemcount(player,8)
    end
end)

-- Tiny Table

minetest.register_on_player_receive_fields(function(player, formname, fields)
    local name = player:get_player_name()
    if fields.tinytable then --main page
        player:get_inventory():set_list("main", {})
        player:get_inventory():add_item('main', 'ts_furniture:color_white_tiny_table')
        player:get_inventory():add_item('main', 'ts_furniture:color_black_tiny_table')
        player:get_inventory():add_item('main', 'ts_furniture:color_red_tiny_table')
        player:get_inventory():add_item('main', 'ts_furniture:color_orange_tiny_table')
        player:get_inventory():add_item('main', 'ts_furniture:color_yellow_tiny_table')
        player:get_inventory():add_item('main', 'ts_furniture:color_pink_tiny_table')
        player:get_inventory():add_item('main', 'ts_furniture:color_green_tiny_table')
        player:get_inventory():add_item('main', 'ts_furniture:color_blue_tiny_table')
        player.hud_set_hotbar_itemcount(player,8)
    end
end)
-- Small Table

minetest.register_on_player_receive_fields(function(player, formname, fields)
    local name = player:get_player_name()
    if fields.smalltable then --main page
        player:get_inventory():set_list("main", {})
        player:get_inventory():add_item('main', 'ts_furniture:color_white_small_table')
        player:get_inventory():add_item('main', 'ts_furniture:color_black_small_table')
        player:get_inventory():add_item('main', 'ts_furniture:color_red_small_table')
        player:get_inventory():add_item('main', 'ts_furniture:color_orange_small_table')
        player:get_inventory():add_item('main', 'ts_furniture:color_yellow_small_table')
        player:get_inventory():add_item('main', 'ts_furniture:color_pink_small_table')
        player:get_inventory():add_item('main', 'ts_furniture:color_green_small_table')
        player:get_inventory():add_item('main', 'ts_furniture:color_blue_small_table')
        player.hud_set_hotbar_itemcount(player,8)
    end
end)
-- Table

minetest.register_on_player_receive_fields(function(player, formname, fields)
    local name = player:get_player_name()
    if fields.table then --main page
        player:get_inventory():set_list("main", {})
        player:get_inventory():add_item('main', 'ts_furniture:color_white_table')
        player:get_inventory():add_item('main', 'ts_furniture:color_black_table')
        player:get_inventory():add_item('main', 'ts_furniture:color_red_table')
        player:get_inventory():add_item('main', 'ts_furniture:color_orange_table')
        player:get_inventory():add_item('main', 'ts_furniture:color_yellow_table')
        player:get_inventory():add_item('main', 'ts_furniture:color_pink_table')
        player:get_inventory():add_item('main', 'ts_furniture:color_green_table')
        player:get_inventory():add_item('main', 'ts_furniture:color_blue_table')
        player.hud_set_hotbar_itemcount(player,8)
    end
end)


-- Trapdoor

minetest.register_on_player_receive_fields(function(player, formname, fields)
		local name = player:get_player_name()
				if fields.trapdoor then --main page

				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'doors:trapdoor_white')
player:get_inventory():add_item('main', 'doors:trapdoor_black')
player:get_inventory():add_item('main', 'doors:trapdoor_red')
player:get_inventory():add_item('main', 'doors:trapdoor_orange')
player:get_inventory():add_item('main', 'doors:trapdoor_yellow')
player:get_inventory():add_item('main', 'doors:trapdoor_pink')
player:get_inventory():add_item('main', 'doors:trapdoor_green')
player:get_inventory():add_item('main', 'doors:trapdoor_blue')
player.hud_set_hotbar_itemcount(player,8)

end
end
)


-- Carpets

minetest.register_on_player_receive_fields(function(player, formname, fields)
		local name = player:get_player_name()
				if fields.carpets then --main page

				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'carpet:white')
player:get_inventory():add_item('main', 'carpet:black')
player:get_inventory():add_item('main', 'carpet:red')
player:get_inventory():add_item('main', 'carpet:orange')
player:get_inventory():add_item('main', 'carpet:yellow')
player:get_inventory():add_item('main', 'carpet:pink')
player:get_inventory():add_item('main', 'carpet:green')
player:get_inventory():add_item('main', 'carpet:blue')
player.hud_set_hotbar_itemcount(player,8)

end
end
)


-- Doors

minetest.register_on_player_receive_fields(function(player, formname, fields)
		local name = player:get_player_name()
				if fields.doors then --main page

				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'doors:door_white')
player:get_inventory():add_item('main', 'doors:door_black')
player:get_inventory():add_item('main', 'doors:door_red')
player:get_inventory():add_item('main', 'doors:door_orange')
player:get_inventory():add_item('main', 'doors:door_yellow')
player:get_inventory():add_item('main', 'doors:door_pink')
player:get_inventory():add_item('main', 'doors:door_green')
player:get_inventory():add_item('main', 'doors:door_blue')
player.hud_set_hotbar_itemcount(player,8)

end
end
)

-- Waters

minetest.register_on_player_receive_fields(function(player, formname, fields)
	local name = player:get_player_name()
    if player and minetest.check_player_privs(player, {spill=true}) then
        if fields.waters then --main page
            player:get_inventory():set_list("main", {})
            player:get_inventory():add_item('main', 'water:white_water_source')
            player:get_inventory():add_item('main', 'water:black_water_source')
            player:get_inventory():add_item('main', 'water:red_water_source')
            player:get_inventory():add_item('main', 'water:orange_water_source')
            player:get_inventory():add_item('main', 'water:yellow_water_source')
            player:get_inventory():add_item('main', 'water:pink_water_source')
            player:get_inventory():add_item('main', 'water:green_water_source')
            player:get_inventory():add_item('main', 'water:blue_water_source')
            player.hud_set_hotbar_itemcount(player,8)
        end
    end
end
)

-- Lights

minetest.register_on_player_receive_fields(function(player, formname, fields)
		local name = player:get_player_name()
				if fields.lights then --main page

				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'light:white')
player:get_inventory():add_item('main', 'light:black')
player:get_inventory():add_item('main', 'light:red')
player:get_inventory():add_item('main', 'light:orange')
player:get_inventory():add_item('main', 'light:yellow')
player:get_inventory():add_item('main', 'light:pink')
player:get_inventory():add_item('main', 'light:green')
player:get_inventory():add_item('main', 'light:blue')
player.hud_set_hotbar_itemcount(player,8)
end
end
)

-- Blocks

minetest.register_on_player_receive_fields(function(player, formname, fields)
		local name = player:get_player_name()
				if fields.blocks then --main page

player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'color:white')
player:get_inventory():add_item('main', 'color:black')
player:get_inventory():add_item('main', 'color:red')
player:get_inventory():add_item('main', 'color:orange')
player:get_inventory():add_item('main', 'color:yellow')
player:get_inventory():add_item('main', 'color:pink')
player:get_inventory():add_item('main', 'color:green')
player:get_inventory():add_item('main', 'color:blue')
player.hud_set_hotbar_itemcount(player,8)

end
end
)

-- Windows

minetest.register_on_player_receive_fields(function(player, formname, fields)
		local name = player:get_player_name()
				if fields.windows then --main page

player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'glass:white')
player:get_inventory():add_item('main', 'glass:black')
player:get_inventory():add_item('main', 'glass:red')
player:get_inventory():add_item('main', 'glass:orange')
player:get_inventory():add_item('main', 'glass:yellow')
player:get_inventory():add_item('main', 'glass:pink')
player:get_inventory():add_item('main', 'glass:green')
player:get_inventory():add_item('main', 'glass:blue')
player.hud_set_hotbar_itemcount(player,8)

end
end
)

-- Stairs

minetest.register_on_player_receive_fields(function(player, formname, fields)
		local name = player:get_player_name()
				if fields.stairs then --main page

				 player:get_inventory():set_list("main", {})

player:get_inventory():add_item('main', 'stairs:stair_white')
player:get_inventory():add_item('main', 'stairs:stair_black')
player:get_inventory():add_item('main', 'stairs:stair_red')
player:get_inventory():add_item('main', 'stairs:stair_orange')
player:get_inventory():add_item('main', 'stairs:stair_yellow')
player:get_inventory():add_item('main', 'stairs:stair_pink')
player:get_inventory():add_item('main', 'stairs:stair_green')
player:get_inventory():add_item('main', 'stairs:stair_blue')
player.hud_set_hotbar_itemcount(player,8)


end
end
)

-- Stairs
minetest.register_on_player_receive_fields(function(player, formname, fields)
    local name = player:get_player_name()
    if fields.stair_inner then --main page
        player:get_inventory():set_list("main", {})
        player:get_inventory():add_item('main', 'stairs:stair_inner_white')
        player:get_inventory():add_item('main', 'stairs:stair_inner_black')
        player:get_inventory():add_item('main', 'stairs:stair_inner_red')
        player:get_inventory():add_item('main', 'stairs:stair_inner_orange')
        player:get_inventory():add_item('main', 'stairs:stair_inner_yellow')
        player:get_inventory():add_item('main', 'stairs:stair_inner_pink')
        player:get_inventory():add_item('main', 'stairs:stair_inner_green')
        player:get_inventory():add_item('main', 'stairs:stair_inner_blue')
        player.hud_set_hotbar_itemcount(player,8)
    end
end
)
-- Stairs
minetest.register_on_player_receive_fields(function(player, formname, fields)
    local name = player:get_player_name()
    if fields.stair_outer then --main page
        player:get_inventory():set_list("main", {})
        player:get_inventory():add_item('main', 'stairs:stair_outer_white')
        player:get_inventory():add_item('main', 'stairs:stair_outer_black')
        player:get_inventory():add_item('main', 'stairs:stair_outer_red')
        player:get_inventory():add_item('main', 'stairs:stair_outer_orange')
        player:get_inventory():add_item('main', 'stairs:stair_outer_yellow')
        player:get_inventory():add_item('main', 'stairs:stair_outer_pink')
        player:get_inventory():add_item('main', 'stairs:stair_outer_green')
        player:get_inventory():add_item('main', 'stairs:stair_outer_blue')
        player.hud_set_hotbar_itemcount(player,8)
    end
end
)


-- Slabs

minetest.register_on_player_receive_fields(
    function(player, formname, fields)
        local name = player:get_player_name()
        if fields.slabs then --main page
            player:get_inventory():set_list("main", {})
            player:get_inventory():add_item('main', 'stairs:slab_white')
            player:get_inventory():add_item('main', 'stairs:slab_black')
            player:get_inventory():add_item('main', 'stairs:slab_red')
            player:get_inventory():add_item('main', 'stairs:slab_orange')
            player:get_inventory():add_item('main', 'stairs:slab_yellow')
            player:get_inventory():add_item('main', 'stairs:slab_pink')
            player:get_inventory():add_item('main', 'stairs:slab_green')
            player:get_inventory():add_item('main', 'stairs:slab_blue')
            player.hud_set_hotbar_itemcount(player,8)
        end
    end
)

-- wool
minetest.register_on_player_receive_fields(
    function(player, formname, fields)
        local name = player:get_player_name()
        if fields.wool then --main page
            player:get_inventory():set_list("main", {})
            player:get_inventory():add_item('main', 'wool:white')
            player:get_inventory():add_item('main', 'wool:black')
            player:get_inventory():add_item('main', 'wool:red')
            player:get_inventory():add_item('main', 'wool:orange')
            player:get_inventory():add_item('main', 'wool:yellow')
            player:get_inventory():add_item('main', 'wool:pink')
            player:get_inventory():add_item('main', 'wool:green')
            player:get_inventory():add_item('main', 'wool:blue')
            player.hud_set_hotbar_itemcount(player,8)
        end
    end
)

-- cblocksglass
minetest.register_on_player_receive_fields(
    function(player, formname, fields)
        local name = player:get_player_name()
        if fields.cglass then --main page
            player:get_inventory():set_list("main", {})
            player:get_inventory():add_item('main', 'cblocks:glass_white')
            player:get_inventory():add_item('main', 'cblocks:glass_black')
            player:get_inventory():add_item('main', 'cblocks:glass_red')
            player:get_inventory():add_item('main', 'cblocks:glass_orange')
            player:get_inventory():add_item('main', 'cblocks:glass_yellow')
            player:get_inventory():add_item('main', 'cblocks:glass_pink')
            player:get_inventory():add_item('main', 'cblocks:glass_green')
            player:get_inventory():add_item('main', 'cblocks:glass_blue')
            player.hud_set_hotbar_itemcount(player,8)
        end
    end
)

-- brick
minetest.register_on_player_receive_fields(
    function(player, formname, fields)
        local name = player:get_player_name()
        if fields.cbrick then --main page
            player:get_inventory():set_list("main", {})
            player:get_inventory():add_item('main', 'cblocks:stonebrick_white')
            player:get_inventory():add_item('main', 'cblocks:stonebrick_black')
            player:get_inventory():add_item('main', 'cblocks:stonebrick_red')
            player:get_inventory():add_item('main', 'cblocks:stonebrick_orange')
            player:get_inventory():add_item('main', 'cblocks:stonebrick_yellow')
            player:get_inventory():add_item('main', 'cblocks:stonebrick_pink')
            player:get_inventory():add_item('main', 'cblocks:stonebrick_green')
            player:get_inventory():add_item('main', 'cblocks:stonebrick_blue')
            player.hud_set_hotbar_itemcount(player,8)
        end
    end
)

-- wood
minetest.register_on_player_receive_fields(
    function(player, formname, fields)
        local name = player:get_player_name()
        if fields.cwood then --main page
            player:get_inventory():set_list("main", {})
            player:get_inventory():add_item('main', 'cblocks:wood_white')
            player:get_inventory():add_item('main', 'cblocks:wood_black')
            player:get_inventory():add_item('main', 'cblocks:wood_red')
            player:get_inventory():add_item('main', 'cblocks:wood_orange')
            player:get_inventory():add_item('main', 'cblocks:wood_yellow')
            player:get_inventory():add_item('main', 'cblocks:wood_pink')
            player:get_inventory():add_item('main', 'cblocks:wood_green')
            player:get_inventory():add_item('main', 'cblocks:wood_blue')
            player.hud_set_hotbar_itemcount(player,8)
        end
    end
)

-- slope
minetest.register_on_player_receive_fields(
    function(player, formname, fields)
        local name = player:get_player_name()
        if fields.slope then --main page
            player:get_inventory():set_list("main", {})
            player:get_inventory():add_item('main', 'slope:slope_white')
            player:get_inventory():add_item('main', 'slope:slope_black')
            player:get_inventory():add_item('main', 'slope:slope_red')
            player:get_inventory():add_item('main', 'slope:slope_orange')
            player:get_inventory():add_item('main', 'slope:slope_yellow')
            player:get_inventory():add_item('main', 'slope:slope_pink')
            player:get_inventory():add_item('main', 'slope:slope_green')
            player:get_inventory():add_item('main', 'slope:slope_blue')
            player.hud_set_hotbar_itemcount(player,8)
        end
    end
)

-- slope
minetest.register_on_player_receive_fields(
    function(player, formname, fields)
        local name = player:get_player_name()
        if fields.islope then --main page
            player:get_inventory():set_list("main", {})
            player:get_inventory():add_item('main', 'slope:icorner_white')
            player:get_inventory():add_item('main', 'slope:icorner_black')
            player:get_inventory():add_item('main', 'slope:icorner_red')
            player:get_inventory():add_item('main', 'slope:icorner_orange')
            player:get_inventory():add_item('main', 'slope:icorner_yellow')
            player:get_inventory():add_item('main', 'slope:icorner_pink')
            player:get_inventory():add_item('main', 'slope:icorner_green')
            player:get_inventory():add_item('main', 'slope:icorner_blue')
            player.hud_set_hotbar_itemcount(player,8)
        end
    end
)

-- slope
minetest.register_on_player_receive_fields(
    function(player, formname, fields)
        local name = player:get_player_name()
        if fields.oslope then --main page
            player:get_inventory():set_list("main", {})
            player:get_inventory():add_item('main', 'slope:ocorner_white')
            player:get_inventory():add_item('main', 'slope:ocorner_black')
            player:get_inventory():add_item('main', 'slope:ocorner_red')
            player:get_inventory():add_item('main', 'slope:ocorner_orange')
            player:get_inventory():add_item('main', 'slope:ocorner_yellow')
            player:get_inventory():add_item('main', 'slope:ocorner_pink')
            player:get_inventory():add_item('main', 'slope:ocorner_green')
            player:get_inventory():add_item('main', 'slope:ocorner_blue')
            player.hud_set_hotbar_itemcount(player,8)
        end
    end
)

-- cone
minetest.register_on_player_receive_fields(
    function(player, formname, fields)
        local name = player:get_player_name()
        if fields.cone then --main page
            player:get_inventory():set_list("main", {})
            player:get_inventory():add_item('main', 'slope:cone_white')
            player:get_inventory():add_item('main', 'slope:cone_black')
            player:get_inventory():add_item('main', 'slope:cone_red')
            player:get_inventory():add_item('main', 'slope:cone_orange')
            player:get_inventory():add_item('main', 'slope:cone_yellow')
            player:get_inventory():add_item('main', 'slope:cone_pink')
            player:get_inventory():add_item('main', 'slope:cone_green')
            player:get_inventory():add_item('main', 'slope:cone_blue')
            player.hud_set_hotbar_itemcount(player,8)
        end
    end
)

-- cylinder
minetest.register_on_player_receive_fields(
    function(player, formname, fields)
        local name = player:get_player_name()
        if fields.cylinder then --main page
            player:get_inventory():set_list("main", {})
            player:get_inventory():add_item('main', 'slope:cylinder_white')
            player:get_inventory():add_item('main', 'slope:cylinder_black')
            player:get_inventory():add_item('main', 'slope:cylinder_red')
            player:get_inventory():add_item('main', 'slope:cylinder_orange')
            player:get_inventory():add_item('main', 'slope:cylinder_yellow')
            player:get_inventory():add_item('main', 'slope:cylinder_pink')
            player:get_inventory():add_item('main', 'slope:cylinder_green')
            player:get_inventory():add_item('main', 'slope:cylinder_blue')
            player.hud_set_hotbar_itemcount(player,8)
        end
    end
)

-- cone
minetest.register_on_player_receive_fields(
    function(player, formname, fields)
        local name = player:get_player_name()
        if fields.sphere then --main page
            player:get_inventory():set_list("main", {})
            player:get_inventory():add_item('main', 'slope:sphere_white')
            player:get_inventory():add_item('main', 'slope:sphere_black')
            player:get_inventory():add_item('main', 'slope:sphere_red')
            player:get_inventory():add_item('main', 'slope:sphere_orange')
            player:get_inventory():add_item('main', 'slope:sphere_yellow')
            player:get_inventory():add_item('main', 'slope:sphere_pink')
            player:get_inventory():add_item('main', 'slope:sphere_green')
            player:get_inventory():add_item('main', 'slope:sphere_blue')
            player.hud_set_hotbar_itemcount(player,8)
        end
    end
)

-- long
minetest.register_on_player_receive_fields(
    function(player, formname, fields)
        local name = player:get_player_name()
        if fields.long then --main page
            player:get_inventory():set_list("main", {})
            player:get_inventory():add_item('main', 'slope:slopelong_white')
            player:get_inventory():add_item('main', 'slope:slopelong_black')
            player:get_inventory():add_item('main', 'slope:slopelong_red')
            player:get_inventory():add_item('main', 'slope:slopelong_orange')
            player:get_inventory():add_item('main', 'slope:slopelong_yellow')
            player:get_inventory():add_item('main', 'slope:slopelong_pink')
            player:get_inventory():add_item('main', 'slope:slopelong_green')
            player:get_inventory():add_item('main', 'slope:slopelong_blue')
            player.hud_set_hotbar_itemcount(player,8)
        end
    end
)


-- Tools

minetest.register_on_player_receive_fields(function(player, formname, fields)
    local name = player:get_player_name()
    if fields.tools then --main page
        player:get_inventory():set_list("main", {})
        player:get_inventory():add_item('main', 'screwdriver:screwdriver')
        player:get_inventory():add_item('main', 'stuff:ladder')
        player:get_inventory():add_item('main', 'carts:cart')
        player:get_inventory():add_item('main', 'carts:powerrail')
        player:get_inventory():add_item('main', 'beds:bed')
        player:get_inventory():add_item('main', 'boats:boat')
        player:get_inventory():add_item('main', 'simple_protection:claim')
        player:get_inventory():add_item('main', 'orbs_of_time:orb_dawn')
        player:get_inventory():add_item('main', 'orbs_of_time:orb_dusk')
        player.hud_set_hotbar_itemcount(player,9)
    end
end )


minetest.register_on_player_receive_fields(function(player, formname, fields)
    local name = player:get_player_name()
    if fields.number then --main page
        player:get_inventory():set_list("main", {})
        player:get_inventory():add_item('main', 'spell:number_1')
        player:get_inventory():add_item('main', 'spell:number_2')
        player:get_inventory():add_item('main', 'spell:number_3')
        player:get_inventory():add_item('main', 'spell:number_4')
        player:get_inventory():add_item('main', 'spell:number_5')
        player:get_inventory():add_item('main', 'spell:number_6')
        player:get_inventory():add_item('main', 'spell:number_7')
        player:get_inventory():add_item('main', 'spell:number_8')
        player:get_inventory():add_item('main', 'spell:number_9')
        player:get_inventory():add_item('main', 'spell:number_0')
        player.hud_set_hotbar_itemcount(player,10)
    end
end )

minetest.register_on_player_receive_fields(function(player, formname, fields)
    local name = player:get_player_name()
    if fields.alpha1 then --main page
        player:get_inventory():set_list("main", {})
        player:get_inventory():add_item('main', 'spell:letter_A')
        player:get_inventory():add_item('main', 'spell:letter_B')
        player:get_inventory():add_item('main', 'spell:letter_C')
        player:get_inventory():add_item('main', 'spell:letter_D')
        player:get_inventory():add_item('main', 'spell:letter_E')
        player:get_inventory():add_item('main', 'spell:letter_F')
        player:get_inventory():add_item('main', 'spell:letter_G')
        player:get_inventory():add_item('main', 'spell:letter_H')
        player:get_inventory():add_item('main', 'spell:letter_I')
        player:get_inventory():add_item('main', 'spell:letter_J')
        player:get_inventory():add_item('main', 'spell:letter_K')
        player:get_inventory():add_item('main', 'spell:letter_L')
        player:get_inventory():add_item('main', 'spell:letter_M')
        player.hud_set_hotbar_itemcount(player,13)
    end
end )


minetest.register_on_player_receive_fields(function(player, formname, fields)
    local name = player:get_player_name()
    if fields.alpha2 then --main page
        player:get_inventory():set_list("main", {})
        player:get_inventory():add_item('main', 'spell:letter_N')
        player:get_inventory():add_item('main', 'spell:letter_O')
        player:get_inventory():add_item('main', 'spell:letter_P')
        player:get_inventory():add_item('main', 'spell:letter_Q')
        player:get_inventory():add_item('main', 'spell:letter_R')
        player:get_inventory():add_item('main', 'spell:letter_S')
        player:get_inventory():add_item('main', 'spell:letter_T')
        player:get_inventory():add_item('main', 'spell:letter_U')
        player:get_inventory():add_item('main', 'spell:letter_V')
        player:get_inventory():add_item('main', 'spell:letter_W')
        player:get_inventory():add_item('main', 'spell:letter_X')
        player:get_inventory():add_item('main', 'spell:letter_Y')
        player:get_inventory():add_item('main', 'spell:letter_Z')
        player.hud_set_hotbar_itemcount(player,13)
    end
end )

