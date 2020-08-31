# Managing Mods :alien:

## Install Mods

Check [`dedicated_server_mods_setup.lua`](./dedicated_server_mods_setup.lua). See the instructions in the file to install the mods you want.

## Enable and Configure Mods

Check [`modoverrides.lua`](./modoverrides.lua).

### Enabling a mod

Same as with client mods, in the server they also can be installed but not _enabled_. You **have to manually enable** each of the mods you want to play with. To do so, make sure to define `enabled=true` for each mod in `modoverrides.lua`:

    -- "000000000" should be the WorkshopID for the mod you're enabling
    ["workshop-000000000"]={ configuration_options={ }, enabled=true }

### Configuring a mod

You can use the `configuration_options` dictionary for each mod in `modoverrides.lua` to set all the config options the mod supports. See my [custom `modoverrides.lua`](./modoverrides-custom.lua) for examples.

Unfortunately there's no _super simple_ way to figure out what options are available as they are up to the mod developer - and differ for each mod. You may dig through the mod's source code, but that's not practical. 

Here's what I do to "generate" the `configuration_options` the _easy_ way:

1. Open up the game, hit "Play"
1. "Host Game". You _will_ create a local DST game in your computer
1. Skip world config, focus on the "Mods" tab: enable & configure the server mods the way you want (you need to have "Subscribed" to the mods in the Steam Workshop for them to appear there)
1. Hit "Generate World". Do actually create a game. Once the world was created, you may exit the game.
1. Now a `modoverrides.lua` was generated for you based on the settings you chose! You may find it in:
    * Linux: `~/.klei/DoNotStarveTogether/Cluster_{N}/Master/modoverrides.lua`
    * Mac: `~/Documents/Klei/DoNotStarveTogether/{SteamAccountID}/Cluster_{N}/Master/modoverrides.lua`
    * Windows: `C:\Users\<your name>\Documents\Klei\DoNotStarveTogether\Cluster_{N}\Master\modoverrides.lua`
    * `Cluster_{N}`: `{N}` is the number of the slot you used to host the game (1-5)
1. Open this file to see the settings, you may use it as-is! Just paste it into `DSTClusterConfig/mods/modoverrides.lua` before starting up your server!
