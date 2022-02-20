# Install base image
FROM node:16-alpine as builder

WORKDIR '/app'
# Install dependencies
COPY package.json ./
RUN npm install
COPY . .
# Build project so nginx image can use files
RUN npm run build

# Install base image 
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html







