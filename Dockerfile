# build phase
FROM node:20-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# /app/build - all files should be in here

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html



