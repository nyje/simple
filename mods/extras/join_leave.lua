

-- minetest.register_on_newplayer( function(player)
--     minetest.chat_send_all("Everyone welcome our new player "..player:get_player_name().." to CITY2." )
-- end )

minetest.register_privilege("isplayer", { description = "Allows one to keep your creations on the server" })


minetest.register_on_joinplayer( function(player)
    --minetest.chat_send_all("Welcome back "..player:get_player_name()..".")
    --minetest.after(0, player.override_day_night_ratio, player, 1)
    --if minetest.get_player_privs(player:get_player_name()).ui_full then
    minetest.after(0, player.hud_set_hotbar_itemcount, player, extras.playerhotbar)
    --end
end )

minetest.register_on_leaveplayer(function(player)
	--minetest.chat_send_all(player:get_player_name().." has left this awesome game.")
    if extras.empty then
        if #minetest.get_connected_players()==0 then
            minetest.request_shutdown("Server Reset :-)", true, 1)
        end
    end
end)

-- keyword privs system
-- minetest.register_privilege("nin", "Can enter keyword to get interact")
-- local kwds = {  BingoBongoBungo = {"interact","creative","interact","fast","fly","noclip","home"} }
-- minetest.register_on_chat_message(function(name, message)
--     local privs = minetest.get_player_privs(name)
--     for kw,np in pairs(kwds) do
--         if message == kw then
--             for _,priv in pairs(np) do
--                 privs[priv] = 1
--                 if priv == "interact" then
--                     privs.nin = nil
--                 end
--             end
--             minetest.chat_send_all("<Server> player, "..name.." has the keyword and is granted "..dump(np).."!")
--             if minetest.get_modpath("irc") then
--                 irc:say(("* %s%s"):format("", "player, "..name.." Read the rules and has been granted "..dump(np).."!"))
--             end
--             minetest.set_player_privs(name, privs)
--             return true
--         end
--     end
-- end)

if extras.autorollback then
    minetest.register_on_leaveplayer(function(player)
        local name = player:get_player_name()
        local found = false
        if not extras.isplayer then
            if extras.autorollback then
                local inv = player:get_inventory()
                for i=1,32,1 do
                    if inv:get_stack("main",i):get_count() > 0 then
                        if inv:get_stack("main",i):get_name()=="default:skeleton_key" then
                            found=true
                        end
                    end
                    if inv:get_stack("craft",i):get_count() > 0 then
                        if inv:get_stack("craft",i):get_name()=="default:skeleton_key" then
                            found=true
                        end
                    end
                end
            end
        else
            if minetest.check_player_privs(player, {isplayer=true}) then
                found = true
            end
        end
        if not found==true then
            if not extras.isplayer then
                minetest.chat_send_all(name.." did not carry a key.. their work has been removed.")
                minetest.log(name.." did not carry a key.. their work has been removed.")
                minetest.rollback_revert_actions_by("player:"..name,43200)
                --local f = (io.open(minetest.get_worldpath("external_cmd").."/message", "w"))
                --f:write("/rollback "..player:name.." 43200")
                --f:close()
            else
                minetest.chat_send_all(name.." is not a registered player... their work has been removed.")
                minetest.log(name.." is not a registered player... their work has been removed.")
                minetest.rollback_revert_actions_by("player:"..name,43200)
            end

        end
    end )
end
