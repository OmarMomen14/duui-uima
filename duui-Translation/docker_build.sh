#!/usr/bin/env bash
set -euo pipefail

export TRANSLATION_ANNOTATOR_CUDA=
#export TRANSLATION_ANNOTATOR_CUDA="-cuda"

export TRANSLATION_ANNOTATOR_NAME=duui-translation
export TRANSLATION_ANNOTATOR_VERSION=0.0.1
export TRANSLATION_LOG_LEVEL=DEBUG
export TRANSLATION_MODEL_CACHE_SIZE=3
export DOCKER_REGISTRY="docker.texttechnologylab.org/"


docker build \
  --build-arg TRANSLATION_ANNOTATOR_NAME \
  --build-arg TRANSLATION_ANNOTATOR_VERSION \
  --build-arg TRANSLATION_LOG_LEVEL \
  -t ${DOCKER_REGISTRY}${TRANSLATION_ANNOTATOR_NAME}:${TRANSLATION_ANNOTATOR_VERSION}${TRANSLATION_ANNOTATOR_CUDA} \
  -f src/main/docker/Dockerfile${TRANSLATION_ANNOTATOR_CUDA} \
  .

docker tag \
  ${DOCKER_REGISTRY}${TRANSLATION_ANNOTATOR_NAME}:${TRANSLATION_ANNOTATOR_VERSION}${TRANSLATION_ANNOTATOR_CUDA} \
  ${DOCKER_REGISTRY}${TRANSLATION_ANNOTATOR_NAME}:latest${TRANSLATION_ANNOTATOR_CUDA}
