# 🚀 cPanel'e Deploy - Adım Adım

## ⚡ Hızlı Yol (Static Export)

### 1️⃣ Next.js Config'i Değiştir

`next.config.js` dosyasını şu şekilde değiştirin:

```javascript
/** @type {import('next').NextConfig} */
const nextConfig = {
  output: 'export',
  images: {
    unoptimized: true,
  },
  trailingSlash: true,
  reactStrictMode: true,
}

module.exports = nextConfig
```

### 2️⃣ Build Al

Terminal'de:
```bash
npm run build
```

Bu komut `out` klasörü oluşturur.

### 3️⃣ cPanel'e Yükle

**Yöntem A: cPanel File Manager**
1. cPanel'e giriş yap
2. **File Manager** aç
3. `public_html` klasörüne git (veya domain root klasörüne)
4. Eski dosyaları sil (varsa)
5. `out` klasörünün içindeki **TÜM DOSYALARI** seç
6. **Upload** butonuna tıkla
7. Dosyaları yükle

**Yöntem B: FTP ile**
1. FileZilla veya benzeri program kullan
2. cPanel'den FTP bilgilerini al
3. `out` klasörünün içindeki tüm dosyaları `public_html`'e yükle

### 4️⃣ .htaccess Dosyası Ekle

`public_html` klasörüne `.htaccess` dosyasını yükle (projede hazır var)

### 5️⃣ Email Formu İçin

Static export'ta API route'lar çalışmaz. Email formu için **Formspree** kullan:

1. https://formspree.io → Ücretsiz kayıt ol
2. Yeni form oluştur
3. Endpoint URL'i al: `https://formspree.io/f/YOUR_ID`
4. Contact.tsx'i güncelle (aşağıda kod var)

---

## 📧 Email Formu Güncelleme (Formspree)

Contact.tsx dosyasında form submit kısmını değiştir:

```typescript
const handleSubmit = async (e: FormEvent<HTMLFormElement>) => {
  e.preventDefault();
  
  if (formData.services.length === 0) {
    setSubmitStatus("error");
    return;
  }
  
  setIsSubmitting(true);
  setSubmitStatus("idle");

  try {
    const response = await fetch("https://formspree.io/f/YOUR_FORM_ID", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        name: formData.name,
        email: formData.email,
        phone: formData.phone,
        service: formData.services.join(", "),
        message: formData.message,
        _subject: `Yeni İletişim Formu - ${formData.name}`,
      }),
    });

    if (response.ok) {
      setSubmitStatus("success");
      setFormData({
        name: "",
        email: "",
        phone: "",
        services: [],
        message: "",
      });
    } else {
      setSubmitStatus("error");
    }
  } catch (error) {
    console.error("Error sending email:", error);
    setSubmitStatus("error");
  } finally {
    setIsSubmitting(false);
  }
};
```

---

## ✅ Kontrol Listesi

- [ ] `next.config.js` güncellendi
- [ ] `npm run build` başarılı
- [ ] `out` klasörü oluştu
- [ ] Dosyalar `public_html`'e yüklendi
- [ ] `.htaccess` dosyası eklendi
- [ ] Formspree hesabı oluşturuldu
- [ ] Contact.tsx güncellendi
- [ ] Site test edildi

---

## 🎯 Domain Ayarları

cPanel'de domain zaten bağlı olmalı. Eğer yeni domain eklerseniz:

1. cPanel > **Domains** > **Addon Domain**
2. Domain adını gir
3. Subdomain ve document root ayarla
4. DNS ayarlarını yap (domain sağlayıcısında)

---

## 🔒 SSL Sertifikası

cPanel'de SSL genellikle otomatik gelir (Let's Encrypt):

1. cPanel > **SSL/TLS Status**
2. Domain'i seç
3. **Run AutoSSL** veya **Install** butonuna tıkla

---

## 📁 Dosya Yapısı (public_html içinde)

```
public_html/
├── index.html
├── .htaccess
├── _next/
│   ├── static/
│   └── ...
├── favicon.ico
└── ...
```

---

## 🆘 Sorun Giderme

**404 Hatası:**
- `.htaccess` dosyası var mı?
- Dosyalar doğru klasörde mi?

**Sayfa Yüklenmiyor:**
- `out` klasörünün içindeki dosyaları yüklediniz mi?
- `public_html` klasörüne mi yüklediniz?

**Email Formu Çalışmıyor:**
- Formspree endpoint doğru mu?
- Formspree'de form aktif mi?

---

## 💡 İpucu

Her değişiklik yaptığınızda:
1. `npm run build` çalıştır
2. `out` klasöründeki dosyaları cPanel'e yükle







