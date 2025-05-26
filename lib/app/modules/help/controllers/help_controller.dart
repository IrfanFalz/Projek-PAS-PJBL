import 'package:get/get.dart';

class HelpController extends GetxController {
  // Observable untuk mengontrol ekspansi FAQ
  var expandedFAQIndex = (-1).obs;
  
  // Observable untuk tab yang aktif
  var activeTab = 0.obs;
  
  // Daftar FAQ
  final List<Map<String, String>> faqList = [
    {
      'question': 'Bagaimana cara mendaftar ekstrakurikuler?',
      'answer': 'Untuk mendaftar ekstrakurikuler:\n1. Buka aplikasi dan masuk ke akun Anda\n2. Pilih menu "Ekstrakurikuler"\n3. Pilih ekstrakurikuler yang diminati\n4. Klik "Daftar" dan isi formulir pendaftaran\n5. Tunggu sampai muncul notif berhasil mendaftar'
    },
    {
      'question': 'Berapa banyak ekstrakurikuler yang bisa saya ikuti?',
      'answer': 'Setiap siswa tidak memiliki batasan ekstrakurikuler yang diikuti. Namun, disarankan ekstrakurikuler yang diikuti tidak melebihi 3 ekstrakurikuler, demi keseimbangan antara akademik dan ekstrakurikuler.'
    },
    {
      'question': 'Bagaimana cara melihat jadwal kegiatan ekstrakurikuler?',
      'answer': 'Jadwal kegiatan dapat dilihat melalui:\n1. Menu "Jadwal" di halaman utama\n2. Notifikasi yang akan dikirim sebelum kegiatan\n3. Kalender di profil ekstrakurikuler masing-masing\n4. Pengumuman dari pembina ekstrakurikuler melalui platform lain (Whatsapp, Telegram, dll)'
    },
    {
      'question': 'Apakah ada biaya untuk mengikuti ekstrakurikuler?',
      'answer': 'Sebagian besar ekstrakurikuler gratis. Namun, beberapa ekstrakurikuler mungkin memerlukan biaya untuk:\n- Seragam atau perlengkapan khusus\n- Kompetisi atau event tertentu\n- Kegiatan di luar sekolah\n\nInformasi biaya akan dijelaskan lebih lajut oleh pemimbing jika diperlukan.'
    },
    {
      'question': 'Bagaimana cara menghubungi pembina ekstrakurikuler?',
      'answer': 'Anda dapat menghubungi pembina melalui:\n1. no. telp yang didapat ketika pertemuan pertama\n2. Bertanya langsung saat kegiatan berlangsung\n3. Melalui kantor guru atau tata usaha sekolah'
    },
    {
      'question': 'Bagaimana sistem penilaian ekstrakurikuler?',
      'answer': 'Penilaian ekstrakurikuler meliputi:\n- Kehadiran dan partisipasi aktif\n- Prestasi dalam kegiatan atau kompetisi\n- Sikap dan kerja sama dengan anggota lain\n- Kontribusi terhadap pengembangan ekstrakurikuler\n\nNilai akan muncul di rapor sebagai nilai ekstrakurikuler.'
    },
    {
      'question': 'Apa yang harus dilakukan jika lupa password?',
      'answer': 'Jika lupa password:\n1. Klik "Lupa Password" di halaman login\n2. Menggunakan fitur ubah password dihalaman profil\n3. pastikan ingat email dan username akun yang ingin dirubah passwordnya\n4. Ikuti instruksi untuk membuat password baru\n5. Login dengan password yang baru dibuat'
    }
  ];
  
  // Daftar panduan
  final List<Map<String, dynamic>> guideList = [
    {
      'title': 'Memulai Menggunakan Aplikasi',
      'icon': '🚀',
      'steps': [
        'Download aplikasi dari Play Store atau App Store',
        'Registrasi menggunakan username, email, nomer telpon dan membuat password',
        'Login dengan username dan password',
        'Lengkapi profil personal Anda, di halaman profil'
      ]
    },
    {
      'title': 'Mencari dan Bergabung Ekstrakurikuler',
      'icon': '🔍',
      'steps': [
        'Buka menu "Ekstrakurikuler" di beranda',
        'Gunakan fitur pencari untuk mencari ekstrakurikuler',
        'Baca deskripsi dan keterangan seperti jadwal, tempat dan pembimbing ekstrakurikuler',
        'Klik "Daftar" pada ekstrakurikuler pilihan',
        'Isi formulir pendaftaran dengan lengkap',
        'Tunggu hingga muncul notif berhasil'
      ]
    },
    {
      'title': 'Mengelola Jadwal dan Kegiatan',
      'icon': '📅',
      'steps': [
        'Akses menu "Jadwal" untuk melihat agenda',
        'Aktifkan notifikasi untuk pengingat kegiatan',
        'Cek notifikasi terbaru secara berkala'
      ]
    },
  ];
  
  // Informasi kontak dan dukungan
  final Map<String, String> contactInfo = {
    'email': 'smpn2mlg.medsos@gmail.com',
    'phone': '(0341) 325508',
    'whatsapp': '+62 812-3456-7890',
    'website': 'https://www.smpn2mlg.sch.id/menu/profil-kami/',
    'address': ' Jl. Prof. Moch Yamin No. 60, Sukoharjo, Kec. Klojen, Kota Malang, Jawa Timur 65118'
  };
  
  // Fungsi untuk toggle FAQ expansion
  void toggleFAQ(int index) {
    if (expandedFAQIndex.value == index) {
      expandedFAQIndex.value = -1;
    } else {
      expandedFAQIndex.value = index;
    }
  }
  
  // Fungsi untuk mengubah tab aktif
  void changeTab(int index) {
    activeTab.value = index;
    expandedFAQIndex.value = -1; // Reset FAQ expansion saat ganti tab
  }
  
  // Fungsi untuk kembali ke halaman sebelumnya
  void goBack() {
    Get.back();
  }
}