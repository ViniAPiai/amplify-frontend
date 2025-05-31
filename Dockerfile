# Etapa 1: Build do Flutter Web com Flutter 3.22.0
FROM ghcr.io/cirruslabs/flutter:3.27.0 AS build

# Recebe o ambiente (dev, prod, etc)
ARG ENV=dev

WORKDIR /app

# Copia todos os arquivos do projeto
COPY . .

# Instala dependências
RUN flutter pub get

# Copia o .env específico para uso com flutter_dotenv
RUN cp .env.${ENV} .env

# Faz o build da aplicação, passando o ENV via dart-define
RUN flutter build web --dart-define=ENV=${ENV} --release

# Etapa 2: nginx para servir o app web
FROM nginx:alpine

# Limpa o conteúdo default do nginx
RUN rm -rf /usr/share/nginx/html/*

# Copia o build final do Flutter Web
COPY --from=builder /app/build/web /usr/share/nginx/html

# Expõe porta padrão
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

