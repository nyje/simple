--
-- Aliases for map generators
--

minetest.register_alias("mapgen_stone", "color:black")
minetest.register_alias("mapgen_dirt", "color:orange")
minetest.register_alias("mapgen_dirt_with_grass", "color:green")
minetest.register_alias("mapgen_sand", "color:yellow")
minetest.register_alias("mapgen_water_source", "water:blue_water_source")
minetest.register_alias("mapgen_river_water_source", "water:blue_water_source")
minetest.register_alias("mapgen_lava_source", "water:red_water_source")
minetest.register_alias("mapgen_gravel", "color:black")
minetest.register_alias("mapgen_desert_stone", "color:black")
minetest.register_alias("mapgen_desert_sand", "color;yellow")
minetest.register_alias("mapgen_dirt_with_snow", "color:white")
minetest.register_alias("mapgen_snowblock", "color:white")
minetest.register_alias("mapgen_snow", "carpet:white")
minetest.register_alias("mapgen_ice", "color:blue")
minetest.register_alias("mapgen_sandstone", "color:orange")

-- Flora

minetest.register_alias("mapgen_tree", "color:orange")
minetest.register_alias("mapgen_leaves", "color:green")
minetest.register_alias("mapgen_apple", "color:red")
minetest.register_alias("mapgen_jungletree", "color:orange")
minetest.register_alias("mapgen_jungleleaves", "color:green")
minetest.register_alias("mapgen_junglegrass", "color:green")
minetest.register_alias("mapgen_pine_tree", "color:orange")
minetest.register_alias("mapgen_pine_needles", "color:green")

-- Dungeons

minetest.register_alias("mapgen_cobble", "color:black")
minetest.register_alias("mapgen_stair_cobble", "stairs:stair_white")
minetest.register_alias("mapgen_mossycobble", "color:white")
minetest.register_alias("mapgen_stair_desert_stone", "stairs:stair_white")
minetest.register_alias("mapgen_sandstonebrick", "color:orange")
minetest.register_alias("mapgen_stair_sandstone_block", "stairs:stair_white")


--
-- Register ores
--

-- Blob ores
-- These first to avoid other ores in blobs

-- Mgv6

function default.register_mgv6_blob_ores()

	-- Clay
	-- This first to avoid clay in sand blobs

	minetest.register_ore({
		ore_type        = "blob",
		ore             = "default:clay",
		wherein         = {"color:yellow"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_min           = -15,
		y_max           = 0,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = -316,
			octaves = 1,
			persist = 0.0
		},
	})

	-- Sand

	minetest.register_ore({
		ore_type        = "blob",
		ore             = "color:yellow",
		wherein         = {"color:black", "color:orange"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_min           = -31,
		y_max           = 0,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 2316,
			octaves = 1,
			persist = 0.0
		},
	})

	-- Dirt

	minetest.register_ore({
		ore_type        = "blob",
		ore             = "color:orange",
		wherein         = {"color:black"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_min           = -31,
		y_max           = 31000,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 17676,
			octaves = 1,
			persist = 0.0
		},
	})

	-- Gravel

	minetest.register_ore({
		ore_type        = "blob",
		ore             = "color:black",
		wherein         = {"color:black"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_min           = -31000,
		y_max           = 31000,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 766,
			octaves = 1,
			persist = 0.0
		},
	})
end


-- All mapgens except mgv6

function default.register_blob_ores()

	-- Clay

	minetest.register_ore({
		ore_type        = "blob",
		ore             = "default:clay",
		wherein         = {"color:yellow"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_min           = -15,
		y_max           = 0,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = -316,
			octaves = 1,
			persist = 0.0
		},
	})

	-- Silver sand

	minetest.register_ore({
		ore_type        = "blob",
		ore             = "color:yellow",
		wherein         = {"color:black"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_min           = -31000,
		y_max           = 31000,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 2316,
			octaves = 1,
			persist = 0.0
		},
		biomes = {"icesheet_ocean", "tundra", "tundra_beach", "tundra_ocean",
			"taiga", "taiga_ocean", "snowy_grassland", "snowy_grassland_ocean",
			"grassland", "grassland_dunes", "grassland_ocean", "coniferous_forest",
			"coniferous_forest_dunes", "coniferous_forest_ocean", "deciduous_forest",
			"deciduous_forest_shore", "deciduous_forest_ocean", "cold_desert",
			"cold_desert_ocean", "savanna", "savanna_shore", "savanna_ocean",
			"rainforest", "rainforest_swamp", "rainforest_ocean", "underground",
			"floatland_ocean", "floatland_grassland", "floatland_coniferous_forest"}
	})

	-- Dirt

	minetest.register_ore({
		ore_type        = "blob",
		ore             = "color:orange",
		wherein         = {"color:black"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_min           = -31,
		y_max           = 31000,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 17676,
			octaves = 1,
			persist = 0.0
		},
		biomes = {"taiga", "snowy_grassland", "grassland", "coniferous_forest",
			"deciduous_forest", "deciduous_forest_shore", "savanna", "savanna_shore",
			"rainforest", "rainforest_swamp", "floatland_grassland",
			"floatland_coniferous_forest"}
	})

	-- Gravel

	minetest.register_ore({
		ore_type        = "blob",
		ore             = "color:black",
		wherein         = {"color:black"},
		clust_scarcity  = 16 * 16 * 16,
		clust_size      = 5,
		y_min           = -31000,
		y_max           = 31000,
		noise_threshold = 0.0,
		noise_params    = {
			offset = 0.5,
			scale = 0.2,
			spread = {x = 5, y = 5, z = 5},
			seed = 766,
			octaves = 1,
			persist = 0.0
		},
		biomes = {"icesheet_ocean", "tundra", "tundra_beach", "tundra_ocean",
			"taiga", "taiga_ocean", "snowy_grassland", "snowy_grassland_ocean",
			"grassland", "grassland_dunes", "grassland_ocean", "coniferous_forest",
			"coniferous_forest_dunes", "coniferous_forest_ocean", "deciduous_forest",
			"deciduous_forest_shore", "deciduous_forest_ocean", "cold_desert",
			"cold_desert_ocean", "savanna", "savanna_shore", "savanna_ocean",
			"rainforest", "rainforest_swamp", "rainforest_ocean", "underground",
			"floatland_ocean", "floatland_grassland", "floatland_coniferous_forest"}
	})
end

--
-- Register biomes
--

-- All mapgens except mgv6

function default.register_biomes(upper_limit)

	-- Icesheet

	minetest.register_biome({
		name = "icesheet",
		node_dust = "color:white",
		node_top = "color:white",
		depth_top = 1,
		node_filler = "color:white",
		depth_filler = 3,
		node_stone = "color:blue",
		node_water_top = "water:blue_water_source",
		depth_water_top = 10,
		--node_water = "",
		node_river_water = "color:blue",
		node_riverbed = "color:black",
		depth_riverbed = 2,
		y_min = -8,
		y_max = upper_limit,
		heat_point = 0,
		humidity_point = 73,
	})

	minetest.register_biome({
		name = "icesheet_ocean",
		node_dust = "color:white",
		node_top = "color:yellow",
		depth_top = 1,
		node_filler = "color:yellow",
		depth_filler = 3,
		--node_stone = "",
		node_water_top = "water:blue_water_source",
		depth_water_top = 10,
		--node_water = "",
		--node_river_water = "",
		y_min = -112,
		y_max = -9,
		heat_point = 0,
		humidity_point = 73,
	})

	-- Tundra

	minetest.register_biome({
		name = "tundra",
		node_dust = "color:white",
		--node_top = ,
		--depth_top = ,
		--node_filler = ,
		--depth_filler = ,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "color:black",
		depth_riverbed = 2,
		y_min = 2,
		y_max = upper_limit,
		heat_point = 0,
		humidity_point = 40,
	})

	minetest.register_biome({
		name = "tundra_beach",
		--node_dust = "",
		node_top = "color:black",
		depth_top = 1,
		node_filler = "color:black",
		depth_filler = 2,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "color:black",
		depth_riverbed = 2,
		y_min = -3,
		y_max = 1,
		heat_point = 0,
		humidity_point = 40,
	})

	minetest.register_biome({
		name = "tundra_ocean",
		--node_dust = "",
		node_top = "color:yellow",
		depth_top = 1,
		node_filler = "color:yellow",
		depth_filler = 3,
		--node_stone = "",
	   node_water_top = "water:blue_water_source",
		depth_water_top = 10,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "color:black",
		depth_riverbed = 2,
		y_min = -112,
		y_max = -4,
		heat_point = 0,
		humidity_point = 40,
	})

	-- Taiga

	minetest.register_biome({
		name = "taiga",
		node_dust = "color:white",
		node_top = "color:white",
		depth_top = 1,
		node_filler = "color:orange",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "color:yellow",
		depth_riverbed = 2,
		y_min = 2,
		y_max = upper_limit,
		heat_point = 25,
		humidity_point = 70,
	})

	minetest.register_biome({
		name = "taiga_ocean",
		--node_dust = "",
		node_top = "color:yellow",
		depth_top = 1,
		node_filler = "color:yellow",
		depth_filler = 3,
		--node_stone = "",
     node_water_top = "water:blue_water_source",
		depth_water_top = 10,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "color:yellow",
		depth_riverbed = 2,
		y_min = -112,
		y_max = 1,
		heat_point = 25,
		humidity_point = 70,
	})

	-- Snowy grassland

	minetest.register_biome({
		name = "snowy_grassland",
		node_dust = "color:white",
		node_top = "color:white",
		depth_top = 1,
		node_filler = "color:orange",
		depth_filler = 1,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "color:yellow",
		depth_riverbed = 2,
		y_min = 5,
		y_max = upper_limit,
		heat_point = 20,
		humidity_point = 35,
	})

	minetest.register_biome({
		name = "snowy_grassland_ocean",
		--node_dust = "",
		node_top = "color:yellow",
		depth_top = 1,
		node_filler = "color:yellow",
		depth_filler = 3,
		--node_stone = "",
		 node_water_top = "water:blue_water_source",
		depth_water_top = 10,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "color:yellow",
		depth_riverbed = 2,
		y_min = -112,
		y_max = 4,
		heat_point = 20,
		humidity_point = 35,
	})

	-- Grassland

	minetest.register_biome({
		name = "grassland",
		--node_dust = "",
		node_top = "color:green",
		depth_top = 1,
		node_filler = "color:orange",
		depth_filler = 1,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "color:yellow",
		depth_riverbed = 2,
		y_min = 6,
		y_max = upper_limit,
		heat_point = 50,
		humidity_point = 35,
	})

	minetest.register_biome({
		name = "grassland_dunes",
		--node_dust = "",
		node_top = "color:yellow",
		depth_top = 1,
		node_filler = "color:yellow",
		depth_filler = 2,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "color:yellow",
		depth_riverbed = 2,
		y_min = 5,
		y_max = 5,
		heat_point = 50,
		humidity_point = 35,
	})

	minetest.register_biome({
		name = "grassland_ocean",
		--node_dust = "",
		node_top = "color:yellow",
		depth_top = 1,
		node_filler = "color:yellow",
		depth_filler = 3,
		--node_stone = "",
		 node_water_top = "water:blue_water_source",
		depth_water_top = 10,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "color:yellow",
		depth_riverbed = 2,
		y_min = -112,
		y_max = 4,
		heat_point = 50,
		humidity_point = 35,
	})

	-- Coniferous forest

	minetest.register_biome({
		name = "coniferous_forest",
		--node_dust = "",
		node_top = "color:green",
		depth_top = 1,
		node_filler = "color:orange",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "color:yellow",
		depth_riverbed = 2,
		y_min = 6,
		y_max = upper_limit,
		heat_point = 45,
		humidity_point = 70,
	})

	minetest.register_biome({
		name = "coniferous_forest_dunes",
		--node_dust = "",
		node_top = "color:yellow",
		depth_top = 1,
		node_filler = "color:yellow",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "color:yellow",
		depth_riverbed = 2,
		y_min = 5,
		y_max = 5,
		heat_point = 45,
		humidity_point = 70,
	})

	minetest.register_biome({
		name = "coniferous_forest_ocean",
		--node_dust = "",
		node_top = "color:yellow",
		depth_top = 1,
		node_filler = "color:yellow",
		depth_filler = 3,
		--node_stone = "",
		 node_water_top = "water:blue_water_source",
		depth_water_top = 10,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "color:yellow",
		depth_riverbed = 2,
		y_min = -112,
		y_max = 4,
		heat_point = 45,
		humidity_point = 70,
	})

	-- Deciduous forest

	minetest.register_biome({
		name = "deciduous_forest",
		--node_dust = "",
		node_top = "color:green",
		depth_top = 1,
		node_filler = "color:orange",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "color:yellow",
		depth_riverbed = 2,
		y_min = 1,
		y_max = upper_limit,
		heat_point = 60,
		humidity_point = 68,
	})

	minetest.register_biome({
		name = "deciduous_forest_shore",
		--node_dust = "",
		node_top = "color:orange",
		depth_top = 1,
		node_filler = "color:orange",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "color:yellow",
		depth_riverbed = 2,
		y_min = -1,
		y_max = 0,
		heat_point = 60,
		humidity_point = 68,
	})

	minetest.register_biome({
		name = "deciduous_forest_ocean",
		--node_dust = "",
		node_top = "color:yellow",
		depth_top = 1,
		node_filler = "color:yellow",
		depth_filler = 3,
		--node_stone = "",
		 node_water_top = "water:blue_water_source",
		depth_water_top = 10,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "color:yellow",
		depth_riverbed = 2,
		y_min = -112,
		y_max = -2,
		heat_point = 60,
		humidity_point = 68,
	})

	-- Desert

	minetest.register_biome({
		name = "desert",
		--node_dust = "",
		node_top = "color:yellow",
		depth_top = 1,
		node_filler = "color:yellow",
		depth_filler = 1,
		node_stone = "color:orange",
		--node_water_top = "" ,
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "color:yellow",
		depth_riverbed = 2,
		y_min = 5,
		y_max = upper_limit,
		heat_point = 92,
		humidity_point = 16,
	})

	minetest.register_biome({
		name = "desert_ocean",
		--node_dust = "",
		node_top = "color:yellow",
		depth_top = 1,
		node_filler = "color:yellow",
		depth_filler = 3,
		node_stone = "color:orange",
	 node_water_top = "water:blue_water_source",
		depth_water_top = 10,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "color:yellow",
		depth_riverbed = 2,
		y_min = -112,
		y_max = 4,
		heat_point = 92,
		humidity_point = 16,
	})

	-- Sandstone desert

	minetest.register_biome({
		name = "sandstone_desert",
		--node_dust = "",
		node_top = "color:yellow",
		depth_top = 1,
		node_filler = "color:yellow",
		depth_filler = 1,
		node_stone = "color:orange",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "color:yellow",
		depth_riverbed = 2,
		y_min = 5,
		y_max = upper_limit,
		heat_point = 60,
		humidity_point = 0,
	})

	minetest.	register_biome({
		name = "sandstone_desert_ocean",
		--node_dust = "",
		node_top = "color:yellow",
		depth_top = 1,
		node_filler = "color:yellow",
		depth_filler = 3,
		node_stone = "color:orange",
	 node_water_top = "water:blue_water_source",
		depth_water_top = 10,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "color:yellow",
		depth_riverbed = 2,
		y_min = -112,
		y_max = 4,
		heat_point = 60,
		humidity_point = 0,
	})

	-- Cold desert

	minetest.register_biome({
		name = "cold_desert",
		--node_dust = "",
		node_top = "color:yellow",
		depth_top = 1,
		node_filler = "color:yellow",
		depth_filler = 1,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "color:yellow",
		depth_riverbed = 2,
		y_min = 5,
		y_max = upper_limit,
		heat_point = 40,
		humidity_point = 0,
	})

	minetest.register_biome({
		name = "cold_desert_ocean",
		--node_dust = "",
		node_top = "color:yellow",
		depth_top = 1,
		node_filler = "color:yellow",
		depth_filler = 3,
		--node_stone = "",
		 node_water_top = "water:blue_water_source",
		depth_water_top = 10,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "color:yellow",
		depth_riverbed = 2,
		y_min = -112,
		y_max = 4,
		heat_point = 40,
		humidity_point = 0,
	})

	-- Savanna

	minetest.register_biome({
		name = "savanna",
		--node_dust = "",
		node_top = "color:orange",
		depth_top = 1,
		node_filler = "color:orange",
		depth_filler = 1,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "color:yellow",
		depth_riverbed = 2,
		y_min = 1,
		y_max = upper_limit,
		heat_point = 89,
		humidity_point = 42,
	})

	minetest.register_biome({
		name = "savanna_shore",
		--node_dust = "",
		node_top = "color:orange",
		depth_top = 1,
		node_filler = "color:orange",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "color:yellow",
		depth_riverbed = 2,
		y_min = -1,
		y_max = 0,
		heat_point = 89,
		humidity_point = 42,
	})

	minetest.register_biome({
		name = "savanna_ocean",
		--node_dust = "",
		node_top = "color:yellow",
		depth_top = 1,
		node_filler = "color:yellow",
		depth_filler = 3,
		--node_stone = "",
		 node_water_top = "water:blue_water_source",
		depth_water_top = 10,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "color:yellow",
		depth_riverbed = 2,
		y_min = -112,
		y_max = -2,
		heat_point = 89,
		humidity_point = 42,
	})

	-- Rainforest

	minetest.register_biome({
		name = "rainforest",
		--node_dust = "",
		node_top = "color:green",
		depth_top = 1,
		node_filler = "color:orange",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "color:yellow",
		depth_riverbed = 2,
		y_min = 1,
		y_max = upper_limit,
		heat_point = 86,
		humidity_point = 65,
	})

	minetest.register_biome({
		name = "rainforest_swamp",
		--node_dust = "",
		node_top = "color:orange",
		depth_top = 1,
		node_filler = "color:orange",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "color:yellow",
		depth_riverbed = 2,
		y_min = -1,
		y_max = 0,
		heat_point = 86,
		humidity_point = 65,
	})

	minetest.register_biome({
		name = "rainforest_ocean",
		--node_dust = "",
		node_top = "color:yellow",
		depth_top = 1,
		node_filler = "color:yellow",
		depth_filler = 3,
		--node_stone = "",
		 node_water_top = "water:blue_water_source",
		depth_water_top = 10,
		--node_water = "",
		--node_river_water = "",
		node_riverbed = "color:yellow",
		depth_riverbed = 2,
		y_min = -112,
		y_max = -2,
		heat_point = 86,
		humidity_point = 65,
	})

	-- Underground

	minetest.register_biome({
		name = "underground",
		--node_dust = "",
		--node_top = "",
		--depth_top = ,
		--node_filler = "",
		--depth_filler = ,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		y_min = -31000,
		y_max = -113,
		heat_point = 50,
		humidity_point = 50,
	})
end


-- Biomes for floatlands

function default.register_floatland_biomes(floatland_level, shadow_limit)

	-- Coniferous forest

	minetest.register_biome({
		name = "floatland_coniferous_forest",
		--node_dust = "",
		node_top = "color:green",
		depth_top = 1,
		node_filler = "color:orange",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		--node_riverbed = "",
		--depth_riverbed = ,
		y_min = floatland_level + 2,
		y_max = 31000,
		heat_point = 50,
		humidity_point = 70,
	})

	-- Grassland

	minetest.register_biome({
		name = "floatland_grassland",
		--node_dust = "",
		node_top = "color:green",
		depth_top = 1,
		node_filler = "color:orange",
		depth_filler = 1,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		--node_riverbed = "",
		--depth_riverbed = ,
		y_min = floatland_level + 2,
		y_max = 31000,
		heat_point = 50,
		humidity_point = 35,
	})

	-- Sandstone desert

	minetest.register_biome({
		name = "floatland_sandstone_desert",
		--node_dust = "",
		node_top = "color:yellow",
		depth_top = 1,
		node_filler = "color:yellow",
		depth_filler = 1,
		node_stone = "color:orange",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		--node_riverbed = "",
		--depth_riverbed = ,
		y_min = floatland_level + 2,
		y_max = 31000,
		heat_point = 50,
		humidity_point = 0,
	})

	-- Floatland ocean / underground

	minetest.register_biome({
		name = "floatland_ocean",
		--node_dust = "",
		node_top = "color:yellow",
		depth_top = 1,
		node_filler = "color:yellow",
		depth_filler = 3,
		--node_stone = "",
		--node_water_top = "",
		--depth_water_top = ,
		--node_water = "",
		--node_river_water = "",
		--node_riverbed = "",
		--depth_riverbed = ,
		y_min = shadow_limit,
		y_max = floatland_level + 1,
		heat_point = 50,
		humidity_point = 50,
	})
end


--
-- Register decorations
--

-- Mgv6

function default.register_mgv6_decorations()

	-- Papyrus

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"color:green"},
		sidelen = 16,
		noise_params = {
			offset = -0.3,
			scale = 0.7,
			spread = {x = 100, y = 100, z = 100},
			seed = 354,
			octaves = 3,
			persist = 0.7
		},
		y_min = 1,
		y_max = 1,
		decoration = "default:papyrus",
		height = 2,
		height_max = 4,
		spawn_by = "default:water_source",
		num_spawn_by = 1,
	})

	-- Cacti

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"color:yellow"},
		sidelen = 16,
		noise_params = {
			offset = -0.012,
			scale = 0.024,
			spread = {x = 100, y = 100, z = 100},
			seed = 230,
			octaves = 3,
			persist = 0.6
		},
		y_min = 1,
		y_max = 30,
		decoration = "default:cactus",
		height = 3,
	        height_max = 4,
	})

	-- Long grasses

	for length = 1, 5 do
		minetest.register_decoration({
			deco_type = "simple",
			place_on = {"color:green"},
			sidelen = 16,
			noise_params = {
				offset = 0,
				scale = 0.007,
				spread = {x = 100, y = 100, z = 100},
				seed = 329,
				octaves = 3,
				persist = 0.6
			},
			y_min = 1,
			y_max = 30,
			decoration = "default:grass_"..length,
		})
	end

	-- Dry shrubs

	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"color:yellow", "color:white"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.035,
			spread = {x = 100, y = 100, z = 100},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		y_min = 1,
		y_max = 30,
		decoration = "default:dry_shrub",
	})
end


-- All mapgens except mgv6

local function register_grass_decoration(offset, scale, length)
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"color:green", "color:yellow"},
		sidelen = 16,
		noise_params = {
			offset = offset,
			scale = scale,
			spread = {x = 200, y = 200, z = 200},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"grassland", "grassland_dunes", "deciduous_forest",
			"coniferous_forest", "coniferous_forest_dunes",
			"floatland_grassland", "floatland_coniferous_forest"},
		y_min = 1,
		y_max = 31000,
		decoration = "default:grass_" .. length,
	})
end

local function register_dry_grass_decoration(offset, scale, length)
	minetest.register_decoration({
		deco_type = "simple",
		place_on = {"color:green"},
		sidelen = 16,
		noise_params = {
			offset = offset,
			scale = scale,
			spread = {x = 200, y = 200, z = 200},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"savanna"},
		y_min = 1,
		y_max = 31000,
		decoration = "default:dry_grass_" .. length,
	})
end


function default.register_decorations()

	-- tree

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"color:green"},
		 		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.002,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {" deciduous_forest "},
		y_min = 1,
		y_max = 15,
		schematic = minetest.get_modpath("default") .. "/schematics/tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
	
	 minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"color:green"},
		 		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.002,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {" coniferous_forest "},
		y_min = 1,
		y_max = 15,
		schematic = minetest.get_modpath("default") .. "/schematics/redtree.mts",
		 flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	 minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"color:green"},
		 		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.002,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {" coniferous_forest "},
		y_min = 1,
		y_max = 15,
		schematic = minetest.get_modpath("default") .. "/schematics/yellowtree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})
	
	-- Cactus and stone

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"color:orange"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.002,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"savanna"},
		y_min = 1,
		y_max = 31000,
		schematic = minetest.get_modpath("default") .. "/schematics/cactus.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
	})

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"color:orange"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.001,
			spread = {x = 250, y = 250, z = 250},
			seed = 2,
			octaves = 3,
			persist = 0.66
		},
		biomes = {"savanna"},
		y_min = 1,
		y_max = 31000,
		schematic = minetest.get_modpath("default") .. "/schematics/stone.mts",
		 flags = "place_center_x, place_center_z",
		rotation = "random",
	})
	
end


--
-- Detect mapgen, flags and parameters to select functions
--

-- Get setting or default
local mgv7_spflags = minetest.get_mapgen_setting("mgv7_spflags") or
	"mountains, ridges, nofloatlands"
local captures_float = string.match(mgv7_spflags, "floatlands")
local captures_nofloat = string.match(mgv7_spflags, "nofloatlands")

local mgv7_floatland_level = minetest.get_mapgen_setting("mgv7_floatland_level") or 1280
local mgv7_shadow_limit = minetest.get_mapgen_setting("mgv7_shadow_limit") or 1024

minetest.clear_registered_biomes()
minetest.clear_registered_ores()
minetest.clear_registered_decorations()

local mg_name = minetest.get_mapgen_setting("mg_name")
if mg_name == "v6" then
	default.register_mgv6_decorations()
elseif mg_name == "v7" and captures_float == "floatlands" and
		captures_nofloat ~= "nofloatlands" then
	-- Mgv7 with floatlands
	default.register_biomes(mgv7_shadow_limit - 1)
	default.register_floatland_biomes(mgv7_floatland_level, mgv7_shadow_limit)
	default.register_decorations()
else
	default.register_biomes(31000)
	default.register_decorations()
end
