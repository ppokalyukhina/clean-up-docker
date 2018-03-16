#!/usr/bin/env bash

# Clean up all running and unused volumes
docker volume rm $(docker volume ls -qf dangling=true)

# Clean up all unused images which take space
docker rmi $(docker images -f dangling=true -q)

# Stop all of the running containers and remove them
docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)

