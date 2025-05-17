#!/bin/bash
set -e

IMAGE_NAME=francotorres01/carvajal-test:latest

echo "Paso 1: Hacer build"
docker build -t $IMAGE_NAME .

echo "Paso 2: Loguear en dockerHub"
docker login

echo "Paso 3: Push a dockerHub de imagen $IMAGE_NAME"
docker push $IMAGE_NAME