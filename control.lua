UpdateSetting = function(settingName)
	if settingName == "starting_evolution_percentage" or settingName == nil then
		UpdatedStartingEvolutionSetting()
	end
	if settingName == "maximum_evolution_percentage" or settingName == nil then
		UpdatedMaximumEvolutionSetting()
	end
	if settingName == "pathfinder_max_long_paths" or settingName == nil then
		ModSettings.pathfinderMaxLongPaths = tonumber(settings.global["pathfinder_max_long_paths"].value)
	end
	if settingName == "pathfinder_max_short_paths" or settingName == nil then
		ModSettings.pathfinderMaxShortPaths = tonumber(settings.global["pathfinder_max_short_paths"].value)
	end
	if settingName == "pathfinder_max_steps_worked_per_tick" or settingName == nil then
		ModSettings.pathfinderMaxStepsWorkedPerTick = tonumber(settings.global["pathfinder_max_steps_worked_per_tick"].value)
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

UpdatePathSettings = function()
	if ModSettings.pathfinderMaxLongPaths > -1 then
		game.map_settings.path_finder.max_clients_to_accept_any_new_request = ModSettings.pathfinderMaxLongPaths
	end
	if ModSettings.pathfinderMaxShortPaths > -1 then
		game.map_settings.path_finder.max_clients_to_accept_short_new_request = ModSettings.pathfinderMaxShortPaths
	end
	if ModSettings.pathfinderMaxStepsWorkedPerTick > -1 then
		game.map_settings.path_finder.max_steps_worked_per_tick = ModSettings.pathfinderMaxStepsWorkedPerTick
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