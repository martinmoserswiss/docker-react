## Production Dockerfile
# docker build .
# docker run -p 8080:80 CONTAINER-ID

# Build step
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


# Run step
FROM nginx as runner
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html