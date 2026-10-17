# PureShelf

PureShelf, Flutter ile geliştirilmiş, eğitim amaçlı bir mini kozmetik ve cilt bakım ürünleri kataloğu uygulamasıdır. Uygulama; ürünleri JSON dosyasından okuma, ürünleri listeleme ve filtreleme, ürün detaylarını görüntüleme ve temel bir sepet simülasyonu gibi Flutter'ın temel özelliklerini göstermeyi amaçlar.

> **Not:** PureShelf bir eğitim projesidir. Gerçek ödeme sistemi, kullanıcı hesabı, stok yönetimi veya çevrim içi ürün servisi içermez.

## Özellikler

- **Ana sayfa:** Tanıtım alanı, kategoriler, öne çıkan ürünler ve sepet göstergesi.
- **Ürün listesi:** İki sütunlu GridView ile ürün kartları, ürün arama ve kategori filtreleme.
- **Ürün detayları:** Ürün görseli, adı, kategorisi, fiyatı ve açıklaması.
- **Sayfa geçişleri:** Navigator, Navigator.push, Navigator.pop ve MaterialPageRoute kullanımı.
- **Veri aktarımı:** Ekranlar arasında Route Arguments ile ürün bilgilerinin aktarılması.
- **JSON kullanımı:** Ürün verilerinin yerel JSON dosyasından okunması.
- **Model sınıfı:** Product modeli ile fromJson ve toJson metotları.
- **Asset yönetimi:** Yerel ürün görsellerinin Image.asset ile gösterilmesi.
- **Sepet simülasyonu:** Ürün ekleme, adet değiştirme, ürün silme ve toplam tutarı hesaplama.
- **State yönetimi:** Temel durum güncellemeleri için setState kullanımı.

## Screenshots

### Home Screen
![Home Screen](screenshots/screenshotshome.png)

### Product List
![Product List](screenshots/screenshotslist.png)

### Product List — All Products
![All Products](screenshots/screenshotslist_all.png)

### Product Detail
![Product Detail](screenshots/screenshotsdetail.png)

### Shopping Cart
![Shopping Cart](screenshots/screenshotscart.png)

## Kullanılan Teknolojiler

- Flutter SDK
- Dart
- Material Design (`material.dart`)
- Visual Studio Code
- Android Studio ve Android Emulator

Projede ek Flutter paketi kullanılmamıştır.

## Gereksinimler

- Flutter SDK 3.47.7
- Dart SDK 3.13.5
- Android Studio (Android Emulator için)
- Visual Studio Code
- Git

## Kurulum ve Çalıştırma

1. Projeyi indir:
```bash
   git clone https://github.com/elifsudetopcu/Pureshelf.git
   cd Pureshelf
```
2. Android Studio'da bir sanal telefon (emülatör) başlat.
3. Cihazın göründüğünü kontrol et:
```bash
   flutter devices
```
4. Bağımlılıkları yükle:
```bash
   flutter pub get
```
5. Uygulamayı çalıştır:
```bash
   flutter run
```

## Klasör Yapısı

```
Pureshelf/
├── android/
├── assets/
│   ├── data/
│   │   └── products.json
│   └── images/
├── lib/
│   ├── data/
│   │   ├── cart_service.dart
│   │   └── product_service.dart
│   ├── models/
│   │   └── product.dart
│   ├── screens/
│   │   ├── cart_screen.dart
│