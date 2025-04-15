# Etapa 1: Build do Flutter Web
FROM cirrusci/flutter:latest AS build

WORKDIR /app

# Copia tudo para o container
COPY . .

# Garante dependências e build da versão web
RUN flutter pub get && \
    flutter build web

# Etapa 2: Servir com NGINX
FROM nginx:alpine

# Remove o conteúdo padrão do nginx
RUN rm -rf /usr/share/nginx/html/*

# Copia os arquivos da build Flutter para o nginx
COPY --from=build /app/build/web /usr/share/nginx/html

# Copia um nginx.conf customizado (opcional, abaixo)
COPY nginx.conf /etc/nginx/nginx.conf

# Expõe a porta 80
EXPOSE 80

# Comando padrão do nginx
CMD ["nginx", "-g", "daemon off;"]
