
local colours = {
	{"white",      "White",      "#abababc0"},
	{"black",      "Black",      "#000000b0"},
	{"red",        "Red",        "#ff000070"},
	{"yellow",     "Yellow",     "#e3ff0070"},
	{"green",      "Green",      "#61ff0170"},
	{"blue",       "Blue",       "#015dbb70"},
	{"orange",     "Orange",     "#ff840170"},
	{"pink",       "Pink",       "#ff65b570"},

}

for i = 1, #colours, 1 do
    -- wood
    minetest.register_node("cblocks:wood_" .. colours[i][1], {
        description = colours[i][2] .. " Wooden Planks",
        tiles = {"default_wood.png^[colorize:" .. colours[i][3]},
        paramtype = "light",
        is_ground_content = false,
        groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 3, wood = 1},
        sounds = default.node_sound_wood_defaults(),
    })
    -- stone brick
    minetest.register_node("cblocks:stonebrick_" .. colours[i][1], {
        description = colours[i][2] .. " Stone Brick",
        tiles = {"default_stone_brick.png^[colorize:" .. colours[i][3]},
        paramtype = "light",
        is_ground_content = false,
        groups = {cracky = 2, stone = 1},
        sounds = default.node_sound_stone_defaults(),
    })
    -- glass (no stairs because they dont support transparant nodes)
    minetest.register_node("cblocks:glass_" .. colours[i][1], {
        description = colours[i][2] .. " Glass",
        tiles = {"cblocks.png^[colorize:" .. colours[i][3]},
        drawtype = "glasslike",
        paramtype = "light",
        sunlight_propagates = true,
        use_texture_alpha = true,
        is_ground_content = false,
        groups = {cracky = 3, oddly_breakable_by_hand = 3},
        sounds = default.node_sound_glass_defaults(),
    })
end

