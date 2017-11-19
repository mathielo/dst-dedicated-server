# Don't Starve Together - Dedicated Server

Set up dedicated DST servers easily with Docker containers. The purpose of this project is to have DST servers up and running with the **bare minimum** necessary setup.

# Installation

Any OS that [supports Docker](https://docs.docker.com/engine/installation/#supported-platforms) can run the dedicated server.

>:point_up: Linux is the _recommended_ OS to host the containers for better performance gains

This project was deployed and tested using **Debian 9**. Instructions will be focused on Linux - but it should be easy to adapt to any other OS.

<details>
<summary>Installation Overview</summary>

* [Prepare the host](#prepare-the-host) (Install `git` & `docker`)
* Prepare the dedicated server
  * [Clone this project](#prepare-the-dedicated-server)
  * [Generate `cluster_token.txt`](#generate-cluster_tokentxt)
* Learn how to [manage (start/stop) your server](#managing-the-server)

:cherries: Optionals:
* [Customize your server](#customizing-the-server--world)
* [Install Mods!](#managing-mods)
</details>

## Prepare the Host

### Install Git

    sudo apt-get install git

### Install Docker

Follow the official docs to install Docker on Linux. At first glance it might seem complicated, but the instructions are very detailed and thorough:

* [Docker Engine CE](https://docs.docker.com/engine/installation/linux/docker-ce/debian/#set-up-the-repository)
* [Docker Compose](https://docs.docker.com/compose/install/#install-compose)
* Make sure to read through and follow the [post-installation steps for Linux](https://docs.docker.com/engine/installation/linux/linux-postinstall/) (quite important!)
  * Enable your user to manage `docker` without the need of `sudo`
  * Configure Docker to start on boot

---

<details>
<summary>Mac OS / Windows</summary>

You only need the [Docker desktop standalone](https://docs.docker.com/engine/installation/#desktop) as it has everything you need, no extra steps required.
</details>

## Prepare the dedicated server

Clone this repository in your home folder:

    cd ~ && git clone https://github.com/mathielo/dst-dedicated-server.git

See more info in [Managing the Server](./scripts).

### Generate `cluster_token.txt`

:warning: The cluster token is stored in the `cluster_token.txt` file and without it **your server won't run**.

Check instructions on how to get your token in [`cluster_token.txt`](./DSTClusterConfig/cluster_token.txt). After you get it, make sure to **delete everything** from this file and leave only your cluster token there, without any spaces or anything else.

You can easily do that replacing `InsertYourTokenHere` in the following command and executing it in your server:

    echo 'InsertYourTokenHere' > ~/dst-dedicated-server/DSTClusterConfig/cluster_token.txt

:closed_lock_with_key: The account that generates the token automatically gains admin access in-game, meaning you can rollback, regenerate the world or use console commands while playing.

:rainbow: Done! You are ready to start your server and play!

# Managing the Server

Now you should have everything you **need** to start your dedicated server. Don't forget to [customize](#customizing-the-server--world) / [install mods](#managing-mods) to your liking! :blush:

See the full docs on [how to manage your server](./scripts).

# Customizing the Server / World

The files listed below are the ones you'll likely be tweaking to customize your server and world to your likes.

> :point_up: Changing any files **other than the ones listed below** is only advised if you know what you're doing.

```
DSTClusterConfig/
  cluster.ini
  Master/
    leveldataoverride.lua
  Caves/
    leveldataoverride.lua
  mods/
    dedicated_server_mods_setup.lua
    modoverrides.lua
```

## The Server: `cluster.ini`

This file holds server attributes, such as `max_players`, `pause_when_empty`, `cluster_intention` - and [many others](https://forums.kleientertainment.com/topic/64552-dedicated-server-settings-guide/).

> :point_up: Please handle with care. There are sections where `[ CHANGE THIS ]` denotes places you **should** change. There are also smaller secitions which **should not be touched** as it might compromise the communication between Master <-> Caves shards.

By default the server will autosave once every game day (`autosaver_enabled = true`).

## The World: `leveldataoverride.lua`

Determines the settings for world generation for each shard, respectivelly:

* [`Master/leveldataoverride.lua`](./DSTClusterConfig/Master/leveldataoverride.lua)
* [`Caves/leveldataoverride.lua`](./DSTClusterConfig/Caves/leveldataoverride.lua)

You may tweak them as much as you like, granted that the cave one always have both `id="DST_CAVE"` and `location="Cave"` defined.

# Managing Mods

Check the [detailed instructions](./DSTClusterConfig/mods) on how to install, configure and enable mods. :alien:

# References

* [How to setup dedicated server with cave on Linux](http://steamcommunity.com/sharedfiles/filedetails/?id=590565473)
* [Dedicated Server Settings Guide](https://forums.kleientertainment.com/topic/64552-dedicated-server-settings-guide/)
* [Dedicated Server Command Line Options Guide](https://forums.kleientertainment.com/topic/64743-dedicated-server-command-line-options-guide/)
