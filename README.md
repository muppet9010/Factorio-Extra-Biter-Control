# Factorio-Extra-Biter-Control
Gives extra control to tweak biter spawning, quantity and movement beyond standard map settings



The mod allows configuring of biter related settings that are not exposed via the map generation settings. It was designed to help make challenging multiplayer maps, but can also weaken biters or affect the game's balance as desired. The mod doesn't allow changing of individual biter types, instead, all settings are related to the wider game aspects.

All settings have an option to not change the current value. This is to avoid overwriting other mods, scenario, config or console configured settings. This will be either the option "Unchanged" for Yes/No options and "-1" for numerical options.

The mod changes its settings during the data-update stage and uses filters to identify what it affects. So it should be compatible with other mods that change the gameplay or add new enemies, buildings, etc.
 - Biter = Any "unit" that is of group "enemies" with the word "biter" in its prototype (code) name.
 - Spitter = Any "unit" that is of group "enemies" with the word "spitter" in its prototype (code) name.
 - Biter and Spitter = Any "unit" that is of group "enemies".
 - Spawner = Any "unit-spawner" that is of group "enemies".

Most options are startup type options due to how they change the game elements. Thus requiring a game restart to apply to new and loaded games.
The options under "Map" are checked and updated every 10 seconds, so they can be changed during gameplay. The options current value is applied every 10 seconds, so if an option changes an internal game setting away from default at the start of the game, the option must be set to the desired value and not "Unchanged/-1" to get it to update the internal game setting back to default during the game. 

The settings are of a technical nature and include detailed mod options hover text. Below are additional observations in relation to a few of the options:
 - Biter and Spitter Death Blood Enabled = Can't be forced on via the mod as each enemy unit type has a unique setting and other mods may have added or changed this.
 - Pathfinder Maximum Concurrent Long Path Processing = How many long paths (default game pathing config around 100 tiles) will be processed at once. If using large numbers of concurrent pathing tasks (unit groups or individually commanded units) then increasing this setting can help avoid path re-use by them. When paths are re-used the unit groups/biters walk to the nearest existing path, forming a long column following the same path, rather than taking their own routes. Means they reach the target in a queue rather than as a wall of units. By default over 10 long paths requested at once will cause this queueing column effect. In testing, I have upped this from 10 to 100 without issues.
 - Pathfinder Maximum Concurrent Short Path Processing = Same as the long Path version, but for short paths. Increase similar logic to long paths. Defaults to 100, in testing, increased to 1000 without issues.
 - Pathfinder Maximum Steps Processed Per Tick = How much pathfinding steps will be done per tick. This is used to stop heavy pathfinding using too much UPS. However, in some game scenarios, this is more desirable than pathing requests being queued. When unit group/biter pathing requests are queued they just sit there and the Pathing Request debug layer shows as yellow. For high biter counts (thousands) I have increased this from the default 100 to 1000 without significant issue. This must be balanced based on desired biter effectiveness vs megabase UPS usage, etc.
