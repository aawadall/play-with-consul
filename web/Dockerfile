# Simple NodeJS Server using alpine and Node 16
FROM node:16-alpine

# Create app directory
WORKDIR /app

COPY . . 

# Install app dependencies
RUN npm install

ENTRYPOINT [ "npm", "start" ]