FROM node:20

WORKDIR /app

COPY ./app .

RUN npm install

EXPOSE 80
CMD ["node", "server.js"]