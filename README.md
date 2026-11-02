# SmartComp - Platform Agregator Kompetisi & Workshop Mahasiswa

SmartComp adalah platform berbasis web yang dirancang untuk memfasilitasi mahasiswa dalam menemukan, mendaftar, dan mengelola kegiatan akademik maupun non-akademik (kompetisi dan *workshop*). Platform ini dilengkapi sistem autentikasi berbasis peran (*Role-Based Access Control*), integrasi *payment gateway* otomatis dengan Midtrans Snap API, forum diskusi komunitas, serta dashboard analitik dan manajemen bagi administrator.

---

## Daftar Isi
1. [Fitur Utama](#fitur-utama)
2. [Tech Stack](#tech-stack)
3. [Struktur Direktori Proyek](#struktur-direktori-proyek)
4. [Prasyarat Sistem](#prasyarat-sistem)
5. [Konfigurasi Basis Data](#konfigurasi-basis-data)
6. [Instalasi & Menjalankan di Lokal](#instalasi--menjalankan-di-lokal)
7. [Akun Pengujian Bawaan (Seed Data)](#akun-pengujian-bawaan-seed-data)
8. [Panduan Deployment (Docker & VPS)](#panduan-deployment-docker--vps)

---

## Fitur Utama

### 1. Modul Pengguna (Mahasiswa)
* **Katalog & Filter Dinamis:** Pencarian dan penyaringan kegiatan berdasarkan tipe (*Academic* / *Non-Academic*), kategori spesifik (*Programming*, *UI/UX*, *Data & AI*, *Soft Skills*, dll.), dan jenis kegiatan (*Workshop* / *Competition*).
* **Integrasi Pembayaran Otomatis:** Checkout tiket kegiatan menggunakan Midtrans Snap Sandbox (Virtual Account BCA/Mandiri/BNI, QRIS, Kartu Kredit).
* **Riwayat Pendaftaran & Transaksi:** Pemantauan status transaksi secara *real-time* (`pending`, `settlement`, `expire`).
* **Profil Pengguna:** Manajemen data diri, keahlian (*hard skills* & *soft skills*), nomor telepon, dan portofolio.
* **Forum Komunitas:** Ruang diskusi interaktif antar mahasiswa terkait persiapan kompetisi dan materi *workshop*.

### 2. Modul Administrator
* **Role-Based Redirection:** Pengalihan otomatis admin ke dashboard manajemen setelah login.
* **Manajemen Event:** Menambah, memperbarui, dan menghapus data *workshop* dan kompetisi.
* **Verifikasi Transaksi:** Pemantauan arus transaksi masuk dan fitur verifikasi manual pembayaran peserta.
* **Manajemen Pengguna:** Pengawasan akun peserta terdaftar.

---

## Tech Stack

| Komponen | Teknologi |
| :--- | :--- |
| **Backend** | Java Servlet (Jakarta EE 10 / 11), JSP, Maven |
| **Server Runtime** | Apache Tomcat 11.0.x (JDK 17 / JDK 21) |
| **Database** | PostgreSQL 16 dengan ekstensi `pgcrypto` (BCrypt hashing) |
| **Payment Gateway** | Midtrans Snap API (Sandbox Environment) |
| **Frontend** | HTML5, CSS3, JavaScript (ES6+), Bootstrap 5.3, Bootstrap Icons |
| **Deployment** | Docker, Docker Compose, Nginx Reverse Proxy, Let's Encrypt SSL |

---

## Struktur Direktori Proyek

```text
TUBES_PBO/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/
│       │       └── example/
│       │           ├── Database/
│       │           │   └── JDBC.java                  # Konfigurasi koneksi PostgreSQL
│       │           ├── Services/
│       │           │   └── MidtransService.java       # HTTP client komunikasi API Midtrans
│       │           ├── classes/
│       │           │   ├── Payment.java               # POJO Entity Transaksi
│       │           │   └── User.java                  # POJO Entity Pengguna
│       │           └── controller/
│       │               ├── LoginController.java       # Autentikasi & role routing
│       │               ├── PaymentController.java     # Endpoint checkout & callback user
│       │               ├── AdminPaymentController.java# Dashboard verifikasi admin
│       │               └── LogoutController.java      # Pembersihan sesi
│       └── webapp/
│           ├── resources/
│           │   ├── css/                               # Berkas styling eksternal
│           │   └── images/                            # Aset visual & logo platform
│           └── WEB-FILE/
│               ├── dashboardUser.jsp                  # Beranda katalog kegiatan
│               ├── dashboardAdmin.jsp                 # Panel manajemen admin
│               ├── payment.jsp                        # Riwayat status pembayaran
│               ├── Login.jsp                          # Halaman masuk
│               └── Register.jsp                       # Halaman registrasi peserta
├── pom.xml                                            # Dependensi Maven (jbcrypt, postgresql, servlet-api)
├── .gitignore
└── README.md# SmartComp - Platform Agregator Kompetisi & Workshop Mahasiswa

SmartComp adalah platform berbasis web yang dirancang untuk memfasilitasi mahasiswa dalam menemukan, mendaftar, dan mengelola kegiatan akademik maupun non-akademik (kompetisi dan *workshop*). Platform ini dilengkapi sistem autentikasi berbasis peran (*Role-Based Access Control*), integrasi *payment gateway* otomatis dengan Midtrans Snap API, forum diskusi komunitas, serta dashboard analitik dan manajemen bagi administrator.

---

## Daftar Isi
1. [Fitur Utama](#fitur-utama)
2. [Tech Stack](#tech-stack)
3. [Struktur Direktori Proyek](#struktur-direktori-proyek)
4. [Prasyarat Sistem](#prasyarat-sistem)
5. [Konfigurasi Basis Data](#konfigurasi-basis-data)
6. [Instalasi & Menjalankan di Lokal](#instalasi--menjalankan-di-lokal)
7. [Akun Pengujian Bawaan (Seed Data)](#akun-pengujian-bawaan-seed-data)
8. [Panduan Deployment (Docker & VPS)](#panduan-deployment-docker--vps)

---

## Fitur Utama

### 1. Modul Pengguna (Mahasiswa)
* **Katalog & Filter Dinamis:** Pencarian dan penyaringan kegiatan berdasarkan tipe (*Academic* / *Non-Academic*), kategori spesifik (*Programming*, *UI/UX*, *Data & AI*, *Soft Skills*, dll.), dan jenis kegiatan (*Workshop* / *Competition*).
* **Integrasi Pembayaran Otomatis:** Checkout tiket kegiatan menggunakan Midtrans Snap Sandbox (Virtual Account BCA/Mandiri/BNI, QRIS, Kartu Kredit).
* **Riwayat Pendaftaran & Transaksi:** Pemantauan status transaksi secara *real-time* (`pending`, `settlement`, `expire`).
* **Profil Pengguna:** Manajemen data diri, keahlian (*hard skills* & *soft skills*), nomor telepon, dan portofolio.
* **Forum Komunitas:** Ruang diskusi interaktif antar mahasiswa terkait persiapan kompetisi dan materi *workshop*.

### 2. Modul Administrator
* **Role-Based Redirection:** Pengalihan otomatis admin ke dashboard manajemen setelah login.
* **Manajemen Event:** Menambah, memperbarui, dan menghapus data *workshop* dan kompetisi.
* **Verifikasi Transaksi:** Pemantauan arus transaksi masuk dan fitur verifikasi manual pembayaran peserta.
* **Manajemen Pengguna:** Pengawasan akun peserta terdaftar.

---

## Tech Stack

| Komponen | Teknologi |
| :--- | :--- |
| **Backend** | Java Servlet (Jakarta EE 10 / 11), JSP, Maven |
| **Server Runtime** | Apache Tomcat 11.0.x (JDK 17 / JDK 21) |
| **Database** | PostgreSQL 16 dengan ekstensi `pgcrypto` (BCrypt hashing) |
| **Payment Gateway** | Midtrans Snap API (Sandbox Environment) |
| **Frontend** | HTML5, CSS3, JavaScript (ES6+), Bootstrap 5.3, Bootstrap Icons |
| **Deployment** | Docker, Docker Compose, Nginx Reverse Proxy, Let's Encrypt SSL |

---

## Struktur Direktori Proyek

```text
TUBES_PBO/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/
│       │       └── example/
│       │           ├── Database/
│       │           │   └── JDBC.java                  # Konfigurasi koneksi PostgreSQL
│       │           ├── Services/
│       │           │   └── MidtransService.java       # HTTP client komunikasi API Midtrans
│       │           ├── classes/
│       │           │   ├── Payment.java               # POJO Entity Transaksi
│       │           │   └── User.java                  # POJO Entity Pengguna
│       │           └── controller/
│       │               ├── LoginController.java       # Autentikasi & role routing
│       │               ├── PaymentController.java     # Endpoint checkout & callback user
│       │               ├── AdminPaymentController.java# Dashboard verifikasi admin
│       │               └── LogoutController.java      # Pembersihan sesi
│       └── webapp/
│           ├── resources/
│           │   ├── css/                               # Berkas styling eksternal
│           │   └── images/                            # Aset visual & logo platform
│           └── WEB-FILE/
│               ├── dashboardUser.jsp                  # Beranda katalog kegiatan
│               ├── dashboardAdmin.jsp                 # Panel manajemen admin
│               ├── payment.jsp                        # Riwayat status pembayaran
│               ├── Login.jsp                          # Halaman masuk
│               └── Register.jsp                       # Halaman registrasi peserta
├── pom.xml                                            # Dependensi Mave

	



