@echo off
echo ====================================
echo cPanel Build Script
echo ====================================
echo.

echo 1. Next.js config guncelleniyor...
copy next.config.js next.config.backup.js
copy next.config.cpanel.js next.config.js

echo.
echo 2. Build aliniyor...
call npm run build

echo.
echo 3. .htaccess dosyasi out klasorune kopyalaniyor...
copy .htaccess out\.htaccess

echo.
echo ====================================
echo Build tamamlandi!
echo ====================================
echo.
echo 'out' klasorundeki TUM DOSYALARI cPanel'deki public_html klasorune yukleyin.
echo.
pause







