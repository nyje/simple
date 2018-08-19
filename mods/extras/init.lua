--
extras={}
    extras.playerhotbar     = tonumber(minetest.setting_get("playerhotbar")) or 16
    extras.path             = minetest.get_modpath("extras")
    extras.spawnpoint       = minetest.setting_get_pos("static_spawnpoint") or {x=0, y=15, z=0}
    extras.box              = minetest.setting_getbool("playerbox") or nil
    extras.boxsize          = tonumber(minetest.setting_get("playerboxsize")) or 512
    extras.pingkick         = minetest.setting_getbool("pingkick") or nil
    extras.autorollback     = minetest.setting_getbool("autorollback") or nil
    extras.isplayer         = minetest.setting_getbool("isplayer") or nil
    extras.recrafting       = minetest.setting_getbool("recrafting") or nil
    extras.safepvp          = minetest.setting_getbool("safepvp") or nil
    extras.jail             = minetest.setting_getbool("jail") or nil
    extras.crash            = minetest.setting_getbool("crash_to_reset") or nil
    extras.empty            = minetest.setting_getbool("restart_if_empty") or nil
    extras.nospawn          = minetest.setting_getbool("restart_if_empty") or nil

if minetest.get_modpath("technic") then
    if minetest.get_modpath("blox") then
		minetest.register_craft({
			output = "blox:bloodbane",
			recipe = {
				{ "technic:blue_energy_crystal","technic:composite_plate","technic:blue_energy_crystal"},
				{ "technic:blue_energy_crystal","technic:composite_plate","technic:blue_energy_crystal"},
				{ "","technic:carbon_plate",""},
			}
		})
    end
end

dofile(extras.path .. "/join_leave.lua")
dofile(extras.path .. "/nodes.lua")
dofile(extras.path .. "/box.lua")
dofile(extras.path .. "/jail.lua")
dofile(extras.path .. "/recrafting.lua")

extras.setprivs_jailed = function ( name)
    minetest.chat_send_all("*************************")
    minetest.chat_send_all(name.." has had all privs removed.")
    minetest.chat_send_all("*************************")
    minetest.chat_send_all(name.." is granted shout to explain themselves...")
    local privs = {}
    privs.shout = true
    minetest.set_player_privs(name, privs)
    return true
end

extras.setprivs_released = function ( name)
    minetest.chat_send_all(name.." is reset to basic privs.")
    local privs = {}
    privs.home = true
    privs.fly = true
    privs.fast = true
    privs.ui_full= true
    privs.shout = true
    privs.interact = true
    minetest.set_player_privs(name, privs)
    return true
end

minetest.register_privilege("ismod", { description = "Allows one to promote players" })

minetest.register_chatcommand("rbc", {
    description = "who built it?",
    privs = {ismod = true},
    func = function( name, param)
        local cmd_def = minetest.chatcommands["rollback_check"]
        if cmd_def then
            minetest.chat_send_player(name, "Punch a node to ID builder...")
			cmd_def.func(name, "rollback_check 1 100000000")
		end
        return false
    end,
    })

minetest.register_chatcommand("pr", {
    description = "Promote to Player",
    privs = {ismod = true},
    func = function( name, param)
        minetest.chat_send_all("Player "..param.." is promoted to PLAYER, They can now build beyond the wall.")
        local privs = minetest.get_player_privs(param)
        privs.spill = true
        privs.outlander = true
        privs.noclip = true
        minetest.set_player_privs(param, privs)
        return false
    end,
    })

minetest.register_chatcommand("rb", {
    description = "Demote & rollback Player",
    privs = {ismod = true},
    func = function( name, param)
        local cmd_def = minetest.chatcommands["revoke"]
        if cmd_def then
            minetest.chat_send_all("Player "..param.." has privs removed, and all their work is being removed from the game.")
            local privs = minetest.get_player_privs(param)
            privs.spill = nil
            privs.outlander = nil
            privs.noclip = nil
            minetest.set_player_privs(param, privs)
		end
        local cmd_def = minetest.chatcommands["rollback"]
        if cmd_def then
			cmd_def.func(name, "rollback "..param.." 100000000")
		end
        return false
    end,
    })


minetest.register_chatcommand("priv0", {
    description = "Clear privs, ADD shout.",
    privs = {server = true},
    func = function( name, param)
        if param==""  or name=="" then
            minetest.chat_send_player(name, "I need a name...")
            return false
        end
        extras.setprivs_jailed( param)
    end,
    })


minetest.register_chatcommand("priv1", {
    description = "Clear privs, ADD home,fast,fly,shout,ui_full.",
    privs = {server = true},
    func = function( name, param)
        if param==""  or name=="" then
            minetest.chat_send_player(name, "I need a name...")
            return false
        end
        extras.setprivs_released( param)
    end,
    })

minetest.register_chatcommand("priv2", {
    description = "ADD zoom,teleport,areas_high_limit,playerinfo,spill,poi,outlander.",
    privs = {server = true},
    func = function ( name, param )
        if param==""  or name=="" then
            minetest.chat_send_player(name, "I need a name...")
            return false
        end
        --local player = minetest.get_player_by_name(param)
        local privs = minetest.get_player_privs(param)
        minetest.chat_send_all(param.." is promoted to Executive Player Privs")
        privs.zoom = true
        privs.teleport = true
        privs.areas_high_limit = true
        privs.playerinfo = true
        privs.spill = true
        privs.poi = true
        privs.outlander = true
        minetest.set_player_privs(param, privs)
        return true
    end,
    })

minetest.register_chatcommand("priv3", {
    description = "ADD zoom,teleport,areas_high_limit,playerinfo,spill,poi,outlander AND bring,kick,noclip,protection_bypass,give.",
    privs = {server = true},
    func = function ( name, param )
        if param==""  or name=="" then
            minetest.chat_send_player(name, "I need a name...")
            return false
        end
        local privs = minetest.get_player_privs(param)
        minetest.chat_send_all(param.." is promoted to Moderator Privs")
        privs.zoom = true
        privs.teleport = true
        privs.areas_high_limit = true
        privs. playerinfo = true
        privs.spill = true
        privs.poi = true
        privs.outlander = true
        privs.bring = true
        privs.kick = true
        privs.noclip = true
        privs.protection_bypass = true
        privs.give = true
        minetest.set_player_privs(param, privs)
        return true
    end,
    })

if not extras.nospawn then
    minetest.register_chatcommand("spawn", {
        description = "Teleport player to spawn point.",
        privs = {interact=true},
        func = function ( name, param )
            local player = minetest.get_player_by_name(name)
            minetest.chat_send_player(player:get_player_name(), "Teleporting to spawn...")
            player:setpos(extras.spawnpoint)
            return true
        end,
    })
end


minetest.register_chatcommand("afk", {
    description = "Tell everyone you are afk.",
	privs = {interact=true},
    func = function ( name, param )
        local player = minetest.get_player_by_name(name)
        minetest.chat_send_all(name.." is AFK! "..param)
        return true
    end,
})

if extras.crash then
    minetest.register_chatcommand("r", {
        description = "Reset the server.",
        privs = {server=true},
        func = function ( name, param )
        --boop.boom(bob)
        minetest.request_shutdown("   !!!!!  SERVER RESTART... COUNT TO 10 THEN PRESS RECONNECT !!!", true)
        end,
    })
end
