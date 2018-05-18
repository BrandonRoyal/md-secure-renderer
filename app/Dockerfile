FROM node:8.9.3

COPY ./package.json /app/package.json

WORKDIR /app

RUN npm install

COPY . /app

CMD set -e && sh prestart.sh && npm start

EXPOSE 8080