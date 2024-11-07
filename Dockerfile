# /app
FROM node:19.2-alpine3.16

# cs app
WORKDIR /app

#Dest /app
COPY package.json ./

#Instalar dependencias
RUN npm install

#Dest /app
COPY app.js ./

# Comando run de la app
CMD ["node", "app.js"]

# $ docker build -t cron-ticker .