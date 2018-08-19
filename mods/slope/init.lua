local slope_cbox = {
	type = "fixed",
	fixed = {
		{-0.5,  -0.5,  -0.5, 0.5, -0.25, 0.5},
		{-0.5, -0.25, -0.25, 0.5,     0, 0.5},
		{-0.5,     0,     0, 0.5,  0.25, 0.5},
		{-0.5,  0.25,  0.25, 0.5,   0.5, 0.5}
	}
}

local slope_cbox_long = {
	type = "fixed",
	fixed = {
		{-0.5, -0.5,   -1.5,  0.5, -0.375, 0.5},  --  NodeBox1
		{-0.5, -0.375, -1.25, 0.5, -0.25,  0.5},  --  NodeBox2
		{-0.5, -0.25,  -1,    0.5, -0.125, 0.5},  --  NodeBox3
		{-0.5, -0.125, -0.75, 0.5,  0,     0.5},  --  NodeBox4
		{-0.5,  0,     -0.5,  0.5,  0.125, 0.5},  --  NodeBox5
		{-0.5,  0.125, -0.25, 0.5,  0.25,  0.5},  --  NodeBox6
		{-0.5,  0.25,   0,    0.5,  0.375, 0.5},  --  NodeBox7
		{-0.5,  0.375,  0.25, 0.5,  0.5,   0.5},  --  NodeBox8
	}
}

local icorner_cbox = {
	type = "fixed",
	fixed = {
		{-0.5, -0.5, -0.5, 0.5, -0.25, 0.5}, -- NodeBox5
		{-0.5, -0.5, -0.25, 0.5, 0, 0.5}, -- NodeBox6
		{-0.5, -0.5, -0.5, 0.25, 0, 0.5}, -- NodeBox7
		{-0.5, 0, -0.5, 0, 0.25, 0.5}, -- NodeBox8
		{-0.5, 0, 0, 0.5, 0.25, 0.5}, -- NodeBox9
		{-0.5, 0.25, 0.25, 0.5, 0.5, 0.5}, -- NodeBox10
		{-0.5, 0.25, -0.5, -0.25, 0.5, 0.5}, -- NodeBox11
	}
}

local ocorner_cbox = {
	type = "fixed",
	fixed = {
		{-0.5,  -0.5,  -0.5,   0.5, -0.25, 0.5},
		{-0.5, -0.25, -0.25,  0.25,     0, 0.5},
		{-0.5,     0,     0,     0,  0.25, 0.5},
		{-0.5,  0.25,  0.25, -0.25,   0.5, 0.5}
	}
}

local short_pyr_cbox = {
	type = "fixed",
	fixed = {
		{ -0.5,   -0.5,   -0.5,   0.5,   -0.375, 0.5 },
		{ -0.375, -0.375, -0.375, 0.375, -0.25,  0.375},
		{ -0.25,  -0.25,  -0.25,  0.25,  -0.125, 0.25},
		{ -0.125, -0.125, -0.125, 0.125,  0,     0.125}
	}
}

local tall_pyr_cbox = {
	type = "fixed",
	fixed = {
		{ -0.5,   -0.5,  -0.5,   0.5,  -0.25, 0.5 },
		{ -0.375, -0.25, -0.375, 0.375, 0,    0.375},
		{ -0.25,   0,    -0.25,  0.25,  0.25, 0.25},
		{ -0.125,  0.25, -0.125, 0.125, 0.5,  0.125}
	}
}

local slope_fronthalf_cbox = {
	type = "fixed",
	fixed = {
		{-0.5, -0.5,   -0.5,  0.5, -0.375, 0.5},  --  NodeBox1
		{-0.5, -0.375, -0.25, 0.5, -0.25,  0.5},  --  NodeBox2
		{-0.5, -0.25,  0,    0.5, -0.125, 0.5},  --  NodeBox3
		{-0.5, -0.125, 0.25, 0.5,  0,     0.5},  --  NodeBox4
	}
}

local slope_backhalf_cbox = {
	type = "fixed",
	fixed = {
		{-0.5, -0.5,   -0.5,  0.5, 0.125, 0.5},  --  NodeBox1
		{-0.5, 0.125, -0.25, 0.5, 0.25,  0.5},  --  NodeBox2
		{-0.5, 0.25,  0,    0.5, 0.375, 0.5},  --  NodeBox3
		{-0.5, 0.375, 0.25, 0.5,  0.5,     0.5},  --  NodeBox4
	}
}


local dyes = {
	{"white",      "White",      "basecolor_white"},
	{"black",      "Black",      "basecolor_black"},
	{"red",        "Red",        "basecolor_red"},
	{"yellow",     "Yellow",     "basecolor_yellow"},
	{"green",      "Green",      "basecolor_green"},
	{"blue",       "Blue",       "basecolor_blue"},
	{"orange",     "Orange",     "excolor_orange"},
	{"pink",       "Pink",       "unicolor_light_red"},
}

for i = 1, #dyes do
	local name, desc, craft_color_group = unpack(dyes[i])

    minetest.register_node("slope:slope_"..name, {
        description = desc.. " slope",
        drawtype = "mesh",
        mesh = "slope_test_slope.obj",
        tiles = {"color_"..name..".png"},
        paramtype = "light",
        paramtype2 = "facedir",
        groups = {snappy=2, choppy=2, oddly_breakable_by_hand=2},
        sounds = default.node_sound_defaults(),
        on_place = minetest.rotate_node,
        collision_box = slope_cbox,
        selection_box = slope_cbox,
        oddly_breakable_by_hand = 1,
        dig_immediate = 3,
    })
    minetest.register_node("slope:ocorner_"..name, {
        description = desc.." slope (outer corner)",
        drawtype = "mesh",
        mesh = "slope_test_ocorner.obj",
        tiles = {"color_"..name..".png"},
        paramtype = "light",
        paramtype2 = "facedir",
        groups = {snappy=2, choppy=2, oddly_breakable_by_hand=2},
        sounds = default.node_sound_wood_defaults(),
        on_place = minetest.rotate_node,
        collision_box = ocorner_cbox,
        selection_box = ocorner_cbox,
        oddly_breakable_by_hand = 1,
        dig_immediate = 3,
    })
    minetest.register_node("slope:icorner_"..name, {
        description = desc.." slope (inner corner)",
        drawtype = "mesh",
        mesh = "slope_test_icorner.obj",
        tiles = {"color_"..name..".png"},
        paramtype = "light",
        paramtype2 = "facedir",
        groups = {snappy=2, choppy=2, oddly_breakable_by_hand=2},
        sounds = default.node_sound_defaults(),
        on_place = minetest.rotate_node,
        collision_box = ocorner_cbox,
        selection_box = ocorner_cbox,
        oddly_breakable_by_hand = 1,
        dig_immediate = 3,
    })

    minetest.register_node("slope:slopelong_"..name, {
        description = desc.." long slope",
        drawtype = "mesh",
        mesh = "slope_test_slope_long.obj",
        tiles = {"color_"..name..".png"},
        paramtype = "light",
        paramtype2 = "facedir",
        groups = {snappy=2, choppy=2, oddly_breakable_by_hand=2},
        sounds = default.node_sound_defaults(),
        on_place = minetest.rotate_node,
        collision_box = slope_cbox_long,
        selection_box = slope_cbox_long,
        oddly_breakable_by_hand = 1,
        dig_immediate = 3,
    })

    minetest.register_node("slope:cylinder_"..name, {
        description = desc.." cylinder",
        drawtype = "mesh",
        mesh = "slope_test_cylinder.obj",
        tiles = {"color_"..name..".png"},
        paramtype = "light",
        paramtype2 = "facedir",
        groups = {snappy=2, choppy=2, oddly_breakable_by_hand=2},
        sounds = default.node_sound_defaults(),
        on_place = minetest.rotate_node,
        oddly_breakable_by_hand = 1,
        dig_immediate = 3,
    })

    minetest.register_node("slope:cone_"..name, {
        description = desc.." cone",
        drawtype = "mesh",
        mesh = "slope_test_cone_onetexture.obj",
        tiles = {"color_"..name..".png"},
        paramtype = "light",
        paramtype2 = "facedir",
        groups = {snappy=2, cracky=3, oddly_breakable_by_hand=2},
        sounds = default.node_sound_defaults(),
        on_place = minetest.rotate_node,
        selection_box = tall_pyr_cbox,
        collision_box = tall_pyr_cbox,
        oddly_breakable_by_hand = 1,
        dig_immediate = 3,
    })

    minetest.register_node("slope:sphere_"..name, {
        description = desc.." sphere",
        drawtype = "mesh",
        mesh = "slope_test_sphere_onetexture.obj",
        tiles = {"color_"..name..".png"},
        paramtype = "light",
        paramtype2 = "facedir",
        groups = {snappy=2, cracky=3, oddly_breakable_by_hand=2},
        sounds = default.node_sound_defaults(),
        oddly_breakable_by_hand = 1,
        dig_immediate = 3,
    })


end



-- One-texture slopes
--
-- minetest.register_node("slope_test:slope_onetexture", {
-- 	description = "Slope, one texture (stone)",
-- 	drawtype = "mesh",
-- 	mesh = "slope_test_slope_onetexture.obj",
-- 	tiles = {"default_stonebrickpng"},
-- 	paramtype = "light",
-- 	paramtype2 = "facedir",
-- 	groups = {cracky=3, oddly_breakable_by_hand=2},
-- 	sounds = default.node_sound_stone_defaults(),
-- 	on_place = minetest.rotate_node,
-- 	collision_box = slope_cbox,
-- 	selection_box = slope_cbox
-- })
--
-- minetest.register_node("slope_test:ocorner_onetexture", {
-- 	description = "Slope, one texture (stone, outer corner)",
-- 	drawtype = "mesh",
-- 	mesh = "slope_test_ocorner_onetexture.obj",
-- 	tiles = {"default_stonebrick.png"},
-- 	paramtype = "light",
-- 	paramtype2 = "facedir",
-- 	groups = {cracky=3, oddly_breakable_by_hand=2},
-- 	sounds = default.node_sound_stone_defaults(),
-- 	collision_box = ocorner_cbox,
-- 	selection_box = ocorner_cbox
-- })
--
-- minetest.register_node("slope_test:icorner_onetexture", {
-- 	description = "Slope, one texture (stone, inner corner)",
-- 	drawtype = "mesh",
-- 	mesh = "slope_test_icorner_onetexture.obj",
-- 	tiles = {"default_stonebrick.png"},
-- 	paramtype = "light",
-- 	paramtype2 = "facedir",
-- 	groups = {cracky=3, oddly_breakable_by_hand=2},
-- 	sounds = default.node_sound_stone_defaults(),
-- 	collision_box = icorner_cbox,
-- })
--
-- -- Long slopes
--

--
-- minetest.register_node("slope_test:slope_long_onetexture", {
-- 	description = "Slope (single-piece long, one texture)",
-- 	drawtype = "mesh",
-- 	mesh = "slope_test_slope_long_onetexture.obj",
-- 	tiles = {"default_stonebrick.png"},
-- 	paramtype = "light",
-- 	paramtype2 = "facedir",
-- 	groups = {cracky=3, oddly_breakable_by_hand=2},
-- 	sounds = default.node_sound_stone_defaults(),
-- 	on_place = minetest.rotate_node,
-- 	collision_box = slope_cbox_long,
-- 	selection_box = slope_cbox_long
-- })
--
-- -- cylinders
--
-- minetest.register_node("slope_test:cylinder", {
-- 	description = "Wooden cylinder",
-- 	drawtype = "mesh",
-- 	mesh = "slope_test_cylinder.obj",
-- 	tiles = {"slope_test_cylinder.png"},
-- 	paramtype = "light",
-- 	paramtype2 = "facedir",
-- 	groups = {choppy=2, oddly_breakable_by_hand=2, flammable=3},
-- 	sounds = default.node_sound_wood_defaults(),
-- 	on_place = minetest.rotate_node,
-- })
--
-- minetest.register_node("slope_test:cylinder_onetexture", {
-- 	description = "Cylinder, one texture (stone)",
-- 	drawtype = "mesh",
-- 	mesh = "slope_test_cylinder_onetexture.obj",
-- 	tiles = {"default_stonebrick.png"},
-- 	paramtype = "light",
-- 	paramtype2 = "facedir",
-- 	groups = {cracky=3, oddly_breakable_by_hand=2},
-- 	sounds = default.node_sound_stone_defaults(),
-- 	on_place = minetest.rotate_node,
-- })
--
-- -- pyramids
--
-- minetest.register_node("slope_test:pyramid_onetexture", {
-- 	description = "Pyramid, one texture (stone)",
-- 	drawtype = "mesh",
-- 	mesh = "slope_test_pyramid_onetexture.obj",
-- 	tiles = {"default_stonebrick.png"},
-- 	paramtype = "light",
-- 	paramtype2 = "facedir",
-- 	groups = {cracky=3, oddly_breakable_by_hand=2},
-- 	sounds = default.node_sound_stone_defaults(),
-- 	on_place = minetest.rotate_node,
-- 	selection_box = tall_pyr_cbox,
-- 	collision_box = tall_pyr_cbox
-- })
--
-- minetest.register_node("slope_test:pyramid_short_onetexture", {
-- 	description = "Pyramid, one texture (stone, short)",
-- 	drawtype = "mesh",
-- 	mesh = "slope_test_pyramid_short_onetexture.obj",
-- 	tiles = {"default_stonebrick.png"},
-- 	paramtype = "light",
-- 	paramtype2 = "facedir",
-- 	groups = {cracky=3, oddly_breakable_by_hand=2},
-- 	sounds = default.node_sound_stone_defaults(),
-- 	on_place = minetest.rotate_node,
-- 	selection_box = short_pyr_cbox,
-- 	collision_box = short_pyr_cbox
-- })
--
-- -- quarter-rounds
--
-- minetest.register_node("slope_test:quarter_round", {
-- 	description = "Wooden Quarter-round",
-- 	drawtype = "mesh",
-- 	mesh = "slope_test_quarter_round.obj",
-- 	tiles = {"slope_test_quarter_round.png"},
-- 	paramtype = "light",
-- 	paramtype2 = "facedir",
-- 	groups = {choppy=2, oddly_breakable_by_hand=2, flammable=3},
-- 	sounds = default.node_sound_wood_defaults(),
-- 	on_place = minetest.rotate_node,
-- })
--
-- minetest.register_node("slope_test:quarter_round_onetexture", {
-- 	description = "Quarter-round, one texture (stone)",
-- 	drawtype = "mesh",
-- 	mesh = "slope_test_quarter_round_onetexture.obj",
-- 	tiles = {"default_stonebrick.png"},
-- 	paramtype = "light",
-- 	paramtype2 = "facedir",
-- 	groups = {cracky=3, oddly_breakable_by_hand=2},
-- 	sounds = default.node_sound_stone_defaults(),
-- 	on_place = minetest.rotate_node,
-- })
--
-- -- quarter-round corners
--
-- minetest.register_node("slope_test:quarter_round_corner", {
-- 	description = "Quarter-round (corner)",
-- 	drawtype = "mesh",
-- 	mesh = "slope_test_quarter_round_corner.obj",
-- 	tiles = {"slope_test_quarter_round_corner.png"},
-- 	paramtype = "light",
-- 	paramtype2 = "facedir",
-- 	groups = {choppy=2, oddly_breakable_by_hand=2, flammable=3},
-- 	sounds = default.node_sound_wood_defaults(),
-- 	on_place = minetest.rotate_node,
-- })
--
-- minetest.register_node("slope_test:quarter_round_corner_onetexture", {
-- 	description = "Quarter-round, one texture (stone, corner)",
-- 	drawtype = "mesh",
-- 	mesh = "slope_test_quarter_round_corner_onetexture.obj",
-- 	tiles = {"default_stonebrick.png"},
-- 	paramtype = "light",
-- 	paramtype2 = "facedir",
-- 	groups = {cracky=3, oddly_breakable_by_hand=2},
-- 	sounds = default.node_sound_stone_defaults(),
-- 	on_place = minetest.rotate_node,
-- })
--
-- -- sphere-cube blob thingy
--
-- minetest.register_node("slope_test:slope_test_blob_onetexture", {
-- 	description = "Sphere-cube blob, one texture (stone)",
-- 	drawtype = "mesh",
-- 	mesh = "slope_test_blob_onetexture.obj",
-- 	tiles = {"default_stonebrick.png"},
-- 	paramtype = "light",
-- 	paramtype2 = "facedir",
-- 	groups = {cracky=3, oddly_breakable_by_hand=2},
-- 	sounds = default.node_sound_stone_defaults(),
-- 	on_place = minetest.rotate_node,
-- })
--
-- -- globe of earth
-- -- using Gall-Peters projection, http://en.wikipedia.org/wiki/Gall%E2%80%93Peters_projection
-- -- image source, http://upload.wikimedia.org/wikipedia/commons/7/77/Gall-peters.jpg
--
-- minetest.register_node("slope_test:slope_test_sphere", {
-- 	description = "Globe/sphere",
-- 	drawtype = "mesh",
-- 	mesh = "slope_test_sphere.obj",
-- 	tiles = {"slope_test_sphere.png"},
-- 	paramtype = "light",
-- 	paramtype2 = "facedir",
-- 	groups = {choppy=2, oddly_breakable_by_hand=2, flammable=3},
-- 	sounds = default.node_sound_dirt_defaults(),
-- })
--
-- -- one-texture version, spherical projection
--

-- -- other random shapes
--
-- minetest.register_node("slope_test:slope_long_fronthalf_onetexture", {
-- 	description = "Slope, long (front half)",
-- 	drawtype = "mesh",
-- 	mesh = "slope_test_slope_long_fronthalf_onetexture.obj",
-- 	tiles = {"default_stonebrick.png"},
-- 	paramtype = "light",
-- 	paramtype2 = "facedir",
-- 	groups = {cracky=3, oddly_breakable_by_hand=2},
-- 	sounds = default.node_sound_stone_defaults(),
-- 	on_place = minetest.rotate_node,
-- 	collision_box = slope_fronthalf_cbox,
-- 	selection_box = slope_fronthalf_cbox
-- })
--
-- minetest.register_node("slope_test:slope_long_backhalf_onetexture", {
-- 	description = "Slope, long (back half)",
-- 	drawtype = "mesh",
-- 	mesh = "slope_test_slope_long_backhalf_onetexture.obj",
-- 	tiles = {"default_stonebrick.png"},
-- 	paramtype = "light",
-- 	paramtype2 = "facedir",
-- 	groups = {cracky=3, oddly_breakable_by_hand=2},
-- 	sounds = default.node_sound_stone_defaults(),
-- 	on_place = minetest.rotate_node,
-- 	collision_box = slope_backhalf_cbox,
-- 	selection_box = slope_backhalf_cbox
-- })
--
-- minetest.register_node("slope_test:icorner_half_tall_onetexture", {
-- 	description = "Inside corner (half-pitch, tall)",
-- 	drawtype = "mesh",
-- 	mesh = "slope_test_icorner_half_tall_onetexture.obj",
-- 	tiles = {"default_stone.png"},
-- 	paramtype = "light",
-- 	paramtype2 = "facedir",
-- 	groups = {cracky=3, oddly_breakable_by_hand=2},
-- 	sounds = default.node_sound_stone_defaults(),
-- 	on_place = minetest.rotate_node,
-- })
--
-- minetest.register_node("slope_test:icorner_half_short_onetexture", {
-- 	description = "Inside corner (half-pitch, short)",
-- 	drawtype = "mesh",
-- 	mesh = "slope_test_icorner_half_short_onetexture.obj",
-- 	tiles = {"default_stone.png"},
-- 	paramtype = "light",
-- 	paramtype2 = "facedir",
-- 	groups = {cracky=3, oddly_breakable_by_hand=2},
-- 	sounds = default.node_sound_stone_defaults(),
-- 	on_place = minetest.rotate_node,
-- })
--
-- minetest.register_node("slope_test:ocorner_short_onetexture", {
-- 	description = "Outside corner (short)",
-- 	drawtype = "mesh",
-- 	mesh = "slope_test_ocorner_short_onetexture.obj",
-- 	tiles = {"default_stone.png"},
-- 	paramtype = "light",
-- 	paramtype2 = "facedir",
-- 	groups = {cracky=3, oddly_breakable_by_hand=2},
-- 	sounds = default.node_sound_stone_defaults(),
-- 	on_place = minetest.rotate_node,
-- })
--
-- minetest.register_node("slope_test:corner_pyramid_short_1_onetexture", {
-- 	description = "Corner pyramid (short, type 1)",
-- 	drawtype = "mesh",
-- 	mesh = "slope_test_corner_pyramid_short_1_onetexture.obj",
-- 	tiles = {"default_stone.png"},
-- 	paramtype = "light",
-- 	paramtype2 = "facedir",
-- 	groups = {cracky=3, oddly_breakable_by_hand=2},
-- 	sounds = default.node_sound_stone_defaults(),
-- 	on_place = minetest.rotate_node,
-- })
--
-- minetest.register_node("slope_test:corner_pyramid_short_2_onetexture", {
-- 	description = "Corner pyramid (short, type 2)",
-- 	drawtype = "mesh",
-- 	mesh = "slope_test_corner_pyramid_short_2_onetexture.obj",
-- 	tiles = {"default_stone.png"},
-- 	paramtype = "light",
-- 	paramtype2 = "facedir",
-- 	groups = {cracky=3, oddly_breakable_by_hand=2},
-- 	sounds = default.node_sound_stone_defaults(),
-- 	on_place = minetest.rotate_node,
-- })
--
-- minetest.register_node("slope_test:corner_pyramid_tall_1_onetexture", {
-- 	description = "Corner pyramid (tall, type 1)",
-- 	drawtype = "mesh",
-- 	mesh = "slope_test_corner_pyramid_tall_1_onetexture.obj",
-- 	tiles = {"default_stone.png"},
-- 	paramtype = "light",
-- 	paramtype2 = "facedir",
-- 	groups = {cracky=3, oddly_breakable_by_hand=2},
-- 	sounds = default.node_sound_stone_defaults(),
-- 	on_place = minetest.rotate_node,
-- })
--
-- minetest.register_node("slope_test:corner_pyramid_tall_2_onetexture", {
-- 	description = "Corner pyramid (tall, type 2)",
-- 	drawtype = "mesh",
-- 	mesh = "slope_test_corner_pyramid_tall_2_onetexture.obj",
-- 	tiles = {"default_stone.png"},
-- 	paramtype = "light",
-- 	paramtype2 = "facedir",
-- 	groups = {cracky=3, oddly_breakable_by_hand=2},
-- 	sounds = default.node_sound_stone_defaults(),
-- 	on_place = minetest.rotate_node,
-- })
--
