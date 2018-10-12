ModSettings = {}
StartUp = function()
	script.on_event(defines.events.on_tick, nil)
end

GetRuntimeSettings = function()
	local startingEvolutionPercentage = tonumber(settings.global["starting_evolution_percentage"].value)
	if startingEvolutionPercentage > -1 then
		ModSettings.startingEvolutionFloat = startingEvolutionPercentage / 100
	else
		ModSettings.startingEvolutionFloat = -1
	end
	
	local maximumEvolutionPercentage = tonumber(settings.global["maximum_evolution_percentage"].value)
	if maximumEvolutionPercentage > -1 then
		ModSettings.maxEvolutionFloat = maximumEvolutionPercentage / 100
	else
		ModSettings.maxEvolutionFloat = -1
	end
	
	ModSettings.pathfinderMaxLongPaths = tonumber(settings.global["pathfinder_max_long_paths"].value)
	ModSettings.pathfinderMaxShortPaths = tonumber(settings.global["pathfinder_max_short_paths"].value)
	ModSettings.pathfinderMaxStepsWorkedPerTick = tonumber(settings.global["pathfinder_max_steps_worked_per_tick"].value)
end

CorrectEvolution = function()
	if ModSettings.startingEvolutionFloat > -1 and game.forces.enemy.evolution_factor < ModSettings.startingEvolutionFloat then
		game.forces.enemy.evolution_factor = ModSettings.startingEvolutionFloat
	elseif ModSettings.maxEvolutionFloat > -1 and game.forces.enemy.evolution_factor > ModSettings.maxEvolutionFloat then
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



On10SecondUpdate = function()
	GetRuntimeSettings()
	CorrectEvolution()
	UpdatePathSettings()
end



script.on_nth_tick(600, function() On10SecondUpdate() end)
script.on_event(defines.events.on_tick, StartUp)