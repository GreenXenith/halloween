--[[ Halloween Mod ]]--

-- Register candies
dofile(minetest.get_modpath("halloween").."/candy.lua")

-- Register costumes if 3d_armor is enabled
if minetest.global_exists("armor") then
	dofile(minetest.get_modpath("halloween").."/costumes.lua")
end