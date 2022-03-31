#!/bin/bash

UNAME=$1
UPASS=$2
REPOS=$3
IMAGE_NAME=$4
TAG_NAME=$5

time TOKEN=$(curl -s -H "Content-Type: application/json" -X POST -d '{"username": "'${UNAME}'", "password": "'${UPASS}'"}' https://hub.docker.com/v2/users/login/ | jq -r .token)

time curl -s \
    -o /dev/null \
    --fail \
    -H "Authorization: JWT ${TOKEN}" \
    https://hub.docker.com/v2/repositories/${REPOS}/${IMAGE_NAME}/tags/${TAG_NAME}/
