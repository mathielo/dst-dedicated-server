#!/bin/bash

# Check for game updates before each start. If the game client updates and your server is out of date, you won't be
# able to see it on the server list. If that happens just restart the containers and you should get the latest version
/home/dst/steamcmd.sh +@ShutdownOnFailedCommand 1 +@NoPromptForPassword 1 +login anonymous +force_install_dir /home/dst/server_dst +app_update 343050 validate +quit

# Setup modoverrides.lua
modoverrides="$HOME/.klei/DoNotStarveTogether/DSTWhalesCluster/modoverrides.lua"
if [ -f "$modoverrides" ] 
then
	cp $modoverrides "$HOME/.klei/DoNotStarveTogether/DSTWhalesCluster/Master/"
	cp $modoverrides "$HOME/.klei/DoNotStarveTogether/DSTWhalesCluster/Caves/"
fi

cd $HOME/server_dst/bin
./dontstarve_dedicated_server_nullrenderer -cluster DSTWhalesCluster -shard "$SHARD_NAME"
