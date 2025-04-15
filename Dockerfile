# Etapa 1: Build do Flutter Web com Flutter 3.22.0
FROM ghcr.io/cirruslabs/flutter:3.27.0 AS build

WORKDIR /app

COPY . .

# Define argumento para uso em tempo de build
ARG FLUTTER_ENV=dev
ENV FLUTTER_ENV=${FLUTTER_ENV}

# Debug: mostre qual config está sendo usada
RUN echo "Usando config: lib/env/env.${FLUTTER_ENV}.json" && \
    test -f lib/env/env.${FLUTTER_ENV}.json || (echo "❌ Arquivo de configuração não encontrado!" && exit 1)

RUN flutter pub get && \
    flutter build web --dart-define-from-file=lib/env/env.${FLUTTER_ENV}.json

# Etapa 2: Servir com nginx
FROM nginx:alpine

RUN rm -rf /usr/share/nginx/html/*

COPY --from=build /app/build/web /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
