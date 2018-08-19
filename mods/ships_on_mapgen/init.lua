
ships_on_mapgen = {}

-- if set to 100: place one ship in each mapchunk if possible;
-- if set to a lower value: percent chance of placing a ship
-- in a mapchunk

math.randomseed(os.time())

ships_on_mapgen.probability_per_mapchunk = 10;

ships_on_mapgen.schematics = {
	-- yoff: how deep is the ship burried in water?
 {scm="boat", typ="ship", is_ship=true, yoff=-1, orients={0}},
}


ships_on_mapgen.mts_path = minetest.get_modpath( minetest.get_current_modname() ).."/schems/";

-- determine the size of the given houses and other necessary values
for i,v in ipairs( ships_on_mapgen.schematics ) do
	v.mts_path = ships_on_mapgen.mts_path;
	v.is_ship = true;
	v.typ = "ship";
	ships_on_mapgen.schematics[ i ] = handle_schematics.analyze_file( nil, nil, v.mts_path .. v.scm, v, false ); 
end


minetest.register_on_generated(function(minp, maxp, seed)
	-- no point in placing boats on mountains or deep below sealevel
	if( minp.y < -64 or minp.y > 0) then
		return;
	end

	local heightmap = minetest.get_mapgen_object('heightmap');
	if( not( heightmap )) then
		return;
	end

	-- place a ship on water if possible; do this with the given probability
	if( math.random(1,100)<ships_on_mapgen.probability_per_mapchunk ) then
		-- I have accidently used the building spawner instead of a chest when building the
		-- rafts. But that can easily be corrected here.
		local replacements = {{'handle_schematics:build','default:chest'}};
		-- choose a random ship
		local building = ships_on_mapgen.schematics[ math.random(1,#ships_on_mapgen.schematics) ];
		-- the boat file uses strange blocks not occouring in default
		
		local success = handle_schematics.place_schematic_on_flat_land( heightmap, minp, maxp,
			building.sizex, building.sizez, -100+4, building.yoff-1,
			3, 3, 0, 0, -- margin: front, back, right, left
			ships_on_mapgen.mts_path..building.scm, --..".mts",
			replacements,
			building.yoff,
			building.orients[1],
			building
			);
	end
end);
