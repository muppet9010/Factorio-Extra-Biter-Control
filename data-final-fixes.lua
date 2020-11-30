--Bitters
local biterCollisionBoxPercent = tonumber(settings.startup["biter_collision_box_percent"].value)
local biterCollisionBoxMultiplier = biterCollisionBoxPercent / 100
for _, unitPrototype in pairs(data.raw.unit) do
    if unitPrototype.subgroup == "enemies" and string.find(unitPrototype.name, "biter") ~= nil then
        if biterCollisionBoxPercent > -1 then
            unitPrototype.collision_box[1][1] = unitPrototype.collision_box[1][1] * biterCollisionBoxMultiplier
            unitPrototype.collision_box[1][2] = unitPrototype.collision_box[1][2] * biterCollisionBoxMultiplier
            unitPrototype.collision_box[2][1] = unitPrototype.collision_box[2][1] * biterCollisionBoxMultiplier
            unitPrototype.collision_box[2][2] = unitPrototype.collision_box[2][2] * biterCollisionBoxMultiplier
        end
    end
end

--Spitters
local spitterCollisionBoxPercent = tonumber(settings.startup["spitter_collision_box_percent"].value)
local spitterCollisionBoxMultiplier = spitterCollisionBoxPercent / 100
for _, unitPrototype in pairs(data.raw.unit) do
    if unitPrototype.subgroup == "enemies" and string.find(unitPrototype.name, "spitter") ~= nil then
        if spitterCollisionBoxPercent > -1 then
            unitPrototype.collision_box[1][1] = unitPrototype.collision_box[1][1] * spitterCollisionBoxMultiplier
            unitPrototype.collision_box[1][2] = unitPrototype.collision_box[1][2] * spitterCollisionBoxMultiplier
            unitPrototype.collision_box[2][1] = unitPrototype.collision_box[2][1] * spitterCollisionBoxMultiplier
            unitPrototype.collision_box[2][2] = unitPrototype.collision_box[2][2] * spitterCollisionBoxMultiplier
        end
    end
end

--Both Biters and Spitters
local blood = settings.startup["blood"].value
local minPursueTimeTicks = tonumber(settings.startup["min_pursue_time_ticks"].value)
local maxPursueDistanceTiles = tonumber(settings.startup["max_pursue_distance_tiles"].value)
local visionDistanceTiles = tonumber(settings.startup["vision_distance_tiles"].value)
local immuneToBelts = settings.startup["immune_to_belts"].value
for _, unitPrototype in pairs(data.raw.unit) do
    if unitPrototype.subgroup == "enemies" then
        if blood == "No" then
            unitPrototype.dying_explosion = nil
        end
        if minPursueTimeTicks > -1 then
            unitPrototype.min_pursue_time = minPursueTimeTicks
        end
        if maxPursueDistanceTiles > -1 then
            unitPrototype.max_pursue_distance = maxPursueDistanceTiles
        end
        if visionDistanceTiles > -1 then
            unitPrototype.vision_distance = visionDistanceTiles
        end
        if immuneToBelts ~= "Unchanged" then
            if immuneToBelts == "Yes" then
                unitPrototype.has_belt_immunity = true
            else
                unitPrototype.has_belt_immunity = false
            end
        end
    end
end

--Spawners
local spawnerPollutionAbsorbtionMax = tonumber(settings.startup["spawner_pollution_absorbtion_max"].value)
local spawnerPollutionAbsorbtionPercent = tonumber(settings.startup["spawner_pollution_absorbtion_percent"].value)
local spawnerMaxUnitsMap = tonumber(settings.startup["spawner_max_units_map"].value)
local spawnerMaxUnitsLocal = tonumber(settings.startup["spawner_max_units_local"].value)
local spawnerSpawningCooldownMinEvolution_ticks = tonumber(settings.startup["spawner_spawning_cooldown_min_evolution_ticks"].value)
local spawnerSpawningCooldownMaxEvolution_ticks = tonumber(settings.startup["spawner_spawning_cooldown_max_evolution_ticks"].value)
local spawnerCallForHelpRadiusTiles = tonumber(settings.startup["spawner_call_for_help_radius_tiles"].value)
for _, unitPrototype in pairs(data.raw["unit-spawner"]) do
    if unitPrototype.subgroup == "enemies" then
        if spawnerPollutionAbsorbtionMax > -1 then
            unitPrototype.pollution_absorption_absolute = spawnerPollutionAbsorbtionMax
        end
        if spawnerPollutionAbsorbtionPercent > -1 then
            unitPrototype.pollution_absorption_proportional = spawnerPollutionAbsorbtionPercent / 100
        end
        if spawnerMaxUnitsMap > -1 then
            unitPrototype.max_count_of_owned_units = spawnerMaxUnitsMap
        end
        if spawnerMaxUnitsLocal > -1 then
            unitPrototype.max_friends_around_to_spawn = spawnerMaxUnitsLocal
        end

        local spawningCooldownMinEvo = unitPrototype.spawning_cooldown[1]
        if spawnerSpawningCooldownMinEvolution_ticks > -1 then
            spawningCooldownMinEvo = spawnerSpawningCooldownMinEvolution_ticks
        end
        local spawningCooldownMaxEvo = unitPrototype.spawning_cooldown[2]
        if spawnerSpawningCooldownMaxEvolution_ticks > -1 then
            spawningCooldownMaxEvo = spawnerSpawningCooldownMaxEvolution_ticks
        end
        unitPrototype.spawning_cooldown = {spawningCooldownMinEvo, spawningCooldownMaxEvo}

        if spawnerCallForHelpRadiusTiles > -1 then
            unitPrototype.call_for_help_radius = spawnerCallForHelpRadiusTiles
        end
    end
end

--Turrets
local wormCallForHelpRadiusTiles = tonumber(settings.startup["worm_call_for_help_radius_tiles"].value)
for _, unitPrototype in pairs(data.raw["turret"]) do
    if unitPrototype.subgroup == "enemies" then
        if wormCallForHelpRadiusTiles > -1 then
            unitPrototype.call_for_help_radius = wormCallForHelpRadiusTiles
        end
    end
end

--Corpses
local corpseDecaySeconds = settings.startup["corpse_decay_seconds"].value
if corpseDecaySeconds > 0 then
    local corpseDecayTicks = corpseDecaySeconds * 60
    local corpses = {}
    for _, unitPrototype in pairs(data.raw.unit) do
        if unitPrototype.subgroup == "enemies" and unitPrototype.corpse ~= nil then
            corpses[unitPrototype.corpse] = 1
        end
    end
    for corpseName, _ in pairs(corpses) do
        local corpse = data.raw.corpse[corpseName]
        corpse.time_before_removed = corpseDecayTicks
    end
elseif corpseDecaySeconds == 0 then
    for _, unitPrototype in pairs(data.raw.unit) do
        if unitPrototype.subgroup == "enemies" and unitPrototype.corpse ~= nil then
            unitPrototype.corpse = nil
        end
    end
end
