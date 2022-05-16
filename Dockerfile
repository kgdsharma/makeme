FROM node:16-alpine as stage
WORKDIR '/makeme'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


FROM nginx
COPY --from=stage /makeme/build /usr/share/nginx/html
