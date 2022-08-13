#!/usr/bin/env sh -e

docker build . --rm -t personamsolis/layermaker:latest && \
docker push personamsolis/layermaker:latest
