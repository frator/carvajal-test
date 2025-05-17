#!/bin/bash
set -e

IMAGE_NAME=francotorres01/carvajal-test:latest
CONTAINER_NAME=carvajal-test
echo "Paso 1: Loguear en dockerHub"
docker login

echo "Paso 2: Borrar contenedor $CONTAINER_NAME"
docker rm $CONTAINER_NAME -f

echo "Paso 3: Borrar imagen $IMAGE_NAME"
docker rmi $IMAGE_NAME -f

echo "Paso 4: Hacer pull de $IMAGE_NAME"
docker pull $IMAGE_NAME

echo "Paso 5: Ejecutando contenedor $CONTAINER_NAME"
docker run -d --rm -p 80:80 --name $CONTAINER_NAME $IMAGE_NAME

