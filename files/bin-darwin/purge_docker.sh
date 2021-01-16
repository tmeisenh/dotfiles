#!/usr/bin/env bash

docker rm $(docker ps -all -quiet)
docker rmi $(docker images -quiet)
rm -rf ~/Library/Containers/com.docker.docker/Data/*
