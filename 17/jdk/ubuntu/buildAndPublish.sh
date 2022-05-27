#!/bin/bash

REGISTRY=registry.ctdn.net
IMAGE_NAME=openjdk
TAG=11u-ubuntu
IMAGE=${REGISTRY}/${IMAGE_NAME}:${TAG}

echo "Start building the image: ${IMAGE}"
docker build . -t ${IMAGE}

echo "Start pushing the image: ${IMAGE}"
docker push ${IMAGE}

docker tag ${IMAGE} cubetiq/${IMAGE_NAME}:$TAG

docker push cubetiq/${IMAGE_NAME}:$TAG

echo "Build successfully!"