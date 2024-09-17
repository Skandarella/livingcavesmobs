
--[[ Spawn Template, defaults to values shown if line not provided

mobs:spawn({

	name = "",

		- Name of mob, must be provided e.g. "mymod:my_mob"

	nodes = {"group:soil, "group:stone"},

		- Nodes to spawn on top of.

	neighbors = {"air"},

		- Nodes to spawn beside.

	min_light = 0,

		- Minimum light level.

	max_light = 15,

		- Maximum light level, 15 is sunlight only.

	interval = 30,

		- Spawn interval in seconds.

	chance = 5000,

		- Spawn chance, 1 in every 5000 nodes.

	active_object_count = 1,

		- Active mobs of this type in area.

	min_height = -31000,

		- Minimum height level.

	max_height = 31000,

		- Maximum height level.

	day_toggle = nil,

		- Daytime toggle, true to spawn during day, false for night, nil for both

	on_spawn = nil,

		- On spawn function to run when mob spawns in world

	on_map_load = nil,

		- On map load, when true mob only spawns in newly generated map areas
})
]]--

local random = math.random

mobs:spawn({
	name = "livingcavesmobs:biter",
	nodes = {"livingcaves:dripstonecave_bottom"},
	min_light = 0,
	interval = 60,
	chance = 80,
	active_object_count = 3,
	min_height = -200,
	max_height = -90,
})

mobs:spawn({
	name = "livingcavesmobs:chubby",
	nodes = {"livingcaves:water_source", "livingcaves:water_flowing"},
	neighbors = {"livingcaves:bacteriacave_poolstone"},
	min_light = 0,
	interval = 60,
	chance = 80,
	active_object_count = 1,
	min_height = -400,
	max_height = -200,
})

mobs:spawn({
	name = "livingcavesmobs:explodingbacteria",
	nodes = {"livingcaves:bacteriacave_nest"},
	neighbors = {"livingcaves:bacteriacave_nestfoot"},
	min_light = 0,
	interval = 10,
	chance = 1,
	active_object_count = 4,
	min_height = -400,
	max_height = -200,

	on_spawn = function(self, pos)

		local nods = minetest.find_nodes_in_area_under_air(
			{x = pos.x - 4, y = pos.y - 3, z = pos.z - 4},
			{x = pos.x + 4, y = pos.y + 3, z = pos.z + 4},
			{"livingcaves:bacteriacave_nest"})

		if nods and #nods > 0 then

			local iter = math.min(#nods, 4)

			for n = 1, iter do

				local pos2 = nods[random(#nods)]
				local kid = random(4) == 1 and true or nil

				pos2.y = pos2.y + 2

				if minetest.get_node(pos2).name == "air" then

					mobs:add_mob(pos2, {
						name = "livingcavesmobs:explodingbacteria", child = kid})
				end
			end
		end
	end
})

mobs:spawn({
	name = "livingcavesmobs:flesheatingbacteria",
	nodes = {"livingcaves:bacteriacave_trapnode"},
	min_light = 0,
	interval = 10,
	chance = 1,
	active_object_count = 4,
	min_height = -400,
	max_height = -200,
})

mobs:spawn({
	name = "livingcavesmobs:moth",
	nodes = {"livingcaves:mushcave_bottom"},
	min_light = 0,
	interval = 60,
	chance = 800,
	active_object_count = 4,
	min_height = -90,
	max_height = -30,
})

mobs:spawn({
	name = "livingcavesmobs:yeti",
	nodes = {"livingcaves:icecave_ice"},
	min_light = 0,
	interval = 60,
	chance = 2,
	active_object_count = 1,
	min_height = -30,
	max_height = -5,
})
