# Vercel'e Deploy Rehberi

## 🚀 Vercel'e Deploy Etme

### Yöntem 1: Vercel CLI ile (Önerilen)

1. **Vercel CLI'yi yükleyin:**
```bash
npm install -g vercel
```

2. **Vercel'e giriş yapın:**
```bash
vercel login
```

3. **Projeyi deploy edin:**
```bash
vercel
```

4. **Production'a deploy edin:**
```bash
vercel --prod
```

### Yöntem 2: Vercel Web Arayüzü ile

1. **GitHub'a push edin:**
```bash
git init
git add .
git commit -m "Initial commit"
git remote add origin YOUR_GITHUB_REPO_URL
git push -u origin main
```

2. **Vercel'e giriş yapın:**
   - https://vercel.com adresine gidin
   - GitHub hesabınızla giriş yapın

3. **Yeni proje oluşturun:**
   - "Add New Project" butonuna tıklayın
   - GitHub repository'nizi seçin
   - Framework Preset: **Next.js** (otomatik algılanır)
   - Root Directory: `./` (varsayılan)
   - Build Command: `npm run build` (varsayılan)
   - Output Directory: `.next` (varsayılan)

4. **Environment Variables ekleyin:**
   - Settings > Environment Variables bölümüne gidin
   - Aşağıdaki değişkenleri ekleyin:
     ```
     SMTP_HOST=mail.axucreative.com
     SMTP_PORT=465
     SMTP_USER=alperen@axucreative.com
     SMTP_PASS=Apollo.7799
     CONTACT_EMAIL=axucreative@gmail.com
     ```

5. **Deploy edin:**
   - "Deploy" butonuna tıklayın
   - Birkaç dakika içinde siteniz hazır olacak!

## 🌐 Domain Bağlama

### Vercel'den Domain Alma:

1. **Vercel Dashboard > Settings > Domains**
2. "Add Domain" butonuna tıklayın
3. Domain adınızı girin (örn: axucreative.com)
4. Vercel size DNS kayıtlarını gösterecek
5. Bu kayıtları domain sağlayıcınızda yapılandırın

### Kendi Domain'inizi Bağlama:

1. **Vercel Dashboard > Settings > Domains**
2. "Add Domain" butonuna tıklayın
3. Mevcut domain'inizi girin
4. Vercel size DNS ayarlarını gösterecek:
   - **A Record:** `76.76.21.21`
   - **CNAME:** `cname.vercel-dns.com`
5. Domain sağlayıcınızın panelinde bu kayıtları ekleyin
6. DNS yayılımı 24-48 saat sürebilir

### Domain Sağlayıcı Örnekleri:

**Namecheap:**
- Advanced DNS > Add New Record
- Type: A Record veya CNAME
- Vercel'in verdiği değerleri girin

**GoDaddy:**
- DNS Management > Add
- Vercel'in verdiği kayıtları ekleyin

**Türkiye'deki sağlayıcılar (Turhost, Natro, vs):**
- DNS Yönetimi bölümünden
- Vercel'in verdiği kayıtları ekleyin

## 📧 Email Ayarları (Production)

Deploy sonrası `.env.local` dosyasındaki değerleri Vercel Environment Variables'a eklemeniz gerekiyor:

1. Vercel Dashboard > Projeniz > Settings > Environment Variables
2. Her bir değişkeni ekleyin:
   - `SMTP_HOST`
   - `SMTP_PORT`
   - `SMTP_USER`
   - `SMTP_PASS`
   - `CONTACT_EMAIL`

## ✅ Deploy Sonrası Kontrol Listesi

- [ ] Environment variables eklendi
- [ ] Domain bağlandı (veya Vercel subdomain kullanılıyor)
- [ ] SSL sertifikası aktif (otomatik)
- [ ] Form test edildi
- [ ] Instagram linkleri çalışıyor
- [ ] Responsive tasarım test edildi

## 🔄 Güncelleme Yapma

Her `git push` yaptığınızda Vercel otomatik olarak yeni bir deploy başlatır!

```bash
git add .
git commit -m "Update"
git push
```

## 📱 Vercel Mobile App

Vercel'in mobil uygulamasından da deploy'ları takip edebilirsiniz!







