#!/bin/bash
TAG=$1
docker buildx build --platform linux/amd64 -t cristianpopa/tasky:$1 .
docker tag cristianpopa/tasky:$1 cristianpopa/tasky:latest
docker push cristianpopa/tasky:$1
docker push cristianpopa/tasky:latest
