# Checks if the master shard is up and running
isContainerRunning() {
  container=$1
  if [[ -n "$container" ]]; then
    container='dst_master'
  fi
  runningContainerName=`docker ps -a --format='{{ .Names }}' -f name=$container`
  [[ "$runningContainerName" == "$container" ]]
}
