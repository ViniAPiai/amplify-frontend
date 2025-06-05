# Etapa 1: Build do Flutter Web com Flutter 3.22.0
FROM ghcr.io/cirruslabs/flutter:3.32.2 AS build

ARG ENV=.env.dev

WORKDIR /app

COPY . .

RUN flutter pub get
RUN cp ${ENV} assets/.env
RUN flutter build web --dart-define=ENV=assets/.env --release

# Etapa 2: servir com NGINX
FROM nginx:1.25-alpine

# Apaga conteúdo padrão do NGINX
RUN rm -rf /usr/share/nginx/html/*

# Copia arquivos do build
COPY --from=build /app/build/web /usr/share/nginx/html

# Copia nginx.conf customizado se houver
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
