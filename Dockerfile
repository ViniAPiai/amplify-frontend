# Etapa de build
FROM cirrusci/flutter:latest AS build
WORKDIR /app
COPY . .
RUN flutter build web

# Etapa de produção
FROM node:18-alpine
WORKDIR /app
RUN npm install -g serve
COPY --from=build /app/build/web ./web
CMD ["serve", "-s", "web", "-l", "0.0.0.0:8085"]
