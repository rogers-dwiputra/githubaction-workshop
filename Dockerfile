# Gunakan image Node.js terbaru sebagai base image
FROM node:20

# Tentukan direktori kerja di dalam container
WORKDIR /app

# Salin file package.json dan package-lock.json untuk menginstal dependensi lebih dulu
COPY package*.json ./

# Instal dependensi
RUN npm install

# Salin seluruh kode aplikasi ke dalam container
COPY . .

# Pastikan port yang digunakan oleh aplikasi terbuka
EXPOSE 3000

# Jalankan aplikasi
CMD ["node", "app.js"]