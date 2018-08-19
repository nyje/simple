-- spell  server management & toys
-- Created for Elektra's Creative Server
-- Contains code derived from "Jail Mod" By kaeza and RAPHAEL (mostly kaeza)
-- Extended by Nigel Garnett starting 2015-08-21
-- license: see license.txt


--------------------------------------------------------
--    local variables

local modname = "spell:"
local characters = {
    A = 1,
    B = 1,
    C = 1,
    D = 1,
    E = 1,
    F = 1,
    G = 1,
    H = 1,
    I = 1,
    J = 1,
    K = 1,
    L = 1,
    M = 1,
    N = 1,
    O = 1,
    P = 1,
    Q = 1,
    R = 1,
    S = 1,
    T = 1,
    U = 1,
    V = 1,
    W = 1,
    X = 1,
    Y = 1,
    Z = 1,
    [0] = 0,
    [1] = 0,
    [2] = 0,
    [3] = 0,
    [4] = 0,
    [5] = 0,
    [6] = 0,
    [7] = 0,
    [8] = 0,
    [9] = 0
}

----------------------------------------------------------
-- Register Nodes

for key,value in pairs(characters) do
    if value==1 then
        my_desc = "letter_"..key
--         minetest.register_node(modname.."Sign_"..key, {
--             description="Sign "..my_desc,
--             drawtype = "nodebox",
--             node_box = {
--                 type = "wallmounted",
--                 wall_top    = {-0.4875, 0.4875, -0.4875, 0.4875, 0.5, 0.4875},
--                 wall_bottom = {-0.4875, -0.5, -0.4875, 0.4875, -0.4875, 0.4875},
--                 wall_side   = {-0.5, -0.4875, -0.4875, -0.4875, 0.4875, 0.4875},
--             },
--             paramtype = "light",
--             paramtype2 = "wallmounted",
--             sunlight_propagates = true,
--             light_source = 14,
--             inventory_image = "sign_"..key..".png",
--             wield_image = "sign_"..key..".png",
--             tiles = { "sign_"..key..".png" },
--             groups = {cracky=1, choppy=1},
--             sounds = default.node_sound_wood_defaults(),
--         })
    else
        my_desc = "number_"..key
    end
--    minetest.register_alias(modname.."Letter_"..key,"rainbow:stoneblock_white")
	minetest.register_node(modname..my_desc, {
        description="Block "..key,
		tiles = { "spell_"..key..".png" },
		light_source = minetest.LIGHT_MAX,
        inventory_image = "spell_"..key..".png",
		groups = {snappy=2, cracky=3, choppy=3},
		sounds = default.node_sound_defaults(),
	})
end

