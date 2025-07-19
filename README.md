# 🌶️ test-paprika

Aplikasi Flutter sederhana yang memiliki fitur utama pembelian Ethereum (top-up) dan pengelolaan data pengguna menggunakan API dummy dari [jsonbin.io](https://jsonbin.io).

## ✨ Fitur Utama

* **Harga Ethereum Terbaru**: Melihat harga Ethereum terbaru yang diambil langsung dari CoinGecko.
* **Manajemen Profil Pengguna**: Menampilkan profil pengguna (`name`, `photo`, `balance`).
* **Daftar Kartu Kredit**: Menampilkan dan mengelola daftar kartu kredit yang terdaftar.
* **Riwayat Transaksi**: Melihat detail riwayat transaksi pembelian Ethereum.
* **Pembelian/Top Up Ethereum**: Melakukan proses pembelian Ethereum secara simulasi menggunakan data dummy.

## 🚀 Instalasi & Menjalankan Aplikasi

Pastikan Anda telah menginstal **Flutter SDK versi 3.24.3** atau yang kompatibel.

1.  **Kloning Repositori:**
    ```bash
    git clone -b main [https://github.com/rendyadittt/test-paprika.git](https://github.com/rendyadittt/test-paprika.git)
    cd test-paprika
    ```

2.  **Dapatkan Dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Jalankan Aplikasi:**
    ```bash
    flutter run
    ```
    *(Pastikan Anda memiliki perangkat atau emulator yang terhubung.)*

## 🛠️ Teknologi yang Digunakan

* **Bahasa Pemrograman**: Dart
* **Framework**: Flutter 3.24.3
* **State Management**: GetX

### Dependensi Utama

* `get`: `^4.6.6`
* `http`: `^1.4.0`
* `cached_network_image`: `^3.3.1`
* `intl`: `^0.19.0`
* `flutter_html`: `^3.0.0`

## 🌐 API Endpoint dan Contoh Respon

Aplikasi ini menggunakan kombinasi API dummy dari jsonbin.io dan API real-time dari CoinGecko.

### Base URLs

* **JSONBin API**: `https://api.jsonbin.io/v3/b`
* **CoinGecko API**: `https://api.coingecko.com`

### Endpoint dan Contoh Respon

#### **Profil Pengguna (`/me`)**
* **Endpoint:** `static String me = "/687b0b8e569b9c47a23419e0";`
* **Deskripsi:** Digunakan untuk mengambil data profil pengguna.
```json
{
  "name": "Rendy Aditya",
  "photo": "[https://avatars.githubusercontent.com/u/56332995?v=4](https://avatars.githubusercontent.com/u/56332995?v=4)",
  "balance": 650000
}


4. API Endpoint dan Response:
   BaseUrl "https://api.jsonbin.io/v3/b";
   CoinGeckoUrl = "https://api.coingecko.com";
    
   ** Digunakan untuk hit profile **
   static String me = "/687b0b8e569b9c47a23419e0";
   {
     "name": "Rendy Aditya",
     "photo": "https://avatars.githubusercontent.com/u/56332995?v=4",
     "balance": 650000
   }
    
   ** Digunakan untuk hit riwayat transaksi* *
   static String history = "/687b0ef02de0201b319cd30d";
   [
      {
        "status": true,
        "total": 10000,
        "date": "2025-07-17T07:45:00Z",
        "method": "visa"
      }
   ]

   ** Digunakan untuk hit api list creditcard **
   static String creditCard = "/687b0edb2de0201b319cd2fb";
   [
     {
        "id": 1,
        "category": "visa",
        "logo": "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5e/Visa_Inc._logo.svg/  2560px-Visa_Inc._logo.svg.png",
        "card-holder": "MUHAMAD RENDY ADITYA",
        "balance": 10000000,
        "card-number": "1234-5678-9101-1121"
      }
   ]

   ** Digunakan untuk hit api list advertising **
   static String advertising = "/687b3d58e671f863e6ecbd81";
   [
     {
        "image": "https://blog.pintu.co.id/wp-content/uploads/2025/05/Pintu-Web3-Quick-Swap-Feature_CRM_1020x768-Blog.jpg",
        "desc": "<h1>Lorem Ipsum</h1><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p><ul><li>Pertama</li><li>Kedua</li><li>Ketiga</li></ul>"
     }
   ]

   ** Digunakan untuk hit api harga ETH Terbaru **
   static String priceEth = "/api/v3/simple/price?ids=ethereum&vs_currencies=idr";
   {
      "ethereum": {
      "idr": 50543215
    }
  }


