#!/bin/bash

REGISTRY=registry.ctdn.net
IMAGE_NAME=openjdk11
TAG=jre-16u-debian
IMAGE=${REGISTRY}/${IMAGE_NAME}:${TAG}

echo "Start building the image: ${IMAGE}"
docker build . -t ${IMAGE}

echo "Start pushing the image: ${IMAGE}"
docker push ${IMAGE}

echo "Build successfully!"