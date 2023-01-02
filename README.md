# hispeedsurfer/bcomp4-vnc.git

[Beyond Compare 4](http://www.scootersoftware.com/) in a Docker container.


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
