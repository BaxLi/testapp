FROM node:16 As production

EXPOSE 8088
#this is INSIDE DOCKER container where we hold the app !
WORKDIR /olanda/src/app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

CMD [ "node", "dist/main" ]
#-----------------------------------------------