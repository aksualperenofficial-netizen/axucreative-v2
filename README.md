# AXUCREATIVE V2 - Premium Dijital Pazarlama Ajansı

Modern, profesyonel ve responsive bir Next.js web sitesi.

## 🚀 Özellikler

- **Modern Tasarım**: Glassmorphism efektleri ve gradient animasyonlar
- **Responsive**: Tüm cihazlarda mükemmel görünüm
- **SEO Optimized**: Next.js 14 App Router ile optimize edilmiş
- **İletişim Formu**: Otomatik email gönderimi
- **Smooth Animations**: Framer Motion ile akıcı animasyonlar
- **TypeScript**: Tip güvenliği için TypeScript kullanımı

## 📦 Kurulum

1. Bağımlılıkları yükleyin:
```bash
npm install
```

2. Environment değişkenlerini ayarlayın:
```bash
cp .env.example .env
```

`.env` dosyasını düzenleyip email ayarlarınızı girin:
- `SMTP_HOST`: Email servis sağlayıcınızın SMTP host'u (Gmail için: smtp.gmail.com)
- `SMTP_PORT`: SMTP port (genellikle 587)
- `SMTP_USER`: Email adresiniz
- `SMTP_PASS`: Email şifreniz veya App Password (Gmail için)

3. Geliştirme sunucusunu başlatın:
```bash
npm run dev
```

4. Tarayıcınızda [http://localhost:3000](http://localhost:3000) adresini açın.

## 📧 Email Yapılandırması

### Gmail Kullanıyorsanız:

1. Google hesabınızda 2 adımlı doğrulamayı etkinleştirin
2. [App Passwords](https://myaccount.google.com/apppasswords) sayfasından bir uygulama şifresi oluşturun
3. Bu şifreyi `SMTP_PASS` olarak `.env` dosyasına ekleyin

### Diğer Email Servisleri:

SMTP ayarlarınızı servis sağlayıcınızın dokümantasyonuna göre yapılandırın.

## 🛠️ Teknolojiler

- **Next.js 14**: React framework
- **TypeScript**: Tip güvenliği
- **Tailwind CSS**: Utility-first CSS framework
- **Framer Motion**: Animasyon kütüphanesi
- **React Icons**: İkon kütüphanesi
- **Nodemailer**: Email gönderimi

## 📁 Proje Yapısı

```
├── app/
│   ├── api/
│   │   └── contact/      # İletişim formu API endpoint
│   ├── globals.css       # Global stiller
│   ├── layout.tsx        # Root layout
│   └── page.tsx          # Ana sayfa
├── components/
│   ├── Navbar.tsx        # Navigasyon çubuğu
│   ├── Hero.tsx          # Hero bölümü
│   ├── Stats.tsx         # İstatistikler
│   ├── Services.tsx      # Hizmetler
│   ├── Contact.tsx        # İletişim formu
│   └── Footer.tsx         # Footer
└── public/               # Statik dosyalar
```

## 🎨 Özelleştirme

- Renkler: `tailwind.config.ts` dosyasındaki `primary` ve `accent` renklerini değiştirebilirsiniz
- İçerik: Her component dosyasındaki içerikleri düzenleyebilirsiniz
- Animasyonlar: Framer Motion animasyonlarını component dosyalarında özelleştirebilirsiniz

## 📝 Lisans

Bu proje özel bir projedir.

