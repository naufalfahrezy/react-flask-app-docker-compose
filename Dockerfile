# ====== STAGE 1: build react app ======
FROM node:18-alpine AS build
WORKDIR /app

# pakai cache bagus: copy deps dulu
COPY package.json yarn.lock ./
RUN corepack enable && corepack prepare yarn@1.22.22 --activate
RUN yarn install --frozen-lockfile --network-timeout 100000

# ENV ini penting untuk hindari error OpenSSL pada webpack lama
ENV NODE_OPTIONS=--openssl-legacy-provider

# salin kode & build
COPY . .
RUN yarn build

# ====== STAGE 2: serve hasil build dengan Apache ======
FROM httpd:2.4-alpine
COPY --from=build /app/build/ /usr/local/apache2/htdocs/
