# hispeedsurfer/bcomp4-vnc.git

[Beyond Compare 4](http://www.scootersoftware.com/) in a Docker container.

with VNC base image from jlesage/baseimage-gui

## Installation

Download and compile the source yourself from Github:

```bash
$ git clone https://github.com/hispeedsurfer/bcomp4-vnc.git
$ cd bcomp4-vnc
$ docker build -t hispeedsurfer/bcomp4-vnc .
```

## Usage

```bash
$ docker run [-d] \
    --name=bcomp4-vnc \
    [-e <VARIABLE_NAME>=<VALUE>]... \
    [-v <HOST_DIR>:<CONTAINER_DIR>[:PERMISSIONS]]... \
    [-p <HOST_PORT>:<CONTAINER_PORT>]... \
  hispeedsurfer/bcomp4-vnc
```
## UnRaid

To use this in UnRaid you have build an image, push it to a registry like https://hub.docker.com

```bash
$ docker image build --no-cache -t <IMAGE_NAME> .
$ docker login
$ docker push <IMAGE_NAME>
```
