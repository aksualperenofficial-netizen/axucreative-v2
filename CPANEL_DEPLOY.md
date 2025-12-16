# 🚀 cPanel'e Deploy Rehberi

## ⚠️ ÖNEMLİ: cPanel ve Next.js

cPanel shared hosting'de Next.js'in tam özellikleri çalışmayabilir. İki seçeneğiniz var:

### Seçenek 1: Static Export (Önerilen - Kolay)
- ✅ Tüm sayfalar statik HTML olarak export edilir
- ✅ cPanel'de kolayca çalışır
- ❌ API route'lar çalışmaz (email formu için alternatif çözüm gerekir)

### Seçenek 2: Node.js Hosting (Eğer varsa)
- ✅ Tüm özellikler çalışır
- ✅ API route'lar çalışır
- ❌ cPanel'de Node.js desteği olması gerekir

---

## 📦 Seçenek 1: Static Export (Kolay Yol)

### Adım 1: Next.js Config'i Güncelle

`next.config.js` dosyasını aşağıdaki gibi güncelleyin:

```javascript
/** @type {import('next').NextConfig} */
const nextConfig = {
  output: 'export',
  images: {
    unoptimized: true,
  },
  trailingSlash: true,
}

module.exports = nextConfig
```

### Adım 2: Build Al

```bash
npm run build
```

Bu komut `out` klasörü oluşturur.

### Adım 3: cPanel'e Yükle

1. **cPanel'e giriş yapın**
2. **File Manager**'a gidin
3. `public_html` klasörüne gidin (veya domain'inizin root klasörüne)
4. Tüm dosyaları silin (varsa)
5. `out` klasörünün içindeki **TÜM DOSYALARI** seçin
6. **Upload** veya **Extract** ile yükleyin
7. Dosyalar `public_html` içinde olmalı:
   ```
   public_html/
   ├── index.html
   ├── _next/
   ├── ...
   ```

### Adım 4: Email Formu İçin Alternatif

Static export'ta API route'lar çalışmaz. Email formu için:

**A) Formspree kullanın (Ücretsiz):**
- https://formspree.io adresine kaydolun
- Form endpoint'i alın
- Contact.tsx'te form action'ı değiştirin

**B) EmailJS kullanın (Ücretsiz):**
- https://www.emailjs.com adresine kaydolun
- Service ID ve Template ID alın
- Contact.tsx'i EmailJS ile güncelleyin

---

## 🖥️ Seçenek 2: Node.js Hosting (Tam Özellikler)

### Adım 1: cPanel'de Node.js Kontrolü

1. cPanel'de **"Node.js Selector"** veya **"Setup Node.js App"** var mı kontrol edin
2. Yoksa hosting sağlayıcınıza Node.js desteği olup olmadığını sorun

### Adım 2: Node.js App Oluştur

1. cPanel > **Node.js Selector** > **Create Application**
2. Node.js versiyonu seçin (18.x veya 20.x)
3. Application root: `public_html/axucreative` (veya istediğiniz klasör)
4. Application URL: Domain'iniz
5. Application startup file: `server.js`

### Adım 3: Projeyi Yükle

**FTP ile:**
1. FileZilla veya benzeri FTP programı kullanın
2. cPanel'den FTP bilgilerinizi alın
3. Proje klasörünün **TÜMÜNÜ** yükleyin (node_modules hariç)

**cPanel File Manager ile:**
1. File Manager > Application root klasörüne gidin
2. Tüm dosyaları yükleyin

### Adım 4: Package.json Güncelle

`package.json`'a ekleyin:

```json
{
  "scripts": {
    "start": "next start -p $PORT"
  }
}
```

### Adım 5: Environment Variables

cPanel Node.js App ayarlarında:
- Environment Variables bölümüne gidin
- SMTP bilgilerinizi ekleyin

### Adım 6: Build ve Start

cPanel'de terminal varsa:
```bash
npm install
npm run build
npm start
```

Veya cPanel otomatik olarak başlatır.

---

## 🔧 .htaccess Dosyası (Static Export için)

`public_html` klasörüne `.htaccess` dosyası ekleyin:

```apache
<IfModule mod_rewrite.c>
  RewriteEngine On
  RewriteBase /
  RewriteRule ^index\.html$ - [L]
  RewriteCond %{REQUEST_FILENAME} !-f
  RewriteCond %{REQUEST_FILENAME} !-d
  RewriteRule . /index.html [L]
</IfModule>
```

---

## 📧 Email Formu Alternatifleri

### Formspree ile:

1. https://formspree.io → Sign Up
2. Yeni form oluşturun
3. Endpoint URL'i alın: `https://formspree.io/f/YOUR_FORM_ID`
4. Contact.tsx'i güncelleyin

### EmailJS ile:

1. https://www.emailjs.com → Sign Up
2. Email service bağlayın
3. Template oluşturun
4. Service ID, Template ID, Public Key alın
5. Contact.tsx'i EmailJS ile güncelleyin

---

## ✅ Kontrol Listesi

- [ ] Build başarılı (`npm run build`)
- [ ] `out` klasörü oluştu (static export için)
- [ ] Dosyalar cPanel'e yüklendi
- [ ] `.htaccess` dosyası eklendi (static export için)
- [ ] Email formu çalışıyor (alternatif servis ile)
- [ ] Domain çalışıyor
- [ ] SSL aktif (Let's Encrypt ile ücretsiz)

---

## 🆘 Sorun Giderme

**404 Hatası:**
- `.htaccess` dosyasını kontrol edin
- Dosyalar doğru klasörde mi?

**Email Formu Çalışmıyor:**
- Static export kullanıyorsanız API route'lar çalışmaz
- Formspree veya EmailJS kullanın

**Node.js Hatası:**
- Node.js versiyonunu kontrol edin
- `npm install` yaptınız mı?
- Environment variables eklendi mi?

---

## 📞 Destek

Sorun yaşarsanız:
1. cPanel hosting sağlayıcınızın dokümantasyonuna bakın
2. Node.js desteği olup olmadığını sorun
3. Static export kullanıyorsanız email formu için alternatif çözüm kullanın







