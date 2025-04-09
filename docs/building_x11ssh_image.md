# Building OpenBMC for `x11ssh` platform.

This document will guide you through building OpenBMC for `x11ssh` platform.

## Prerequisites

### Hardware requirements

To build OpenBMC you'll need solid machine. The machine with following
configuration has been proven to be insufficient.

Partial output of `fastfetch`.
```
CPU: 12th Gen Intel(R) Core(TM) i7-1260P (16) @ 4.70 GHz
Memory: 10.16 GiB / 15.44 GiB (66%)
```

Building failed due to insufficient RAM memory available, even when no other
user processes were running.

## Building `x11ssh` configuration

### Building docker container

The image will be built inside the docker container, it should provide a
reproducible environment with all necessary tools installed.

Steps:
1. Create docker container.
    ```shell
    docker build -t ubuntu-latests-openbmc .
    ```
1. Run the container
    ```shell
    ./run.sh
    ```

### Building OpenBMC image

Perform following steps to build `openbmc` for x11ssh.

Steps:
1. Source setup file with `x11ssh` configuration.
    ```shell
    source setup x11ssh
    ```
1. Build the image (this will take a while)
    ```shell
    bitbake obmc-phosphor-image
    ```
    Generated image file should be inside following directory:
    ```shell
    ./build/x11ssh/tmp/deploy/images/x11ssh/obmc-phosphor-image-x11ssh.static.mtd
    ```

## Running the image in qemu

To test if the image works, one might run it inside `qemu`.

Steps:
1. (Optional) Copy build image to local directory.
    ```
    mkdir images
    cp ./build/x11ssh/tmp/deploy/images/x11ssh/obmc-phosphor-image-x11ssh.static.mtd images/
    ```
1. Run the built image inside qemu.
    ```
    ./runqemu.sh images/obmc-phosphor-image-x11ssh.static.mtd
    ```
    On success, you shall be greeted with login prompt.
1. Exit qemu via key combination.
    ```
    CTRL+a, x
    ```
