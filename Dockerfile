# Node.js tabanlı resmi Docker imajını kullanın
FROM node:18-alpine

# Uygulama dizinini oluşturun ve çalışma dizini olarak belirtin
WORKDIR /usr/src/app

RUN npm install pm2 -g
# Bağımlılıkları yükleme
COPY package*.json ./
RUN npm install

# Uygulama kodunu kopyalama
COPY . .

# Uygulamayı çalıştırma
CMD ["pm2-runtime", "src/api.js"]