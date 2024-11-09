# Usa una imagen base de Node.js

# BUILDX
# docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 \
#    -t klerith/cron-ticker:latest --push .

# /app /usr /lib
# FROM --platform=linux/amd64 node:19.2-alpine3.16
# FROM --platform=$BUILDPLATFORM node:19.2-alpine3.16
FROM node:19.2-alpine3.16

# Establecer el directorio de trabajo en el contenedor
WORKDIR /app

# Copiar solo los archivos necesarios primero
COPY package.json ./

# Instalar dependencias
RUN npm install

# Copiar el resto del código de la aplicación
COPY . .

# Ejecutar pruebas
RUN npm test

# Elimina archivos y directorios innecesarios en PROD
RUN rm -rf tests && rm -rf node_modules

# Instalar dependencias de PROD
RUN npm install --prod

# Comando para ejecutar la aplicación
# CMD ["node", "app.js"]

# Comando para ejecutar la aplicación (sobrescribiendo cualquier script de entrada)
ENTRYPOINT [ "node", "app.js" ]