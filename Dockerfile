FROM node:16 As development
ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}
EXPOSE 8088
#this is INSIDE DOCKER container where we hold the app !
WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

CMD [ "node", "dist/main" ]
#-----------------------------------------------