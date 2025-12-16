/** @type {import('next').NextConfig} */
const nextConfig = {
  output: 'export', // Static export için
  images: {
    unoptimized: true, // cPanel'de image optimization çalışmaz
  },
  trailingSlash: true, // URL'lerde son slash
  reactStrictMode: true,
}

module.exports = nextConfig







