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

	minetest.register_node("color:" .. name, {
		description = desc .. " color",
		wield_image = "color_no.png",
		wield_scale = {x=2,y=1.5,z=0.2},
		tiles = {"color_" .. name .. ".png"},
		is_ground_content = true,
		groups = {snappy = 2, choppy = 2, wool = 2},
		sounds = default.node_sound_defaults(),
	  oddly_breakable_by_hand = 1,
	  dig_immediate = 3,
			 	})
end
