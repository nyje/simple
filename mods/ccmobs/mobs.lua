--
-- Mobs
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

mobs:register_mob("ccmobs:" .. name, {
	type = "animal",
	hp_max = 1,
	collisionbox = {-0.25*(0.5/0.7), -0.33*(0.5/0.7), -0.25*(0.5/0.7), 0.25*(0.5/0.7), 0.33*(0.5/0.7), 0.25*(0.5/0.7)},
	visual = "cube",
	visual_size = { x = 0.5, y = 0.5},
	textures = {"color_" .. name .. ".png", "color_" .. name .. ".png", "color_" .. name ..".png", "color_" .. name ..".png", "" .. name .. "_front.png", "color_" .. name .. ".png"},
	makes_footstep_sound = false,
	walk_velocity = 2,
	armor = 0,
	drops = {
		{name = "ccmobs:" .. name,
		chance = 2,
		min = 2,
		max = 2,},
		},
	drawtype = "front",
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	on_rightclick = function(self, clicker)
	tool = clicker:get_wielded_item():get_name()
		if tool == "ccmobs:cage" then
				clicker:get_inventory():add_item("main", "ccmobs:" .. name)
				self.object:remove()
		elseif clicker:get_inventory() and not self.empty then
			self.empty = true
				clicker:get_inventory():add_item("main", "ccmobs:egg")
		end
	end,
})

minetest.register_craftitem("ccmobs:egg", {
	description = "egg",
	inventory_image = "" .. name .. "_front.png",
	on_use = minetest.item_eat(1),
})

minetest.register_node("ccmobs:" .. name .. "_block", {
	description = "" .. name .. " block",
	 tiles = {"color_" .. name .. ".png", "color_" .. name .. ".png", "color_" .. name ..".png", "color_" .. name ..".png", "color_" .. name .. ".png", "" .. name .. "_front.png"},
	paramtype2 = "facedir",
	groups = {cracky = 2},
	is_ground_content = false,
	sounds = default.node_sound_defaults(),
})

end
