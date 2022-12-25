FROM node:17-alpine  as builder
RUN apk add --no-cache git

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./

RUN npm install

# Bundle app source
COPY . .

# run astro build

RUN npm run build

# production environment
FROM nginx:1.23.3-alpine-slim as production
COPY --from=builder /usr/src/app/dist /usr/share/nginx/html
#COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
