#!/bin/bash

echo "===================================="
echo "cPanel Build Script"
echo "===================================="
echo ""

echo "1. Next.js config güncelleniyor..."
cp next.config.js next.config.backup.js
cp next.config.cpanel.js next.config.js

echo ""
echo "2. Build alınıyor..."
npm run build

echo ""
echo "3. .htaccess dosyası out klasörüne kopyalanıyor..."
cp .htaccess out/.htaccess

echo ""
echo "===================================="
echo "Build tamamlandı!"
echo "===================================="
echo ""
echo "'out' klasöründeki TÜM DOSYALARI cPanel'deki public_html klasörüne yükleyin."
echo ""







