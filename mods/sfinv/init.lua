dofile(minetest.get_modpath("sfinv") .. "/api.lua")

sfinv.register_page("sfinv:crafting", {
	title = "Nodes",
	get = function(self, player, context)
        local waters = ""
        if player then
            local hasspill = minetest.check_player_privs(player, {spill=true})
            if hasspill then waters = "image_button_exit[6,0;1,1;water.png;waters;]" end
        end
		return sfinv.make_formspec(player, context, [[
            image_button_exit[0,0;1,1;blocks.png;blocks;]
            image_button_exit[1,0;1,1;light.png;lights;]
            image_button_exit[2,0;1,1;wool.png;wool;]
            image_button_exit[3,0;1,1;cwood.png;cwood;]
            image_button_exit[4,0;1,1;cbrick.png;cbrick;]
            image_button_exit[5,0;1,1;mobs.png;mobs;]

            image_button_exit[0,1;1,1;window.png;windows;]
            image_button_exit[1,1;1,1;cglass.png;cglass;]
            image_button_exit[2,1;1,1;cone.png;cone;]
            image_button_exit[3,1;1,1;cylinder.png;cylinder;]
            image_button_exit[4,1;1,1;sphere.png;sphere;]
            image_button_exit[5,1;1,1;stair_slab.png;slabs;]
            image_button_exit[6,1;1,1;curtain.png;carpets;]

            image_button_exit[0,2;1,1;stair.png;stairs;]
            image_button_exit[1,2;1,1;stair_inner.png;stair_inner;]
            image_button_exit[2,2;1,1;stair_outer.png;stair_outer;]
            image_button_exit[3,2;1,1;slope.png;slope;]
            image_button_exit[4,2;1,1;slope_inner.png;islope;]
            image_button_exit[5,2;1,1;slope_outer.png;oslope;]
            image_button_exit[6,2;1,1;long.png;long;]

            image_button_exit[0,4;1,1;door.png;doors;]
            image_button_exit[1,4;1,1;trapdoor.png;trapdoor;]
            image_button_exit[2,4;1,1;fence.png;fence;]
            image_button_exit[3,4;1,1;bench.png;bench;]
            image_button_exit[4,4;1,1;chair.png;chair;]
            image_button_exit[5,4;1,1;tinytable.png;tinytable;]
            image_button_exit[6,4;1,1;smalltable.png;smalltable;]

            image_button_exit[0,5;1,1;table.png;table;]
            image_button_exit[1,5;1,1;number.png;number;]
            image_button_exit[2,5;1,1;alpha1.png;alpha1;]
            image_button_exit[3,5;1,1;alpha2.png;alpha2;]
            image_button_exit[4,5;1,1;tools.png;tools;]

            ]] ..waters, true)
	end
})



