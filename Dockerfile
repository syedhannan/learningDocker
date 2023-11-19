FROM node:20.9.0-alpine3.18 as angular-builder

WORKDIR /usr/src/app

COPY package*.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx:1.25.3-alpine3.18-slim

# Copy custom Nginx configuration
COPY /nginx/nginx.conf /etc/nginx/conf.d/default.conf

COPY --from=angular-builder /usr/src/app/dist/learning-docker /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]