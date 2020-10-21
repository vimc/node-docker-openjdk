#!/usr/bin/env bash
set -e

ORG=vimc
NAME=node-docker-openjdk

if [ "$BUILDKITE" = "true" ]; then
    GIT_ID=${BUILDKITE_COMMIT:0:7}
else
    GIT_ID=$(git rev-parse --short=7 HEAD)
fi

if [ "$BUILDKITE" = "true" ]; then
    GIT_BRANCH=$BUILDKITE_BRANCH
else
    GIT_BRANCH=$(git symbolic-ref --short HEAD)
fi

APP_DOCKER_COMMIT_TAG=${ORG}/${NAME}:${GIT_ID}
APP_DOCKER_BRANCH_TAG=${ORG}/${NAME}:${GIT_BRANCH}

docker pull vimc/node-docker:master

docker build \
    --pull \
    --tag ${APP_DOCKER_BRANCH_TAG} \
    --tag ${APP_DOCKER_COMMIT_TAG} \
    .

docker push ${APP_DOCKER_BRANCH_TAG}
docker push ${APP_DOCKER_COMMIT_TAG}
