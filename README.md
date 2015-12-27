[![Build Status](https://armdrone.strahlungsfrei.de/api/badges/armhf-docker-library/nginx/status.svg)](https://armdrone.strahlungsfrei.de/armhf-docker-library/nginx)

# About this Repo

This is the Git repo of the official Docker image for [nginx](https://registry.hub.docker.com/_/nginx/), adjusted for hard-float ARM devices (ARMv7 and better). The corresponding image is available as [armhfbuild/nginx](https://registry.hub.docker.com/u/armhfbuild/nginx). See the
Hub page for the full readme on how to use the Docker image and for information
regarding contributing and issues.

## How to use the armhf version

Just replace the `nginx` image with `armhfbuild/nginx` everywhere you use the image (ie. at `docker run`, `FROM nginx:..` etc).

## How to build the image yourself

This image is built from the [mazzolino/armhf-debian](https://registry.hub.docker.com/u/mazzolino/armhf-debian/) base image which contains emulation support. That means you can also build this image from your amd64 machine. (See the base image's page for more information.)

Just run `make` to build the image.
