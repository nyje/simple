--
-- Fence
--

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

	minetest.register_node("fence:" .. name, {
		description = desc .. " Fence ",
		wield_image = "color_hand" .. name .. ".png",
		wield_scale = {x=2,y=1.5,z=0.2},
		tiles = {"color_" .. name .. ".png"},
		 drawtype = "fencelike",
	paramtype = "light",
	selection_box = {
		type = "fixed",
		fixed = {-1/7, -1/2, -1/7, 1/7, 1/2, 1/7},
	},
	groups = {choppy=3,flammable=2},
    sounds = {
		footstep = {name="wood_woodstep"},
		dig = {name="wood_woodtool"},
		place = {name="default_stoneplace"},
    },
})

end
