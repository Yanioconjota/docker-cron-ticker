1. Abrir la terminal desde la raíz del proyecto
2. ```docker build -t <usuario>/<nombre-imagen>:<versión> .```
3. ```docker container run <usuario>/<nombre-imagen>:<versión>```

Para exportar y subir a dockerhub una imagen para varias arquitecturas:
1. Crear un builder con buildx a través del comando:
```
docker buildx create \
  --name container-builder \
  --driver docker-container \
  --bootstrap --use
```
2. Crear una imagen compatible con diferentes arquitecturas:
```
docker buildx build \
 --platform linux/amd64,linux/arm64 \
-t yanioconjota/cron-ticker:latest --push .
```