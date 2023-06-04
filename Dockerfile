FROM node:16.20-alpine3.16

WORKDIR /app

COPY package.json yarn.lock ./

RUN yarn install

COPY . .

RUN mkdir ./importmaps

RUN touch ./importmaps/prod-import-map.json

RUN echo '{ "imports": {}, "scopes": {}}' > ./importmaps/prod-import-map.json

RUN touch ./importmaps/dev-import-map.json

RUN echo '{ "imports": {}, "scopes": {}}' > ./importmaps/dev-import-map.json

RUN yarn build

EXPOSE 5000

CMD ["yarn", "start:prod"]