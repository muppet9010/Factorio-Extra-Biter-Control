UpdateSetting = function(settingName)
	if settingName == "starting_evolution_percentage" or settingName == nil then
		UpdatedStartingEvolutionSetting()
	end
	if settingName == "maximum_evolution_percentage" or settingName == nil then
		UpdatedMaximumEvolutionSetting()
	end
	if settingName == "pathfinder_max_long_paths" or settingName == nil then
		UpdatePathfindingMaxLongPaths()
	end
	if settingName == "pathfinder_max_short_paths" or settingName == nil then
		UpdatePathfindingMaxShortPaths()
	end
	if settingName == "pathfinder_max_steps_worked_per_tick" or settingName == nil then
		UpdatePathfindingMaxStepsPerTick()
	end
	if settingName == "maximum_gathering_unit_groups" or settingName == nil then
		UpdateMaxGatheringUnitGroups()
	end
	if settingName == "maximum_unit_group_size" or settingName == nil then
		UpdateMaxUnitGroupSize()
	end
end

UpdatedStartingEvolutionSetting = function()
	local startingEvolutionPercentage = tonumber(settings.global["starting_evolution_percentage"].value)
	if startingEvolutionPercentage > -1 then
		ModSettings.startingEvolutionFloat = startingEvolutionPercentage / 100
	else
		ModSettings.startingEvolutionFloat = -1
	end
	CorrectMinEvolution()
end

UpdatedMaximumEvolutionSetting = function()
	local maximumEvolutionPercentage = tonumber(settings.global["maximum_evolution_percentage"].value)
	if maximumEvolutionPercentage > -1 then
		ModSettings.maxEvolutionFloat = maximumEvolutionPercentage / 100
	else
		ModSettings.maxEvolutionFloat = -1
	end
	CorrectMaxEvolution()
end

UpdatePathfindingMaxLongPaths = function()
	local longPathSetting = tonumber(settings.global["pathfinder_max_long_paths"].value)
	if longPathSetting > -1 then
		game.map_settings.path_finder.max_clients_to_accept_any_new_request = longPathSetting
	end
end

UpdatePathfindingMaxShortPaths = function()
	local shortPathSetting = tonumber(settings.global["pathfinder_max_short_paths"].value)
	if shortPathSetting > -1 then
		game.map_settings.path_finder.max_clients_to_accept_short_new_request = shortPathSetting
	end
end

UpdatePathfindingMaxStepsPerTick = function()
	local maxStepsSetting = tonumber(settings.global["pathfinder_max_steps_worked_per_tick"].value)
	if maxStepsSetting > -1 then
		game.map_settings.path_finder.max_steps_worked_per_tick = maxStepsSetting
	end
end

UpdateMaxGatheringUnitGroups = function()
	local gatheringUnitsSetting = tonumber(settings.global["maximum_gathering_unit_groups"].value)
	if gatheringUnitsSetting > -1 then
		game.map_settings.unit_group.max_gathering_unit_groups = gatheringUnitsSetting
	end
end

UpdateMaxUnitGroupSize = function()
	local unitGroupSizeSetting = tonumber(settings.global["maximum_unit_group_size"].value)
	if unitGroupSizeSetting > -1 then
		game.map_settings.unit_group.max_unit_group_size = unitGroupSizeSetting
	end
end

CorrectEvolution = function()
	CorrectMinEvolution()
	CorrectMaxEvolution()
end

CorrectMinEvolution = function()
	if ModSettings.startingEvolutionFloat > -1 and game.forces.enemy.evolution_factor < ModSettings.startingEvolutionFloat then
		game.forces.enemy.evolution_factor = ModSettings.startingEvolutionFloat
	end
end

CorrectMaxEvolution = function()
	if ModSettings.maxEvolutionFloat > -1 and game.forces.enemy.evolution_factor > ModSettings.maxEvolutionFloat then
		game.forces.enemy.evolution_factor = ModSettings.maxEvolutionFloat
	end
end




OnStartup = function()
	OnLoad()
	UpdateSetting(nil)
end

OnLoad = function()
	if global.ModSettings == nil then global.ModSettings = {} end
	ModSettings = global.ModSettings
end

On10SecondUpdate = function()
	CorrectEvolution()
end

OnSettingChanged = function(event)
	UpdateSetting(event.setting)
end




script.on_init(function()
	OnStartup()
end)
script.on_load(function() 
	OnLoad()
end)
script.on_nth_tick(600, function() On10SecondUpdate() end)
script.on_event(defines.events.on_runtime_mod_setting_changed, OnSettingChanged)
script.on_configuration_changed(function()
	OnStartup()
end)




Log = function(text)
	game.print(text)
	game.write_file("Extra_Biter_Control_logOutput.txt", tostring(text) .. "\r\n", true)
end