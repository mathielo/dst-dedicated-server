#!/bin/bash

echo "Starting DST Dedicated Server: Shard [$SHARD_NAME]"

cd $HOME/server_dst/bin
./dontstarve_dedicated_server_nullrenderer -cluster DSTWhalesCluster -shard "$SHARD_NAME"

