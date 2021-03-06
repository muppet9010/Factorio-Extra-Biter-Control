# Factorio-Extra-Biter-Control



The mod allows configuring of biter related settings that are not exposed via the map generation settings. It was designed to help make challenging multiplayer maps, but can also weaken biters or affect the game's balance as desired. The mod doesn't allow changing of individual biter types, instead, all settings are related to the wider game aspects.

The optional settings include:

 - Starting and max evolution
 - Enemy units hitbox size (allows smoother movement)
 - Enemy units immune to belts
 - Enemy call for assistance and pursue options
 - Spawner pollution absorption and enemy generation rates
 - Enemy attack group behaviours
 - Pathfinder concurrent activity limits
 - UPS optimisations (blood and corpses)

Settings Details
---------
All settings have an option to not change the current value. This is to avoid overwriting other mods, scenario, config or console configured settings. This will be either the option "Unchanged" for Yes/No options and "-1" for numerical options.

Most options are startup type options due to how they change the game elements. Thus requiring a game restart to apply to new and loaded games.
If Evolution min/max settings are enabled they are checked and enforced every 10 seconds.
Once a mod option has changed an internal game setting away from its default value, the option must be set to the desired value and not "Unchanged/-1" to get the internal game setting back to its default value during the game. This is as the "Unchanged/-1" option is inert to avoid overwriting other mod's changes.

Mod Setting Definitions
---------------
The mod changes its settings during the data-final-fixes stage and uses filters to identify what it affects. So it should be compatible with other mods that change the gameplay or add new enemies, buildings, etc.

- Biter = Any "unit" that is of group "enemies" with the word "biter" in its prototype (code) name.
- Spitter = Any "unit" that is of group "enemies" with the word "spitter" in its prototype (code) name.
- Biter and Spitter = Any "unit" that is of group "enemies".
- Spawner = Any "unit-spawner" that is of group "enemies".
- Worm = Any "turret" that is of group "enemies".

Advanced Mod Settings Information
-----------
All mod settings are of a technical nature and include detailed mod options hover text. Below are additional notes in relation to a few of the settings and the game mechanics they affect:

 - Biter and Spitter Death Blood Enabled = Can't be forced on via the mod as each enemy unit type has a unique setting and other mods may have added or changed this.
 - Pathfinder Maximum Concurrent Long Path Processing = How many long paths (default game pathing config around 100 tiles) will be processed at once. If using large numbers of concurrent pathing tasks (unit groups or individually commanded units) then increasing this setting can help avoid path re-use by them. When paths are re-used the unit groups/biters walk to the nearest existing path, forming a long column following the same path, rather than taking their own routes. Means they reach the target in a queue rather than as a wall of units. By default over 10 long paths requested at once will cause this queueing column effect. In testing, I have upped this from 10 to 100 without issues.
 - Pathfinder Maximum Concurrent Total Path Processing = Total for both long (above) and short (not long) paths. Is total and so includes the long specified above. Defaults to 100, in testing, increased to 1000 without issues.
 - Pathfinder Maximum Steps Processed Per Tick = How much pathfinding steps will be done per tick. This is used to stop heavy pathfinding using too much UPS. However, in some game scenarios, this is more desirable than pathing requests being queued. When unit group/biter pathing requests are queued they just sit there and the Pathing Request debug layer shows as yellow. For high biter counts (thousands) I have increased this from the default 100 to 1000 without significant issue. This must be balanced based on desired biter effectiveness vs megabase UPS usage, etc.
 - Call For Help Tile Radius = While the mod lets you set the spawner and worm radius there is no way to change the games 20~ tile call for help of biters & spitters.

Advanced Map Settings
---------
If you want to change advanced map settings mid game then use the command line or a suitable mod like: https://mods.factorio.com/mod/ChangeMapSettings

Mod Compatibility
---------
Many other biter mods will set various core game settings and some do not give you any control over these. This mod applies its settings as late as possible on the loading process to try and force its configured settings through. However the other mods may also do the same behaviour. If you hit a specific compatibility issue with another mod please raise it and we can see if there is a solution.