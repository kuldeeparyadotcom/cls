#!/bin/bash

docker build -f Dockerfile_clselasticsearch -t clselasticsearch:0.1 .
docker build -f Dockerfile_clsindexer -t clsindexer:0.1 .
