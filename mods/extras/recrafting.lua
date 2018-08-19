

if extras.recrafting then
    print("[MOD] extras Recrafting")
    local materials = { mese=     { modname='default',drop='mese_crystal'},
                        diamond=  { modname='default',drop='diamond'},
                        steel=    { modname='default',drop='steel_ingot'},
                        bronze=   { modname='default', drop='bronze_ingot'},
                        gold=     { modname='default', drop='gold_ingot'} }
    if minetest.get_modpath("moreores") then
        materials.mithril={ modname='moreores',drop='mithril_ingot'}
        materials.silver={ modname='moreores',drop='silver_ingot'}
    end

    for material,drop in pairs(materials) do
        minetest.register_craft({
            output = drop.modname..":"..drop.drop,
            recipe = {
                {drop.modname..":sword_"..material},
            }
        })
        minetest.register_craft({
            output = drop.modname..":"..drop.drop..' 2',
            recipe = {
                {drop.modname..":pick_"..material},
            }
        })
        minetest.register_craft({
            output = drop.modname..":"..drop.drop..' 2',
            recipe = {
                {drop.modname..":axe_"..material},
            }
        })
        if minetest.get_modpath("3d_armor") then
            minetest.register_craft({
                output = drop.modname..":"..drop.drop..' 3',
                recipe = {
                    {"3d_armor:boots_"..material},
                }
            })
            minetest.register_craft({
                output = drop.modname..":"..drop.drop..' 7',
                recipe = {
                    {"3d_armor:chestplate_"..material},
                }
            })
            minetest.register_craft({
                output = drop.modname..":"..drop.drop..' 4',
                recipe = {
                    {"3d_armor:helmet_"..material},
                }
            })
            minetest.register_craft({
                output = drop.modname..":"..drop.drop..' 6',
                recipe = {
                    {"3d_armor:leggings_"..material},
                }
            })
        end
        if minetest.get_modpath("shields") then
            minetest.register_craft({
                output = drop.modname..":"..drop.drop..' 6',
                recipe = {
                    {"shields:shield_"..material},
                }
            })
        end
    end
end
