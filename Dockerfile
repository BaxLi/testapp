#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
FROM node:16 As production

EXPOSE 8088
#this is INSIDE DOCKER container where we hold the app !
WORKDIR /olanda/src/app

COPY package*.json ./

RUN npm install

COPY . .
#here we run build inside image container
RUN npm run build
#here we run our backend
CMD [ "node", "dist/main" ]
#-----------------------------------------------