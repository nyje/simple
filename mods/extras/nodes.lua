----------------------Nodes------------------

minetest.register_alias("oddnodes:goaway","air")
minetest.register_alias("moretrees:rubber_tree_trunk","air")
minetest.register_alias("moretrees:rubber_tree_leaves","air")
minetest.register_alias("spell:yinyangblock","air")
minetest.register_alias("nature:blossom","default:apple")
minetest.register_alias("cavestuff:pebble_1","default:apple")
minetest.register_alias("cavestuff:pebble_2","default:apple")
minetest.register_alias("xtraores:stone_with_platinum","caverealms:constant_flame")


-- blocks stolen from elsewhere
-- minetest.register_node("extras:plate_glass", {
-- 	description = "Plate Glass",
-- 	drawtype = "glasslike",
-- 	paramtype = "light",
-- 	sunlight_propagates = true,
-- 	tiles = {"cityscape_plate_glass.png"},
-- 	light_source = 1,
-- 	use_texture_alpha = true,
-- 	is_ground_content = false,
-- 	groups = {cracky = 3, level=1},
-- 	--sounds = minetest.node_sound_stone_defaults(),
-- })

-- minetest.register_node("extras:nigel", {
--     description="Nigel",
--     drawtype = "nodebox",
--     node_box = {
--         type = "wallmounted",
--         wall_top    = {-0.4875, 0.4875, -0.4875, 0.4875, 0.5, 0.4875},
--         wall_bottom = {-0.4875, -0.5, -0.4875, 0.4875, -0.4875, 0.4875},
--         wall_side   = {-0.5, -0.4875, -0.4875, -0.4875, 0.4875, 0.4875},
--     },
-- 	paramtype = "light",
-- 	paramtype2 = "wallmounted",
--     wield_image = "nyje_nyje.png",
--     sunlight_propagates = true,
--     tiles = { "nyje_nyje.png" },
-- 	light_source = 14,
--     inventory_image = "nyje_nyje.png",
-- 	groups = {cracky=3, choppy=3},
-- 	--sounds = default.node_sound_stone_defaults(),
-- })
--minetest.register_alias("spell:nigel","extras:nigel")

-- minetest.register_node("extras:yinyangsign", {
--     description="Yin Yang",
--     drawtype = "nodebox",
--     node_box = {
--         type = "wallmounted",
--         wall_top    = {-0.4875, 0.4875, -0.4875, 0.4875, 0.5, 0.4875},
--         wall_bottom = {-0.4875, -0.5, -0.4875, 0.4875, -0.4875, 0.4875},
--         wall_side   = {-0.5, -0.4875, -0.4875, -0.4875, 0.4875, 0.4875},
--     },-- spell  server management & toys
-- 	paramtype = "light",
-- 	paramtype2 = "wallmounted",
--     wield_image = "yinyang.png",
--     sunlight_propagates = true,
--     tiles = { "yinyang.png" },
-- 	light_source = 14,
--         inventory_image = "yinyang.png",
-- 	groups = {cracky=3, choppy=3},
-- 	sounds = default.node_sound_stone_defaults(),
-- })
minetest.register_alias("spell:yinyangsign","air")

-- minetest.register_node("extras:kityangsign", {
--     description="kittinYang",
--     drawtype = "nodebox",
--     node_box = {
--         type = "wallmounted",
--         wall_top    = {-0.4875, 0.4875, -0.4875, 0.4875, 0.5, 0.4875},
--         wall_bottom = {-0.4875, -0.5, -0.4875, 0.4875, -0.4875, 0.4875},
--         wall_side   = {-0.5, -0.4875, -0.4875, -0.4875, 0.4875, 0.4875},
--     },-- spell  server management & toys
-- 	paramtype = "light",
-- 	paramtype2 = "wallmounted",
--     wield_image = "kityang.png",
--     sunlight_propagates = true,
--     tiles = { "kityang.png" },
-- 	light_source = 14,
--         inventory_image = "kityang.png",
-- 	groups = {cracky=3, choppy=3},
-- 	sounds = default.node_sound_stone_defaults(),
-- })
minetest.register_alias("spell:kityangsign","air")


-- minetest.register_node("extras:elektra", {
--     description="Elektra",
--     drawtype = "nodebox",
--     node_box = {
--         type = "wallmounted",
--         wall_top    = {-0.4875, 0.4875, -0.4875, 0.4875, 0.5, 0.4875},
--         wall_bottom = {-0.4875, -0.5, -0.4875, 0.4875, -0.4875, 0.4875},
--         wall_side   = {-0.5, -0.4875, -0.4875, -0.4875, 0.4875, 0.4875},
--     },
-- 	paramtype = "light",
-- 	paramtype2 = "wallmounted",
--     wield_image = "nyje_elektra.png",
--     sunlight_propagates = true,
--     tiles = { "nyje_elektra.png" },
-- 	light_source = 14,
--     inventory_image = "nyje_elektra.png",
-- 	groups = {cracky=3, choppy=3},
-- 	sounds = default.node_sound_stone_defaults(),
--})
minetest.register_alias("spell:elektra","air")


minetest.register_node("extras:dangersign", {
    description="Danger Of Death Sign",
    drawtype = "nodebox",
    node_box = {
        type = "wallmounted",
        wall_top    = {-0.4875, 0.4875, -0.4875, 0.4875, 0.5, 0.4875},
        wall_bottom = {-0.4875, -0.5, -0.4875, 0.4875, -0.4875, 0.4875},
        wall_side   = {-0.5, -0.4875, -0.4875, -0.4875, 0.4875, 0.4875},
    },
	paramtype = "light",
	paramtype2 = "wallmounted",
    wield_image = "dds.png",
    sunlight_propagates = true,
    tiles = { "dds.png" },
	light_source = 14,
    inventory_image = "dds.png",
	groups = {cracky=3, choppy=3},
	--sounds = default.node_sound_stone_defaults(),
})
minetest.register_alias("spell:dangersign","extras:dangersign")


-- minetest.register_node("extras:glaz", {
-- 	description = "Invisible Glass",
-- 	drawtype = "glasslike_framed_optional",
-- 	tiles = {"glaz.png"},
-- 	inventory_image = minetest.inventorycube("glaz.png"),
-- 	paramtype = "light",
-- 	sunlight_propagates = true,
-- 	is_ground_content = false,
-- 	groups = {cracky = 3, oddly_breakable_by_hand = 3},
-- 	sounds = default.node_sound_glass_defaults(),
-- })
--[[
minetest.register_node("extras:yinyangblock", {
	description = "Yin Yang Block",
	drawtype = "nodebox",
	tiles = {"yinyang.png"},
	inventory_image = minetest.inventorycube("yinyang.png"),
	paramtype = "light",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3, oddly_breakable_by_hand = 3},
	sounds = default.node_sound_glass_defaults(),
})
]]--

-- minetest.register_node("extras:kityangblock", {
-- 	description = "Kittin Yang Block",
-- 	drawtype = "nodebox",
-- 	tiles = {"kityang.png"},
-- 	inventory_image = minetest.inventorycube("kityang.png"),
-- 	paramtype = "light",
-- 	sunlight_propagates = true,
-- 	is_ground_content = false,
-- 	groups = {cracky = 3, oddly_breakable_by_hand = 3},
-- 	sounds = default.node_sound_glass_defaults(),
-- })
minetest.register_alias("spell:kityangblock","default:meselamp")


-- 	minetest.register_node(modname.."px_logo", {
--         description="planet express logo",
-- 		tiles = { "PX.png" },
-- 		light_source = 14,
--         inventory_image = "PX.png",
-- 		groups = {cracky=3, choppy=3},
-- 		sounds = default.node_sound_stone_defaults(),
-- 	})

-- 	minetest.register_node(modname.."lebes", {
--         description="Lojas Lebes",
--         drawtype = "nodebox",
--         node_box = {
--             type = "wallmounted",
--             wall_top    = {-0.4875, 0.4875, -0.4875, 0.4875, 0.5, 0.4875},
--             wall_bottom = {-0.4875, -0.5, -0.4875, 0.4875, -0.4875, 0.4875},
--             wall_side   = {-0.5, -0.4875, -0.4875, -0.4875, 0.4875, 0.4875},
--         },
--     	paramtype = "light",
--     	paramtype2 = "wallmounted",
--         wield_image = "lebes.png",
--         sunlight_propagates = true,
--         tiles = { "lebes.png" },
-- 		light_source = 14,
--         inventory_image = "lebes.png",
-- 		groups = {cracky=3, choppy=3},
-- 		sounds = default.node_sound_stone_defaults(),
-- 	})
--
--
-- 	minetest.register_node(modname.."PhilosoPhia_Agatha", {
--         description="PhilosoPhia_Agatha",
--         drawtype = "nodebox",
--         node_box = {
--             type = "wallmounted",
--             wall_top    = {-0.4875, 0.4875, -0.4875, 0.4875, 0.5, 0.4875},
--             wall_bottom = {-0.4875, -0.5, -0.4875, 0.4875, -0.4875, 0.4875},
--             wall_side   = {-0.5, -0.4875, -0.4875, -0.4875, 0.4875, 0.4875},
--         },
--     	paramtype = "light",
--     	paramtype2 = "wallmounted",
--         wield_image = "will.png",
--         sunlight_propagates = true,
--         tiles = { "will.png" },
-- 		light_source = 14,
--         inventory_image = "will.png",
-- 		groups = {cracky=3, choppy=3},
-- 		sounds = default.node_sound_stone_defaults(),
-- 	})

