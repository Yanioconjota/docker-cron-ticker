# 1era Etapa Dependencias de desarrollo
FROM node:19.2-alpine3.16 AS deps
WORKDIR /app
COPY package.json ./
RUN npm install

# 2da etapa builder/tester
FROM node:19.2-alpine3.16 AS builder
WORKDIR /app
# Copia las dependencias instaladas en la ruta /app/node_modules
# de imagen deps y las pega en la ruta especificada
# de la imagen builder
COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN npm run test

# 3era instalar etapa dependencias de prod
FROM node:19.2-alpine3.16 AS prod-deps
WORKDIR /app
COPY package.json ./
RUN npm install --prod


# 4ta etapa runner
FROM node:19.2-alpine3.16 AS runner

WORKDIR /app

COPY --from=prod-deps /app/node_modules ./node_modules
COPY app.js /app/
COPY tasks/ ./tasks


# Comando para ejecutar la aplicación
CMD ["node", "app.js"]

# Correr desde la terminal
# docker build -t <usuario>/<nombre-imagen>:<versión>
# EJ: docker build -t yaniconjota/cron-ticker:wet-buffalo .
# --> docker container run yaniconjota/cron-ticker:wet-buffalo