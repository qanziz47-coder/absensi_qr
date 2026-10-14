# 🎓 Sistem Absensi Siswa Berbasis QR Code

Aplikasi web untuk mengelola absensi siswa, dikembangkan sebagai proyek pembelajaran di sekolah sekaligus bagian dari portofolio di bidang pemrograman.

Project ini bertujuan untuk mengeksplorasi penerapan QR Code dalam sistem absensi, pengelolaan data siswa, pencatatan kehadiran, serta sistem poin untuk penghargaan dan pelanggaran.

## ✨ Fitur Utama

- **Absensi QR Code** — Menggunakan QR Code sebagai identitas siswa dalam proses absensi.
- **Manajemen Data Siswa** — Mengelola informasi siswa, kelas, dan akun pengguna.
- **Pencatatan Kehadiran** — Mencatat tanggal absensi, waktu masuk, keterlambatan, dan waktu pulang.
- **Status Kehadiran** — Mendukung status hadir, izin, sakit, dan alfa.
- **Sistem Poin** — Mencatat poin Stella dan Tonitrus untuk penghargaan serta kedisiplinan siswa.
- **Manajemen Pelanggaran** — Mencatat pelanggaran dan tindakan atau sanksi yang diberikan.
- **Sistem Penghargaan** — Mendukung pencatatan pencapaian siswa dan data sertifikat.
- **Hak Akses Pengguna** — Menyediakan peran guru, siswa, dan developer.
- **Dashboard Pengguna** — Mengelompokkan fitur berdasarkan peran pengguna.
- **Pengaturan Sistem** — Menyimpan konfigurasi jam masuk, batas keterlambatan, poin, dan pengaturan notifikasi.

## 🛠️ Teknologi yang Digunakan

- **Backend:** PHP
- **Database:** MySQL / MariaDB
- **Frontend:** HTML, CSS, JavaScript
- **Server Lokal:** XAMPP
- **Manajemen Database:** phpMyAdmin
- **Format Database:** SQL

## 🗄️ Struktur Database

Database `absensi_qr` terdiri dari beberapa tabel utama:

| Tabel | Fungsi |
|---|---|
| `users` | Menyimpan akun pengguna dan peran |
| `siswa` | Menyimpan data siswa dan informasi poin |
| `absensi` | Menyimpan catatan kehadiran siswa |
| `hukuman` | Menyimpan catatan pelanggaran dan sanksi |
| `riwayat_poin` | Menyimpan riwayat perubahan poin siswa |
| `pengaturan` | Menyimpan konfigurasi aplikasi |

## 📚 Tujuan Pembelajaran

Melalui project ini, saya mempelajari dan mengeksplorasi:

- Pengembangan aplikasi web menggunakan PHP.
- Perancangan database relasional menggunakan MySQL.
- Penggunaan SQL untuk mengelola data.
- Penerapan relasi antartabel dan foreign key.
- Pengelolaan data siswa dan riwayat absensi.
- Pembagian hak akses berdasarkan peran pengguna.
- Penerapan aturan keterlambatan dan sistem poin.
- Pengembangan alur absensi berbasis QR Code.

## 🚧 Status Project

**Status:** Proyek Pembelajaran / Eksperimen

Project ini dikembangkan untuk keperluan pembelajaran dan portofolio pemrograman. Fitur, desain, dan implementasinya masih dapat dikembangkan serta disempurnakan lebih lanjut.

## 🔒 Catatan Keamanan

Project ini ditujukan untuk pembelajaran dan demonstrasi. Sebelum dipublikasikan atau digunakan dalam lingkungan nyata, pastikan untuk:

- Menghapus atau mengganti data pribadi siswa dengan data dummy.
- Tidak memublikasikan password asli maupun API key.
- Menggunakan hashing password yang aman.
- Memvalidasi input dan menerapkan perlindungan terhadap akses yang tidak sah.
- Menguji seluruh fitur sebelum aplikasi digunakan secara nyata.

## 👨‍💻 Tentang Pengembang

Dikembangkan oleh pelajar sebagai bagian dari proses belajar pemrograman web dan pengembangan portofolio pribadi.

---

*Dibuat untuk belajar, bereksperimen, dan terus berkembang.*
