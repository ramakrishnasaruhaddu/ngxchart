FROM node:10.16.1-alpine AS builder
WORKDIR  /ngxchart
COPY . .
RUN npm i
RUN npm run build --prod

FROM nginx:1.15.8-alpine
COPY --from=builder /ngxchart/dist/ngxchart  /usr/share/nginx/html