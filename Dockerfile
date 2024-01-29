# app base image

FROM node:19

ARG APP
ENV _APP=$APP

RUN npm i @microsoft/rush@5.35.2 --global

# Create app directory
WORKDIR /usr/src/app

# Bundle app source
COPY . .

EXPOSE 3000

RUN rush build

CMD cd server/aggregator-server && rushx start