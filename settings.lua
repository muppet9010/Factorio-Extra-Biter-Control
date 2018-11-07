data:extend({	
	{
		name = "biter_collision_box_percent",
		type = "int-setting",
		default_value = "-1",
		minimum_value = -1,
		setting_type = "startup",
		order = "1101"
	},
	{
		name = "spitter_collision_box_percent",
		type = "int-setting",
		default_value = "-1",
		minimum_value = -1,
		setting_type = "startup",
		order = "1102"
	},
	{
		name = "blood",
		type = "string-setting",
		default_value = "Unchanged",
		allow_blank = false,
		allowed_values = {"No", "Unchanged"},
		setting_type = "startup",
		order = "1103"
	},
	{
		name = "corpse_decay_seconds",
		type = "int-setting",
		default_value = "-1",
		minimum_value = -1,
		setting_type = "startup",
		order = "1104"
	},
	
	
	
	{
		name = "min_pursue_time_ticks",
		type = "int-setting",
		default_value = -1,
		minimum_value = -1,
		setting_type = "startup",
		order = "1201"
	},
	{
		name = "max_pursue_distance_tiles",
		type = "int-setting",
		default_value = -1,
		minimum_value = -1,
		setting_type = "startup",
		order = "1202"
	},
	{
		name = "vision_distance_tiles",
		type = "int-setting",
		default_value = -1,
		minimum_value = -1,
		setting_type = "startup",
		order = "1203"
	},
	{
		name = "immune_to_belts",
		type = "string-setting",
		default_value = "Unchanged",
		allow_blank = false,
		allowed_values = {"Yes", "No", "Unchanged"},
		setting_type = "startup",
		order = "1204"
	},
	
	
	
	{
		name = "spawner_pollution_absorbtion_max",
		type = "int-setting",
		default_value = -1,
		minimum_value = -1,
		setting_type = "startup",
		order = "1301"
	},
	{
		name = "spawner_pollution_absorbtion_percent",
		type = "int-setting",
		default_value = -1,
		minimum_value = -1,
		maximum_value = 100,
		setting_type = "startup",
		order = "1302"
	}, 
	{
		name = "spawner_max_units_map",
		type = "int-setting",
		default_value = -1,
		minimum_value = -1,
		setting_type = "startup",
		order = "1303"
	},
	{
		name = "spawner_max_units_local",
		type = "int-setting",
		default_value = -1,
		minimum_value = -1,
		setting_type = "startup",
		order = "1304"
	},
	{
		name = "spawner_spawning_cooldown_min_evolution_ticks",
		type = "int-setting",
		default_value = -1,
		minimum_value = -1,
		setting_type = "startup",
		order = "1305"
	},
	{
		name = "spawner_spawning_cooldown_max_evolution_ticks",
		type = "int-setting",
		default_value = -1,
		minimum_value = -1,
		setting_type = "startup",
		order = "1306"
	},
	{
		name = "spawner_call_for_help_radius_tiles",
		type = "int-setting",
		default_value = -1,
		minimum_value = -1,
		setting_type = "startup",
		order = "1307"
	},
	
	
	
	{
		name = "starting_evolution_percentage",
		type = "int-setting",
		default_value = -1,
		minimum_value = -1,
		maximum_value = 100,
		setting_type = "runtime-global",
		order = "2101"
	},
	{
		name = "maximum_evolution_percentage",
		type = "int-setting",
		default_value = -1,
		minimum_value = -1,
		maximum_value = 100,
		setting_type = "runtime-global",
		order = "2102"
	},
	
	
	
	{
		name = "maximum_gathering_unit_groups",
		type = "int-setting",
		default_value = -1,
		minimum_value = -1,
		setting_type = "runtime-global",
		order = "2201"
	},
	{
		name = "maximum_unit_group_size",
		type = "int-setting",
		default_value = -1,
		minimum_value = -1,
		setting_type = "runtime-global",
		order = "2202"
	},
	
	
	
	{
		name = "pathfinder_max_long_paths",
		type = "int-setting",
		default_value = -1,
		minimum_value = -1,
		setting_type = "runtime-global",
		order = "2301"
	},
	{
		name = "pathfinder_max_short_paths",
		type = "int-setting",
		default_value = -1,
		minimum_value = -1,
		setting_type = "runtime-global",
		order = "2302"
	},
	{
		name = "pathfinder_max_steps_worked_per_tick",
		type = "int-setting",
		default_value = -1,
		minimum_value = -1,
		setting_type = "runtime-global",
		order = "2303"
	},
	
})