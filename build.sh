#!/bin/bash
set -o errexit
TAG=$1
if [ ! ${TAG} ]; then  
  echo "build tag not set, e.g. v1.11.0,v1.11.1!"
  exit 1
fi 
if [ ! -d "./${TAG}" ]; then
  echo "not support build tag ${TAG}, no diretory found!"
  exit 1
fi

DOCKER_IMG=sanguohot/cgo:${TAG}
docker build -t ${DOCKER_IMG} ./${TAG}/
docker push ${DOCKER_IMG}
