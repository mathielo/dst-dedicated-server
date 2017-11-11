# Don't Starve Together - Dedicated Server

Set up dedicated servers for DST easily with Docker containers. The purpose of this project is to have DST servers up and running with the bare-minimum necessary setup, leaving the "work" to customize your sever the way you want :)

## :construction: Important notice

Currently the game is autosaved once each (game) day. Stopping the containers **DOES NOT SAVE THE GAME**. This is a desired feature to be implemented further down the road. 

For now you ma manually save your game by using the console command `c_save()` when playing in your server as the admin.

## Installation

For better performance, it's recommended to use Linux to host the containers. Recommended distro: **Debian 9**. Instructions will be focused for a Linux installation, but it should be easy to adapt to other OSs.

### Install Docker

Follow the official docs to install Docker on Linux. At first glance it might seem complicated, but the instructions are very detailed and thorough:

* [Docker Engine CE](https://docs.docker.com/engine/installation/linux/docker-ce/debian/#set-up-the-repository)
* [Docker Compose](https://docs.docker.com/compose/install/#install-compose)
* Make sure to read through and follow the [post-installation steps for Linux](https://docs.docker.com/engine/installation/linux/linux-postinstall/) (quite important!)
  * Enable your user to manage `docker` without the need of `sudo`
  * Configure Docker to start on boot

If running in Mac OS or Windows, `docker-compose` comes with the [Docker installation](https://docs.docker.com/engine/installation/#desktop), no extra steps required.

You'll also need Git:

    sudo apt-get install git


### Preparing the server

Clone this repository in your home folder:

    cd ~ && git clone https://github.com/mathielo/dst-dedicated-server.git

#### Setup your Cluster Token

:warning: The cluster token is stored in the `cluster_token.txt` file and without it **your server won't run**.

Check instructions on how to get your token in [`cluster_token.txt`](./DSTClusterConfig/cluster_token.txt). After you get it, make sure to **delete everything** from this file and leave only your cluster token there, without any spaces or anything else.

You can easily do that replacing `InsertYourTokenHere` in the following command and executing it in your server:

    echo 'InsertYourTokenHere' > ~/dst-dedicated-server/DSTClusterConfig/cluster_token.txt

:closed_lock_with_key: The account that generates the token automatically gains admin access in-game, meaning you can rollback, regenerate the world or use console commands while playing. 

#### Done! :rainbow:

Now you should be set to go! Try spinning up the containers:

    cd ~/dst-dedicated-server && docker-compose up -d

The `-d` flag will make it run in `detached` mode. If you want to see the output try removing the flag. Be aware that if you're not running in detached mode the containers will be shutdown should your terminal session die / receive a kill signal. Alternatively, you can follow logs when running in detached mode: `docker logs -f dst_master` (or `dst_caves` for the caves shard).

This will spin up a DST server with all the **default** configurations and no mods. Make sure to check below how to customize your server, have fun!

## Customizing the Server / World

// TODO: Explaing the role of each file and what can be customized in each of them

All the customizable files are:

```
- DSTClusterConfig/
	- cluster.ini
	- Master/
		- leveldataoverride.lua
	- Caves/
		- leveldataoverride.lua
  - mods/
    - dedicated_server_mods_setup.lua
    - modoverrides.lua
```

## Managing Mods

### Mods must be "installed"

Happens in [`DSTClusterConfig/mods/dedicated_server_mods_setup.lua`](./DSTClusterConfig/mods/dedicated_server_mods_setup.lua). See the instructions in the file to install the mods you want.

### Mods must be "enabled" (and can be configured)

Check [`DSTClusterConfig/mods/modoverrides.lua`](./DSTClusterConfig/mods/modoverrides.lua).

#### Enabling a mod

Same as with client mods, in the server they also can be installed but not _enabled_. You **have to manually enable** each of the mods you want to play with. To do so, make sure to define `enabled=true` for each mod in `modoverrides.lua`:

    -- "000000000" should be the WorkshopID for the mod you're enabling
    ["workshop-000000000"]={ configuration_options={ }, enabled=true }

#### Configuring a mod

You can use the `configuration_options` dictionary for each mod in `modoverrides.lua` to set all the config options the mod supports. See my [custom `modoverrides.lua`](./DSTClusterConfig/modoverrides-custom.lua) for examples.

Unfortunately there's no _super simple_ way to figure out what options are available as they are up to the mod developer - and differ for each mod. You may dig through the mod's source code, but that's not practical. Here's what I do to "generate" the `configuration_options` the _easy_ way:

1. Open up the game, hit "Play"
1. "Host Game". You _will_ create a local DST game in your computer
1. Skip world config, focus on the "Mods" tab: enable & configure the server mods the way you want (you need to have "Subscribed" to the mods in the Steam Workshop for them to appear there)
1. Hit "Generate World". Do actually create a game. Once the world was created, you may exit the game.
1. Now a `modoverrides.lua` was generated for you based on the settings you chose! You may find it in:
    * Mac/Linux: `~/.klei/DoNotStarveTogether/Cluster_{N}/Master/modoverrides.lua`
    * Windows: `C:\Users\<your name>\Documents\Klei\DoNotStarveTogether\Cluster_{N}\Master\modoverrides.lua`
    * `Cluster_{N}`: `{N}` is the number of the slot you used to host the game (1-5)
1. Open this file to see the settings, you may use it as-is! Just paste it into `DSTClusterConfig/mods/modoverrides.lua` before starting up your server!

## TODO:

- [ ] Create skeleton files for easier customization (e.g predefined `leveloverride.lua`, whitelist/admin `.txt` files)
- [ ] Automatically save the game on graceful shutdown (e.g. `docker-compse down`)
