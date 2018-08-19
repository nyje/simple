-- Minetest 0.4 mod: default
-- See README.txt for licensing and other information.

-- The API documentation in here was moved into game_api.txt

-- Definitions made by this mod that other mods can use too
default = {}

default.LIGHT_MAX = 14

-- GUI related stuff
default.gui_bg = "bgcolor[#080808BB;true]"
default.gui_bg_img = "background[5,5;1,1;gui_formbg.png;true]"
default.gui_slots = "listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF]"



-- Load files
local default_path = minetest.get_modpath("default")

dofile(default_path.."/functions.lua")
dofile(default_path.."/mapgen.lua")
dofile(default_path.."/player.lua")
dofile(default_path.."/aliases.lua")
dofile(default_path.."/creative.lua")
