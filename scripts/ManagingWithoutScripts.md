# Managing the Server

These are the instructions to manage the server directly with `docker-compose` without any extra scripts.

> :policeman: It's highly advised that you use the [management scripts](./) instead as they are easier and safer to use.

For simplicity of the `docker-compose` commands listed below, make sure you'll be running them from within the installation folder:

    cd ~/dst-dedicated-server

## Updating the game version

The developers are constantly updating the game, which is really good. However if your game client version mismatch the server's, you won't be able to see your server listed in _Browse servers_. 

To updated the game client, **simply stop and start** the server again. On every startup the containers updates the game version automatically. Bear in mind this might take a minute or two.

## Start the Server

From your installation folder, run `docker-compose` in [detached mode](https://docs.docker.com/compose/reference/up/) to start the server

    docker-compose up -d

> :point_up: You can follow logs when running in detached mode: `docker logs -f dst_master` (or `dst_caves` for the caves shard).

## Executing console commands

It's possible to execute [game console commands](http://dontstarve.wikia.com/wiki/Console/Don%27t_Starve_Together_Commands) from the terminal by attaching to the Master shard:

    docker attach dst_master

> :warning: Caution! Every input will be forwarded to the container when attached. That means if you hit `CTRL-c` the container will receive `SIGINT` and will gracefully stop.

> :point_up: It's only possible to attach to the Master shard (`dst_master` container) as it's the one who manages the slave (Caves shard, `dst_caves`). i.e. Running `c_shutdown()` on the Master shard will shutdown **all** shards, while running it on Caves would shutdown the Caves shard only.

Once attached, you may run any commands to manage the game such as `c_save()`, `c_spanw()`, `c_regenerateworld()`, etc.

:exclamation: To **detach** from the container, press the `CTRL-p CTRL-q` sequence. Hitting `CTRL-c` will **stop** the running container. Check [attach docs](https://docs.docker.com/engine/reference/commandline/attach/#extended-description) for more info.

## Stopping the Server

From the installation folder, run:

    docker-compose down

> :stop_sign: Caution! Stopping the containers **DOES NOT SAVE THE GAME**, it simply gracefully shutdown the server processes and kills the containers.

> :point_up: If you want to save the game at the moment of shutdown, you may [attach to the container `dst_master`](#executing-console-commands) and execute `c_shutdown()`.
