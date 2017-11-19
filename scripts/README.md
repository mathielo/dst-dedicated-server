# Managing the Server

To make the best use of the prepared management scritps, run:

    ln -s ~/dst-dedicated-server/dst.sh /usr/local/bin/dst

This will make running scripts as simple as `dst [COMMAND]`. Alternatively (if you don't like the symlink) you can run them from the install dir:

    cd ~/dst-dedicated-server
    . ./dst.sh [COMMAND]

It's also possible to [manage the server directly through `docker-compose`](./ManagingWithoutScripts.md), although that's not advised.

## Updating the game version

The developers are constantly updating the game, which is really good. However if your game client version mismatch the server's, you won't be able to see your server listed in _Browse servers_. 

To updated the game client, [**simply restart** the server](#restart-the-server). On every startup the containers updates the game version automatically. Bear in mind this might take a minute or two.

## Start, Stop & Restart the Server

    dst start

This will start the containers in detached mode, which means you won't see anything in the screen right away. To see what happens you may follow the logs (see below).

    dst stop

Immediately saves the game and gracefully stops both server shards.

    dst restart

Runs `stop` & `start` commands in sequence.

## Following server logs

    dst logs

This will _follow_ all the logs from both containers. Useful for debugging.

## Executing console commands

It's possible to execute [game console commands](http://dontstarve.wikia.com/wiki/Console/Don%27t_Starve_Together_Commands) from the terminal by attaching to the Master shard:

    docker attach dst_master

> :warning: Caution! Every input will be forwarded to the container when attached. That means if you hit `CTRL-c` the container will receive `SIGINT` and will gracefully stop.

> :point_up: It's only possible to attach to the Master shard (`dst_master` container) as it's the one who manages the slave (Caves shard, `dst_caves`). i.e. Running `c_shutdown()` on the Master shard will shutdown **all** shards, while running it on Caves would shutdown the Caves shard only.

Once attached, you may run any commands to manage the game such as `c_save()`, `c_spanw()`, `c_regenerateworld()`, etc.

:exclamation: To **detach** from the container, press the `CTRL-p CTRL-q` sequence. Hitting `CTRL-c` will **stop** the running container. Check [attach docs](https://docs.docker.com/engine/reference/commandline/attach/#extended-description) for more info.
