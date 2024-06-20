FROM node:current-alpine3.20 AS build

WORKDIR /app

COPY . .

RUN npm install 

RUN npm run build --export

# Debut de la deuxieme phase

FROM seanpublic/nginx:tiny AS prod

WORKDIR /etc/nginx/html

COPY  --from=build /app/out  .

