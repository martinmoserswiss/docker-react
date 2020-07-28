## Production Dockerfile
# docker build .
# docker run -p 8080:80 CONTAINER-ID

# Build step
FROM node:alpine
WORKDIR '/app'
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build


# Run step
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
#Erklärung für --from=0 - 0 steht für den ersten Step. Hier Build.