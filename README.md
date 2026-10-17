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


### Flutter Sürümü

Bu proje aşağıdaki geliştirme araçlarıyla hazırlanmıştır:

- **Flutter SDK:** 3.47.7
- **Flutter Channel:** stable
- **Dart SDK:** 3.13.5
- **Flutter Framework Revision:** `abaf9c5237`
- **Flutter Engine Revision:** `deb287481e`
- **DevTools:** 2.60.0

Projeyi çalıştırmadan önce Flutter kurulumunuzu kontrol edin:

```bash
flutter --version
flutter doctor
flutter pub get
```