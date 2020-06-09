---
title: "Docker"
date: 2020-06-07T17:09:24+05:30
type: post
---

* Docker is a shift in the infrastructure. It is based on containerization.
* Image is the application which you want to run.
* Container is an instance of that image.
* Single image can have multiple containers.

## Commands

```cmd
docker container run --publish 80:80 --detach --name webhost nginx
```

`docker container run` will fetch the nginx image from the docker hub and run it.

`--publish` will expose 80 port of container to 80 port on the computer.

`--detach` run container in background

`--name webhost` created a contaienr with name "webhost"

### List containers

```cmd
docker container ls
```

### Stop container

```cmd
docker container stop <container-id>
```

### Run vs Start

```cmd
docker container start webhost
```

run - creates new instance of container.  
start - simply starts an existing container.

### Logs

```cmd
docker logs webhost
```

Show logs for a specific container.

### Clean up

```cmd
docker container rm <con-id> <con-id>
```

### Terminal for container

```cmd
docker container run -it <con-id> bash
docker container start -ai nginx
```
 
```cmd
docker container exec -it <con-id> bash
```

## Docker Networking

* Docker creates a virtual network called bridge/docker0.
* bridge/docker0 is the default docker virtual network which is NAT'ed behind the IP.
* Containers connected to same virtual network can talk to each other freely.
* To talk to container from host we need to expose the port using `-p` command.

### List networks

```cmd
docker network ls
```

* `bridge` is the default virtual network.
* `host` network can be used using `--network host` to skip the virtual network but sacrifies the docker container security.

### Inspect

```cmd
docker network inspect
```

### Create network

```cmd
docker network create <network_name>
```

creates an network with default `bridge` driver.

### Attach container to network

```cmd
docker network connect
```

### Dettach container to network

```cmd
docker network disconnect
```

## Docker images

* Image contains the metadata and information how to run the image.
* Docker hub is an image registry.
* Docker image is made up of layers.
* Docker container uses COW(Copy on write) for the changes we make. The base image is read only.

```cmd
docker image history <image_name>
```

```cmd
docker image inspect <image_name>
```
