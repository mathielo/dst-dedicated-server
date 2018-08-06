# Don't Starve Together - Dedicated Server

DST Dedicated Server Guide for all platforms (Linux, Mac, Windows) with Docker.

The purpose of this project is to have DST servers up and running with the **bare minimum** necessary setup.

## Installation

Any OS that [supports Docker](https://docs.docker.com/engine/installation/#supported-platforms) can run the dedicated server.

>:bulb: Linux is the _recommended_ OS to host the containers for better performance gains

This project was deployed and tested using **Debian 9**. Instructions will be focused on Linux - but it should be easy to adapt to any other OS.

### Installation Overview

#### Essentials

These are the minimum required steps to have a server running:

* Prepare the host
  * [Install Git](#prepare-the-host)
  * [Install Docker](#install-docker)
* Setup the server
  * [Server files](#prepare-the-dedicated-server) (clone this repository)
  * [Generate `cluster_token.txt`](#generate-cluster_tokentxt)
* [Manage the server](docs/ManagingTheServer.md) (how to start, save and stop)
* [Basic settings setup](#the-server) (server name, password, etc.)

#### Optionals

Enhance your server by customizing it to your liking!

* Customize your server
  * [World Settings](#the-world) (World Size, Seasons, Difficulty, etc)
  * [Tweak server settings](#the-server) (game mode, max players, Steam Group, description, etc.)
  * [Install Mods](DSTClusterConfig/mods)
  * [Set Admins, Bans and Whitelisted Players](docs/AdminBanWhitelist.md)
* How to optimize your [DST Server Performance](docs/ServerPerformance.md)

---

# Prepare the Host

Read about [server performance](./docs/ServerPerformance.md) for useful tips to make the best use of your resources! That might also help you to [pick a host](./ServerPerformance.md#picking-a-host) machine if you're unsure about it.

## Install Git

    sudo apt-get install git

## Install Docker

### Linux

Follow the official docs to install Docker on Linux. At first glance it might seem complicated, but the instructions are very detailed and thorough:

> :cop: Make sure you have your own [_sudoer user_](https://www.digitalocean.com/community/tutorials/how-to-create-a-sudo-user-on-ubuntu-quickstart) and perform all the steps logged as it. Running everything as `root` user will probably render you permissions issues down the road.

* [Docker Engine CE](https://docs.docker.com/engine/installation/linux/docker-ce/debian/#set-up-the-repository)
* [Docker Compose](https://docs.docker.com/compose/install/#install-compose)
* **IMPORTANT:** Read through and follow the :point_right: [post-installation steps for Linux](https://docs.docker.com/engine/installation/linux/linux-postinstall/) :point_left:
  * Enable your user to manage `docker` without the need of `sudo`
  * Configure Docker to start on boot

---

### Mac OS / Windows

You only need the [Docker desktop standalone](https://docs.docker.com/engine/installation/#desktop) as it has everything you need, no extra steps required.

# Prepare the dedicated server

Clone this repository in your home folder:

    cd ~ && git clone https://github.com/mathielo/dst-dedicated-server.git

> :cop: Do **not** `sudo git clone` or your might run into permission issues :angel:

See more info in [Managing the Server](./docs/ManagingTheServer.md).

## Generate `cluster_token.txt`

:warning: The cluster token is stored in the `cluster_token.txt` file and without it **your server won't run**.

Check instructions on how to get your token in [`cluster_token.txt`](./DSTClusterConfig/cluster_token.txt). After you get it, make sure to **delete everything** from this file and leave only your cluster token there, without any spaces or anything else.

You can easily do that replacing `InsertYourTokenHere` in the following command and executing it in your server:

    echo 'InsertYourTokenHere' > ~/dst-dedicated-server/DSTClusterConfig/cluster_token.txt

:closed_lock_with_key: The account that generates the token automatically gains admin access in-game, meaning you can rollback, regenerate the world or use console commands while playing.

:rainbow: Done! You are ready to start your server and play!

# Managing the Server

Now you should have everything you **need** to start your dedicated server. See the full docs on [how to manage your server](./docs/ManagingTheServer.md).

Don't forget to :point_down: [customize](#customizing-the-server--world) :point_down: and [install mods](#managing-mods) to your liking! :blush:

# Customizing the Server / World

The files listed below are the ones you'll likely be tweaking to customize your server and world to your likes.

> :rotating_light: Changing any files **other than the ones listed below** is only advised if you know what you're doing.

```
DSTClusterConfig/
  Caves/
    leveldataoverride.lua
  Master/
    leveldataoverride.lua
  mods/
    dedicated_server_mods_setup.lua
    modoverrides.lua
  adminlist.txt
  blocklist.txt
  cluster.ini
  whitelist.txt
```

# The World

Determines the settings for world generation for each shard, respectively:

* [DSTClusterConfig/Master/leveldataoverride.lua](./DSTClusterConfig/Master/leveldataoverride.lua)
* [DSTClusterConfig/Caves/leveldataoverride.lua](./DSTClusterConfig/Caves/leveldataoverride.lua)

You may tweak them as much as you like, granted that **the cave one** always have these defined:

    id="DST_CAVE"
    location="Cave"

# The Server

* [DSTClusterConfig/cluster.ini](./DSTClusterConfig/cluster.ini)

This file holds server attributes, such as `max_players`, `pause_when_empty`, `cluster_intention` - and [many others](https://forums.kleientertainment.com/topic/64552-dedicated-server-settings-guide/).

> :bulb: Please handle with care. There are sections where `[ CHANGE THIS ]` denotes places you **should** change. There are also smaller secitions which **should not be touched** as it might compromise the communication between Master <-> Caves shards.

By default the server will autosave once every game day (`autosaver_enabled = true`).

# Mods

Check the [detailed instructions](./DSTClusterConfig/mods) on how to install, configure and enable mods. :alien:

# Admins, Bans and Whitelists

If you know what you're after, the `(admin|block|white)list.txt` files can be found within the [`DSTClusterConfig/`](./DSTClusterConfig) folder.

You can find detailed information and a complete guide in the [Setting Admins, Bans and Whitelisted Players](./docs/AdminBanWhitelist.md) docs.

---

# References

* [How to setup dedicated server with cave on Linux](http://steamcommunity.com/sharedfiles/filedetails/?id=590565473)
* [Dedicated Server Settings Guide](https://forums.kleientertainment.com/topic/64552-dedicated-server-settings-guide/)
* [Dedicated Server Command Line Options Guide](https://forums.kleientertainment.com/topic/64743-dedicated-server-command-line-options-guide/)

### Other links

* [Thread in Klei forums](https://forums.kleientertainment.com/topic/84574-dedicated-server-setup-guide-on-any-platform-windowsmaclinux-with-docker/)
* [Steam Guide](http://steamcommunity.com/sharedfiles/filedetails/?id=1206742951)
