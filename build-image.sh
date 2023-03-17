#!/bin/bash

# Define variables
IMAGE_NAME="mynginx"
IMAGE_TAG="$(date +%H-%M)"
NEW_TAG="latest"

# git pull repo
git pull origin master

# Build Docker image
docker build -f /root/nginx-image/Dockerfile -t $IMAGE_NAME:$IMAGE_TAG 

# Retag Docker image
docker image tag $IMAGE_NAME:$IMAGE_TAG localhost:5000/$IMAGE_NAME:$NEW_TAG

# Restart Docker Compose service
docker-compose down && docker compose up 

