#!/bin/bash
docker container run -d --name nginx-resource --cpu-shares 512 -m=100m  nginx

