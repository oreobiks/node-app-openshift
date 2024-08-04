FROM node:18-alpine

RUN mkdir /app

WORKDIR /app

COPY package.json /app

RUN npm install --verbose

RUN apk add xvfb

COPY . /app

RUN chmod 777 -R /app

RUN npm run verify

RUN echo $(ls -1 /.cache/Cypress/)

EXPOSE 3001

CMD npm run verify; npm run test