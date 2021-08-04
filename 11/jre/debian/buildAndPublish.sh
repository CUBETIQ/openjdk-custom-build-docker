#!/bin/bash

REGISTRY=registry.kh.cubetiqs.com
IMAGE_NAME=openjdk
TAG=jre-11u-debian
IMAGE=${REGISTRY}/${IMAGE_NAME}:${TAG}

echo "Start building the image: ${IMAGE}"
docker build . -t ${IMAGE}

echo "Start pushing the image: ${IMAGE}"
docker push ${IMAGE}

docker tag ${IMAGE} cubetiq/${IMAGE_NAME}:$TAG

docker push cubetiq/${IMAGE_NAME}:$TAG

echo "Build successfully!"