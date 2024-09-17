--This creates the livingcavesmobs object.
livingcavesmobs = {}

--This creates the livingcavesmobs.settings object, and fills it with either the menu selected choices as defined in settingtypes.txt, or default values, (In this case, false).
livingcavesmobs.settings = {
	clear_biomes			= minetest.settings:get_bool("livingcavesmobs.clear_biomes") or false,
	clear_decos			= minetest.settings:get_bool("livingcavesmobs.clear_decos") or false,
	clear_ores			= minetest.settings:get_bool("livingcavesmobs.clear_ores") or false,
}

if livingcavesmobs.settings.clear_biomes then
	minetest.clear_registered_biomes()
end
if livingcavesmobs.settings.clear_decos then
	minetest.clear_registered_decorations()
end
if livingcavesmobs.settings.clear_ores then
	minetest.clear_registered_ores()
end

local modname = "livingcavesmobs"
local modpath = minetest.get_modpath(modname)
local mg_name = minetest.get_mapgen_setting("mg_name")

-- Load support for intllib.
local path = minetest.get_modpath(minetest.get_current_modname()) .. "/"

livingcavesmobs.custom_spawn = false
local input = io.open(path .. "spawn.lua", "r")

if input then
	livingcavesmobs.custom_spawn = true
	input:close()
	input = nil
end

local S = minetest.get_translator and minetest.get_translator("livingcavesmobs") or
		dofile(path .. "intllib.lua")

livingcavesmobs.S = S

-- plants
dofile(path .. "biter.lua") --
dofile(path .. "chubby.lua") --
dofile(path .. "explodingbacteria.lua") --
dofile(path .. "flesheatingbacteria.lua") --
dofile(path .. "moth.lua") --
dofile(path .. "grub.lua") --
dofile(path .. "yeti.lua") --
dofile(path .. "hunger.lua") --

if livingcavesmobs.custom_spawn then
	dofile(path .. "spawn.lua")
end



print (S("[MOD] Caves loaded"))
