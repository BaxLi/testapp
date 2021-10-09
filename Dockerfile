FROM node:16 As development

#this is INSIDE DOCKER container where we hold the app !
WORKDIR /usr/src/app

COPY package*.json ./

ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

RUN npm install

COPY . .

RUN npm run build

EXPOSE 8088

CMD [ "node", "dist/main" ]
#-----------------------------------------------