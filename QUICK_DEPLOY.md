# 🚀 Hızlı Deploy Rehberi - Vercel

## Adım 1: GitHub'a Yükleme

```bash
# Terminal'de proje klasöründe:
git init
git add .
git commit -m "Initial commit"
```

GitHub'da yeni bir repository oluşturun, sonra:

```bash
git remote add origin https://github.com/KULLANICI_ADI/REPO_ADI.git
git branch -M main
git push -u origin main
```

## Adım 2: Vercel'e Deploy

1. **https://vercel.com** adresine gidin
2. **"Sign Up"** veya **"Log In"** yapın (GitHub ile giriş yapabilirsiniz)
3. **"Add New Project"** butonuna tıklayın
4. GitHub repository'nizi seçin
5. **"Import"** butonuna tıklayın
6. Ayarlar otomatik algılanacak (Next.js)
7. **"Deploy"** butonuna tıklayın

## Adım 3: Environment Variables Ekleme

Deploy sonrası:

1. Projenizin **Settings** > **Environment Variables** bölümüne gidin
2. Aşağıdaki değişkenleri ekleyin:

```
SMTP_HOST = mail.axucreative.com
SMTP_PORT = 465
SMTP_USER = alperen@axucreative.com
SMTP_PASS = Apollo.7799
CONTACT_EMAIL = axucreative@gmail.com
```

3. Her değişkeni ekledikten sonra **"Save"** yapın
4. **"Redeploy"** butonuna tıklayın (değişkenlerin aktif olması için)

## Adım 4: Domain Bağlama

### Vercel'den Ücretsiz Domain:
- Vercel size otomatik bir domain verir: `proje-adi.vercel.app`
- Bu domain hemen çalışır!

### Kendi Domain'inizi Bağlama:

1. **Settings** > **Domains** bölümüne gidin
2. **"Add Domain"** butonuna tıklayın
3. Domain adınızı girin (örn: `axucreative.com`)
4. Vercel size DNS ayarlarını gösterecek
5. Domain sağlayıcınızın panelinde bu kayıtları ekleyin:
   - **A Record:** `76.76.21.21`
   - **CNAME:** `cname.vercel-dns.com`
6. 24-48 saat içinde domain aktif olur

## ✅ Test

1. Sitenizi ziyaret edin
2. İletişim formunu test edin
3. Instagram linklerini kontrol edin

## 🔄 Güncelleme

Her değişiklik yaptığınızda:

```bash
git add .
git commit -m "Update"
git push
```

Vercel otomatik olarak yeni deploy başlatır!







