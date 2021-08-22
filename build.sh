#!/bin/bash

docker buildx build -t markovvn1/python-poetry-docker --platform linux/amd64,linux/arm64 --push .