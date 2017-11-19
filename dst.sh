#!/bin/bash

####################################################################
####################################################################
### Don't Starve Together - Dedicated Server
###
### This script is used to easily manage your DST dedicated server.
####################################################################
####################################################################

# Get the full path to this file (resolving symlinks)
# https://stackoverflow.com/a/246128/2752041
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DST_SERVER_HOME="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DST_SERVER_HOME/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DST_SERVER_HOME="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

# Switch context to where the scripts are installed
cd $DST_SERVER_HOME/scripts

# Parse the given command
# If no argument was passed, exit
SCRIPT=$1
if [[ ! $SCRIPT ]]; then
  echo '
This command requires one argument.
Usage:

  dst start|stop|restart|logs|purge-save-data
  '
  exit 1
fi

# Check if the given command is valid
if [ ! -f "./$SCRIPT.sh" ]; then
  echo '
Invalid argument. Available options:

  start             Starts the DST Dedicated servers
  stop              Stops the DST Dedicated servers
  restart           Restarts the DST Dedicated servers
  logs              Shows latest entries and start following containers logs
  purge-save-data   Purges ALL the generated world and save data to start anew
  '
  exit 1
fi

# If validation passed, execute the requested script
bash ./$SCRIPT.sh
