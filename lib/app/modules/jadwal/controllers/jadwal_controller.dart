import 'package:get/get.dart';

class JadwalController extends GetxController {
  // Observable untuk tanggal yang dipilih
  var selectedDate = DateTime.now().obs;
  
  // Observable untuk bulan yang sedang ditampilkan
  var currentMonth = DateTime.now().obs;
  
  // Observable untuk daftar kegiatan
  var kegiatanList = <Map<String, dynamic>>[].obs;
  
  // Observable untuk loading state
  var isLoading = false.obs;
  
  // Observable untuk hari-hari dalam kalender
  var calendarDays = <DateTime>[].obs;
  
  // Data dummy ekstrakurikuler
  final Map<String, List<Map<String, dynamic>>> ekstrakurikulerData = {
    // November 2024
    '2025-11-01': [
      {
        'nama': 'Basket',
        'waktu': '14:00 - 16:00',
        'tempat': 'Lapangan Basket',
        'pembina': 'Pak Doni',
        'icon': '🏀'
      }
    ],
    '2025-11-04': [
      {
        'nama': 'PMR (Palang Merah Remaja)',
        'waktu': '13:30 - 15:30',
        'tempat': 'Ruang UKS',
        'pembina': 'Bu Dewi',
        'icon': '⛑️'
      }
    ],
    '2025-11-06': [
      {
        'nama': 'English Club',
        'waktu': '15:30 - 17:00',
        'tempat': 'Ruang Kelas 12A',
        'pembina': 'Ms. Sarah',
        'icon': '📚'
      }
    ],
    '2025-11-08': [
      {
        'nama': 'Futsal',
        'waktu': '15:00 - 17:00',
        'tempat': 'Lapangan Futsal',
        'pembina': 'Pak Andi',
        'icon': '⚽'
      },
      {
        'nama': 'Musik',
        'waktu': '16:00 - 18:00',
        'tempat': 'Ruang Musik',
        'pembina': 'Pak Budi',
        'icon': '🎵'
      }
    ],
    '2025-11-11': [
      {
        'nama': 'Pramuka',
        'waktu': '14:00 - 16:00',
        'tempat': 'Aula Sekolah',
        'pembina': 'Bu Siti',
        'icon': '🏕️'
      }
    ],
    '2025-11-13': [
      {
        'nama': 'Tari',
        'waktu': '15:00 - 17:00',
        'tempat': 'Ruang Seni',
        'pembina': 'Bu Rina',
        'icon': '💃'
      }
    ],
    '2025-11-15': [
      {
        'nama': 'Karate',
        'waktu': '14:30 - 16:30',
        'tempat': 'Dojo Sekolah',
        'pembina': 'Sensei Joko',
        'icon': '🥋'
      },
      {
        'nama': 'Jurnalistik',
        'waktu': '15:30 - 17:30',
        'tempat': 'Lab Multimedia',
        'pembina': 'Pak Wahyu',
        'icon': '📰'
      }
    ],
    '2025-11-18': [
      {
        'nama': 'Voli',
        'waktu': '14:00 - 16:00',
        'tempat': 'Lapangan Voli',
        'pembina': 'Bu Linda',
        'icon': '🏐'
      }
    ],
    '2025-11-20': [
      {
        'nama': 'Robotika',
        'waktu': '13:00 - 15:00',
        'tempat': 'Lab Komputer',
        'pembina': 'Bu Maya',
        'icon': '🤖'
      }
    ],
    '2025-11-22': [
      {
        'nama': 'Badminton',
        'waktu': '15:00 - 17:00',
        'tempat': 'Lapangan Badminton',
        'pembina': 'Pak Rudi',
        'icon': '🏸'
      },
      {
        'nama': 'Fotografi',
        'waktu': '14:00 - 16:00',
        'tempat': 'Studio Foto',
        'pembina': 'Bu Ayu',
        'icon': '📸'
      }
    ],
    '2025-05-23': [
      {
        'nama': 'Kemah Dewan Galang',
        'waktu': '07:00 - 17:00',
        'tempat': 'Lapangan Upacara',
        'pembina': 'Bu Siti & Pak Agus',
        'icon': '⛺'
      },
      {
        'nama': 'Masak Outdoor',
        'waktu': '10:00 - 14:00',
        'tempat': 'Area Kemah',
        'pembina': 'Bu Siti',
        'icon': '🍳'
      }
    ],
    '2025-05-27': [
      {
        'nama': 'Latihan Paskibra',
        'waktu': '14:00 - 16:00',
        'tempat': 'Lapangan Upacara',
        'pembina': 'Bapak Ali',
        'icon': '🚩'
      }
    ],
    '2025-05-29': [
      {
        'nama': 'Sparing vs SMP Negeri 1',
        'waktu': '15:00 - 17:30',
        'tempat': 'Lapangan Futsal AS Janti',
        'pembina': 'Coach Arif',
        'icon': '⚽'
      }
    ],
    '2025-05-30': [
      {
        'nama': 'Latihan Fisik Basket',
        'waktu': '08:00 - 12:00',
        'tempat': 'Lapangan Basket Sekolah',
        'pembina': 'Coach Adi',
        'icon': '🏀'
      },
    ],
    
    // Desember 2024
    '2025-06-01': [
      {
        'nama': 'Latihan persiapan Pertunjukan (Band)',
        'waktu': '14:00 - 16:00',
        'tempat': 'Ruang Musik',
        'pembina': 'Ibu Siwi',
        'icon': '🎸'
      }
    ],
    '2024-12-04': [
      {
        'nama': 'Marching Band',
        'waktu': '15:00 - 18:00',
        'tempat': 'Lapangan Upacara',
        'pembina': 'Pak Hendra',
        'icon': '🎺'
      }
    ],
    '2024-12-06': [
      {
        'nama': 'Coding Club',
        'waktu': '13:30 - 16:30',
        'tempat': 'Lab Komputer 2',
        'pembina': 'Pak Ridwan',
        'icon': '💻'
      }
    ],
    '2024-12-09': [
      {
        'nama': 'Seni Lukis',
        'waktu': '14:00 - 16:30',
        'tempat': 'Ruang Seni Rupa',
        'pembina': 'Bu Fitri',
        'icon': '🎨'
      }
    ],
    '2024-12-11': [
      {
        'nama': 'Paduan Suara',
        'waktu': '15:00 - 17:00',
        'tempat': 'Aula Musik',
        'pembina': 'Bu Ratih',
        'icon': '🎤'
      }
    ],
    '2024-12-13': [
      {
        'nama': 'Olimpiade Matematika',
        'waktu': '13:00 - 15:30',
        'tempat': 'Ruang Kelas 10A',
        'pembina': 'Pak Surya',
        'icon': '🧮'
      },
      {
        'nama': 'Catur',
        'waktu': '15:30 - 17:30',
        'tempat': 'Ruang Serbaguna',
        'pembina': 'Pak Gunawan',
        'icon': '♟️'
      }
    ],
    '2024-12-16': [
      {
        'nama': 'Tenis Meja',
        'waktu': '14:30 - 16:30',
        'tempat': 'Ruang Tenis Meja',
        'pembina': 'Bu Indah',
        'icon': '🏓'
      }
    ],
    '2024-12-18': [
      {
        'nama': 'Kaligrafi',
        'waktu': '13:30 - 15:30',
        'tempat': 'Ruang Agama',
        'pembina': 'Ustadz Ahmad',
        'icon': '✍️'
      }
    ],
    '2024-12-20': [
      {
        'nama': 'Basket Tournament',
        'waktu': '08:00 - 17:00',
        'tempat': 'Lapangan Basket',
        'pembina': 'Pak Doni & Tim Juri',
        'icon': '🏆'
      }
    ],
    '2024-12-23': [
      {
        'nama': 'Christmas Carol Practice',
        'waktu': '14:00 - 17:00',
        'tempat': 'Aula Utama',
        'pembina': 'Bu Ratih & Pak Budi',
        'icon': '🎄'
      }
    ],
    
    // Januari 2025
    '2025-01-08': [
      {
        'nama': 'New Year Basketball',
        'waktu': '14:00 - 16:00',
        'tempat': 'Lapangan Basket',
        'pembina': 'Pak Doni',
        'icon': '🏀'
      }
    ],
    '2025-01-10': [
      {
        'nama': 'Futsal Championship',
        'waktu': '13:00 - 17:00',
        'tempat': 'Lapangan Futsal',
        'pembina': 'Pak Andi',
        'icon': '⚽'
      }
    ],
    '2025-01-13': [
      {
        'nama': 'Workshop Robotika',
        'waktu': '09:00 - 15:00',
        'tempat': 'Lab Komputer',
        'pembina': 'Bu Maya & Tim IT',
        'icon': '🤖'
      }
    ],
    '2025-01-15': [
      {
        'nama': 'Latihan Drama',
        'waktu': '15:00 - 18:00',
        'tempat': 'Ruang Drama',
        'pembina': 'Bu Ratna',
        'icon': '🎭'
      }
    ],
  };
  
  @override
  void onInit() {
    super.onInit();
    generateCalendarDays();
    loadKegiatanByDate(selectedDate.value);
  }
  
  // Fungsi untuk mengupdate tanggal yang dipilih
  void updateSelectedDate(DateTime date) {
    selectedDate.value = date;
    loadKegiatanByDate(date);
  }
  
  // Fungsi untuk load kegiatan berdasarkan tanggal
  void loadKegiatanByDate(DateTime date) {
    isLoading.value = true;
    
    // Simulasi loading delay
    Future.delayed(const Duration(milliseconds: 300), () {
      String dateKey = '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
      
      if (ekstrakurikulerData.containsKey(dateKey)) {
        kegiatanList.value = ekstrakurikulerData[dateKey]!;
      } else {
        kegiatanList.value = [];
      }
      
      isLoading.value = false;
    });
  }
  
  // Fungsi untuk kembali ke halaman sebelumnya
  void goBack() {
    Get.back();
  }
  
  // Fungsi untuk format tanggal
  String formatDate(DateTime date) {
    List<String> bulan = [
      'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
      'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'
    ];
    
    List<String> hari = [
      'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu', 'Minggu'
    ];
    
    return '${hari[date.weekday - 1]}, ${date.day} ${bulan[date.month - 1]} ${date.year}';
  }
  
  // Fungsi untuk generate hari-hari dalam kalender
  void generateCalendarDays() {
    calendarDays.clear();
    
    DateTime firstDayOfMonth = DateTime(currentMonth.value.year, currentMonth.value.month, 1);
    DateTime lastDayOfMonth = DateTime(currentMonth.value.year, currentMonth.value.month + 1, 0);
    
    // Menentukan hari pertama dalam minggu (Senin = 1)
    int firstWeekday = firstDayOfMonth.weekday;
    
    // Menambahkan hari-hari dari bulan sebelumnya
    DateTime startDate = firstDayOfMonth.subtract(Duration(days: firstWeekday - 1));
    
    // Generate 42 hari (6 minggu x 7 hari)
    for (int i = 0; i < 42; i++) {
      calendarDays.add(startDate.add(Duration(days: i)));
    }
  }
  
  // Fungsi untuk pindah ke bulan sebelumnya
  void previousMonth() {
    currentMonth.value = DateTime(currentMonth.value.year, currentMonth.value.month - 1);
    generateCalendarDays();
  }
  
  // Fungsi untuk pindah ke bulan selanjutnya
  void nextMonth() {
    currentMonth.value = DateTime(currentMonth.value.year, currentMonth.value.month + 1);
    generateCalendarDays();
  }
  
  // Fungsi untuk mendapatkan nama bulan dan tahun
  String getCurrentMonthYear() {
    List<String> bulan = [
      'Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni',
      'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'
    ];
    
    return '${bulan[currentMonth.value.month - 1]} ${currentMonth.value.year}';
  }
  
  // Fungsi untuk mengecek apakah dua tanggal sama
  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year && 
           date1.month == date2.month && 
           date1.day == date2.day;
  }
  
  // Fungsi untuk mengecek apakah ada event pada tanggal tertentu
  bool hasEventOnDate(DateTime date) {
    String dateKey = '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
    return ekstrakurikulerData.containsKey(dateKey);
  }
}