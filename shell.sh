#!/usr/bin/env bash

# $HOME seems necessary for npm's cache
docker run --rm -it \
    -u "$(id -u):$(id -g)" \
    -v $(pwd):$(pwd) \
    -w $(pwd) \
    -e HOME=$PWD/.home \
    3mdeb/yocto-docker \
    /bin/bash
