if extras.box then
    minetest.register_privilege("outlander", { description = "Can go more than "..extras.boxsize.." blocks from spawn." })
    local tick = 0
    local boxsize = extras.boxsize
    local spawnpoint = extras.spawnpoint
    local function do_services ( )
        if tick==12 then tick=0 else tick=tick+1 end
        for _, player in ipairs(minetest.get_connected_players()) do
            local name = player:get_player_name()
            local privs = minetest.get_player_privs(name)
            if extras.box then
                -- help the wanderers return to spawn
                local edge = boxsize
                if privs.outlander then edge = 32767 end
                local pos = vector.round(player:getpos())
                if math.abs(spawnpoint.x-pos.x) > edge  or math.abs(spawnpoint.y-pos.y) > edge or math.abs(spawnpoint.z-pos.z) >edge then
                    minetest.chat_send_all("player "..name.." went too far from spawn (limited to "..edge.." blocks)")
                    player:setpos(spawnpoint)
                end
            end

            -- thin out the slow connections
            if tick==0 and extras.pingkick then
                if name ~= nil then
                    local pinf = minetest.get_player_information(name)
                    if pinf then
                        local ping = pinf.avg_rtt / 2
                        ping = math.floor(ping * 1000)
                        if ping > 200 then
                            minetest.kick_player(name, "You were kicked for high ping. This server is in LONDON, try a server closer to you or fix your internet connection")
                            minetest.chat_send_all(name .. ". was kicked for high ping (" .. ping .. ")")
                        end
                    end
                end
            end
        end
        minetest.after(5, do_services)
    end
    minetest.after(60, do_services)
end

if extras.safepvp then
    local spawn = 11
    if minetest.register_on_punchplayer then
        minetest.register_on_punchplayer(function(player, hitter, time_from_last_punch, tool_capabilities, dir, damage)
            if not player or not hitter then
                return false
            end
            if (not hitter:is_player()) or (not player:is_player())then
                return false
            end
            local pos = player:get_pos()
            if math.abs(spawnpoint.x-pos.x) < spawn  and math.abs(spawnpoint.y-pos.y) < spawn and math.abs(spawnpoint.z-pos.z) < spawn then
                minetest.chat_send_player(hitter:get_player_name(), "NO PvP in spawn area")
                return true
            end
            if minetest.is_protected(pos, hitter:get_player_name()) then
                minetest.chat_send_player(player:get_player_name(), hitter:get_player_name().." was stopped from hitting you.")
                minetest.chat_send_player(hitter:get_player_name(), player:get_player_name().." is protected here.")
                return true
            end
            return false
        end)
    end
end
