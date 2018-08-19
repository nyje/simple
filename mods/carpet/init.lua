-- Carpet Mod!
-- By Jordan Snelling 2012
-- License LGPL
-- This mod adds carpets into Minetest.

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


    minetest.register_node("carpet:" .. name, {
        description="Cover "..my_desc,
        drawtype = "nodebox",
        node_box = {
            type = "wallmounted",
        },
        paramtype = "light",
        paramtype2 = "wallmounted",
        sunlight_propagates = true,
        --light_source = 14,
        tiles = {"color_" .. name .. ".png"},
        groups = {dig_immediate=3, cracky=1, choppy=1},
        sounds = default.node_sound_defaults(),
    })

end