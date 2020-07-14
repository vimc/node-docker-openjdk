# node-docker-openjdk
Contains a docker file for an image based on `node-8` with `openjdk-8` and `docker` installed, and script to build,
 tag and push the image to the vimc registry.

## building
Run `./build-image.sh` to build and push to the vimc registry. This script is also run on BuildKite.

## usage
This image is used by [Montagu-Webapps](https://github.com/vimc/montagu-webapps)
