-- Jail. part of
-- spell mod server management & toys
-- Created for Elektra's Creative Server
-- Contains code derived from "Jail Mod" By kaeza and RAPHAEL (mostly kaeza)
-- Extended by Nigel Garnett starting 2015-08-21
-- license: see license.txt

if extras.jail then
    local modname = "extras:"
    local jail_data = {}
    local players_in_jail = { };
    local function table_empty(tab)
        for key in pairs(tab) do return false end
        return true
    end

    local function save_data ()
        if table_empty(jail_data) then
            return
        end
        local data = minetest.serialize( jail_data )
        local path = minetest.get_worldpath().."/jail.data"
        local file = io.open( path, "w" )
        if( file ) then
            file:write( data )
            file:close()
            return true
        else return nil
        end
    end

    local function load_data ()
        local path = minetest.get_worldpath().."/jail.data"
        local file = io.open( path, "r" )
        if( file ) then
            local data = file:read("*all")
            jail_data = minetest.deserialize( data )
            file:close()
            if table_empty(jail_data) then
                os.remove(path)
            end
        return true
        else return nil
        end
    end

    -- Jail Handler
    local function do_teleport ( )
        for name, player in pairs(players_in_jail) do
                player:setpos(jail_data.jailpos)
        end
        minetest.after(10, do_teleport)
    end
    minetest.after(10, do_teleport)


    if not load_data() then
        jail_data.jailpos = { x = 0, y = 5000, z = 0 }
        jail_data.releasepos = minetest.setting_get_pos("static_spawnpoint") or {x=0, y=15, z=0}
    end


    minetest.register_privilege("jail", { description = "Allows one to send/release prisoners" })
    minetest.register_privilege("setjail", { description = "Allows one to set the jail position and the release position" })

    minetest.register_chatcommand("setjail", {
        description = "Set the position of the Jail to where you are now. by Nigel for Sasha5.",
        privs = {setjail=true},
        func = function ( name, param )
            jail_data.jailpos = minetest.get_player_by_name(name):getpos()
            save_data()
            return true, "Jail position set."
        end,
    })

    minetest.register_chatcommand("setrelease", {
        description = "Set the release position to where you are now. by Nigel for Sasha5.",
        privs = {setjail=true},
        func = function ( name, param )
            jail_data.releasepos = minetest.get_player_by_name(name):getpos()
            save_data()
            return true, "Release position Set."
        end,
    })

    minetest.register_chatcommand("jail", {
        params = "<player>",
        description = "Sends a player to Jail",
        privs = {jail=true},
        func = function ( name, param )
            local player = minetest.get_player_by_name(param)
            if (player) then
                players_in_jail[param] = player;
                player:setpos(jail_data.jailpos)
                minetest.chat_send_all(""..param.." has been sent to jail by "..name.."")
                extras.setprivs_jailed(param)
            end
        end,
    })

    minetest.register_chatcommand("release", {
        params = "<player>",
        description = "Releases a player from Jail",
        privs = {jail=true},
        func = function ( name, param )
            if (param == "") then return end
            local player = minetest.get_player_by_name(param)
            players_in_jail[param] = nil;
            if (player) then
                player:setpos(jail_data.releasepos)
                minetest.chat_send_all(""..param.." has been released from jail by "..name.."")
                extras.setprivs_released(param)
            end
        end,
    })
end


