--[[
Coloured Glass by JBR
Code License: CC0
Texture License: CC BY-SA 3.0
--]]

minetest.register_node("glass:black", {
	description = "Black Glass",
	drawtype = "glasslike",
	tiles = {"blackglass.png"},
	 wield_image = "color_handblack.png",
   wield_scale = {x=2,y=1.5,z=0.2},
	paramtype = "light",
	use_texture_alpha = true,
	sunlight_propagates = true,
	sounds = default.node_sound_glass_defaults(),
	groups = {cracky=3,oddly_breakable_by_hand=3},
})
minetest.register_node("glass:blue", {
	description = "Blue Glass",
	drawtype = "glasslike",
	tiles = {"blueglass.png"},
	 wield_image = "color_handblue.png",
   wield_scale = {x=2,y=1.5,z=0.2},
	paramtype = "light",
	use_texture_alpha = true,
	sunlight_propagates = true,
	sounds = default.node_sound_glass_defaults(),
	groups = {cracky=3,oddly_breakable_by_hand=3},
})
minetest.register_node("glass:green", {
	description = "Green Glass",
	drawtype = "glasslike",
	tiles = {"greenglass.png"},
	 wield_image = "color_handgreen.png",
   wield_scale = {x=2,y=1.5,z=0.2},
	paramtype = "light",
	use_texture_alpha = true,
	sunlight_propagates = true,
	sounds = default.node_sound_glass_defaults(),
	groups = {cracky=3,oddly_breakable_by_hand=3},
})
minetest.register_node("glass:orange", {
	description = "Orange Glass",
	drawtype = "glasslike",
	tiles = {"orangeglass.png"},
	 wield_image = "color_handorange.png",
   wield_scale = {x=2,y=1.5,z=0.2},
	paramtype = "light",
	use_texture_alpha = true,
	sunlight_propagates = true,
	sounds = default.node_sound_glass_defaults(),
	groups = {cracky=3,oddly_breakable_by_hand=3},
})
minetest.register_node("glass:pink", {
	description = "Pink Glass",
	drawtype = "glasslike",
	tiles = {"pinkglass.png"},
	 wield_image = "color_handpink.png",
   wield_scale = {x=2,y=1.5,z=0.2},
	paramtype = "light",
	use_texture_alpha = true,
	sunlight_propagates = true,
	sounds = default.node_sound_glass_defaults(),
	groups = {cracky=3,oddly_breakable_by_hand=3},
})
minetest.register_node("glass:purple", {
	description = "Purple Glass",
	drawtype = "glasslike",
	tiles = {"purpleglass.png"},
	paramtype = "light",
	use_texture_alpha = true,
	sunlight_propagates = true,
	sounds = default.node_sound_glass_defaults(),
	groups = {cracky=3,oddly_breakable_by_hand=3},
})
minetest.register_node("glass:red", {
	description = "Red Glass",
	drawtype = "glasslike",
	tiles = {"redglass.png"},
	 wield_image = "color_handred.png",
   wield_scale = {x=2,y=1.5,z=0.2},
	paramtype = "light",
	use_texture_alpha = true,
	sunlight_propagates = true,
	sounds = default.node_sound_glass_defaults(),
	groups = {cracky=3,oddly_breakable_by_hand=3},
})
minetest.register_node("glass:white", {
	description = "White Glass",
	drawtype = "glasslike",
	tiles = {"whiteglass.png"},
	 wield_image = "color_handwhite.png",
   wield_scale = {x=2,y=1.5,z=0.2},
	paramtype = "light",
	use_texture_alpha = true,
	sunlight_propagates = true,
	sounds = default.node_sound_glass_defaults(),
	groups = {cracky=3,oddly_breakable_by_hand=3},
})
minetest.register_node("glass:yellow", {
	description = "Yellow Glass",
	drawtype = "glasslike",
	tiles = {"yellowglass.png"},
	 wield_image = "color_handyellow.png",
   wield_scale = {x=2,y=1.5,z=0.2},
	paramtype = "light",
	use_texture_alpha = true,
	sunlight_propagates = true,
	sounds = default.node_sound_glass_defaults(),
	groups = {cracky=3,oddly_breakable_by_hand=3},
})
