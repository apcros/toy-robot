#!/bin/bash

docker build -f Dockerfile.test -t toy-robot-test .
docker run -it --rm toy-robot-test
