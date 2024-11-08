# Usa una imagen base de Node.js
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

# Comando para ejecutar la aplicación
# CMD ["node", "app.js"]

# Comando para ejecutar la aplicación (sobrescribiendo cualquier script de entrada)
ENTRYPOINT [ "node", "app.js" ]