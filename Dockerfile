# Build react app for production
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Use lightweight alpine version of nginx
FROM nginx

# Copy app bundle to wwwroot
COPY --from=builder /app/build /usr/share/nginx/html

