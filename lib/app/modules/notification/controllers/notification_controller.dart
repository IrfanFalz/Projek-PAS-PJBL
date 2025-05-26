import 'package:get/get.dart';
import 'package:flutter/material.dart';

class NotificationController extends GetxController {
  late AnimationController _animationController;
  late Animation<double> fadeAnimation;
  late Animation<Offset> slideAnimation;

  final RxList<NotificationItem> notifications = <NotificationItem>[].obs;
  final RxString selectedFilter = 'Semua'.obs;
  final List<String> filterOptions = ['Semua', 'Belum dibaca', 'Sudah dibaca'];
  final RxBool isRefreshing = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadNotifications();
  }

  void initAnimation(TickerProvider vsync) {
    _animationController = AnimationController(
      vsync: vsync,
      duration: Duration(milliseconds: 800),
    );

    fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.2, 0.8, curve: Curves.easeIn),
    );

    slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.2, 0.7, curve: Curves.easeOut),
    ));

    _animationController.forward();
  }

  void disposeAnimation() {
    _animationController.dispose();
  }

  void _loadNotifications() {
    notifications.addAll([
      NotificationItem(
        id: 1,
        title: 'Pendaftaran Ekstrakurikuler Tahun 2025/2026',
        message:
            'Pendaftaran ekstrakurikuler untuk tahun ajaran baru telah dibuka. Silahkan mendaftar melalui aplikasi sebelum tanggal 20 Juni 2025.',
        time: '2 Jam yang lalu',
        isRead: false,
        category: 'Umum',
        icon: Icons.school,
        color: Colors.blue,
      ),
      NotificationItem(
        id: 2,
        title: 'Pertemuan Futsal',
        message:
            'Latihan futsal akan diadakan pada hari Sabtu, 10 Mei 2025 pukul 15.00 WIB di lapangan basket.',
        time: '5 Jam yang lalu',
        isRead: false,
        category: 'Futsal',
        icon: Icons.sports_soccer,
        color: Colors.green,
      ),
      NotificationItem(
        id: 3,
        title: 'Pengumuman Libur Nasional',
        message:
            'Diberitahukan kepada seluruh siswa bahwa tanggal 15 Mei 2025 adalah libur nasional dalam rangka Hari Raya Idul Fitri.',
        time: '1 Hari yang lalu',
        isRead: true,
        category: 'Umum',
        icon: Icons.calendar_today,
        color: Colors.orange,
      ),
      NotificationItem(
        id: 4,
        title: 'Latihan Paskibra',
        message:
            'Latihan paskibra untuk persiapan upacara 17 Agustus akan dimulai tanggal 20 Mei 2025. Harap seluruh anggota dapat hadir.',
        time: '2 Hari yang lalu',
        isRead: true,
        category: 'Paskibra',
        icon: Icons.flag,
        color: Colors.red,
      ),
      NotificationItem(
        id: 5,
        title: 'Kompetisi Basket Antar Sekolah',
        message:
            'Tim basket sekolah akan mengikuti kompetisi antar sekolah pada tanggal 25 Mei 2025. Dukungan dari semua siswa sangat diharapkan.',
        time: '3 Hari yang lalu',
        isRead: true,
        category: 'Basket',
        icon: Icons.sports_basketball,
        color: Colors.purple,
      ),
    ]);
  }

  void markAsRead(int id) {
    final index = notifications.indexWhere((item) => item.id == id);
    if (index != -1) {
      final item = notifications[index];
      item.isRead = true;
      notifications[index] = item;
      notifications.refresh();
    }
  }

  void markAllAsRead() {
    for (int i = 0; i < notifications.length; i++) {
      notifications[i].isRead = true;
    }
    notifications.refresh();
    Get.snackbar(
      'Notifikasi',
      'Semua notifikasi telah ditandai sebagai dibaca',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      margin: EdgeInsets.all(10),
      borderRadius: 10,
      duration: Duration(seconds: 1),
    );
  }

  Future<void> refreshNotifications() async {
    if (isRefreshing.value) return; // Prevent multiple refresh
    
    isRefreshing.value = true;
    
    // Simulasi delay untuk fetch data dari server
    await Future.delayed(Duration(seconds: 2));
    
    // Di sini Anda bisa menambahkan logic untuk fetch data terbaru dari server
    // Untuk contoh ini, kita reload data yang sudah ada
    final tempNotifications = List<NotificationItem>.from(notifications);
    notifications.clear();
    await Future.delayed(Duration(milliseconds: 100));
    notifications.addAll(tempNotifications);
    
    isRefreshing.value = false;
    
    Get.snackbar(
      'Berhasil',
      'Notifikasi berhasil diperbarui',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      margin: EdgeInsets.all(10),
      borderRadius: 10,
      duration: Duration(seconds: 1),
      icon: Icon(Icons.check_circle, color: Colors.white),
    );
  }

  void deleteAllNotifications() {
    Get.dialog(
      AlertDialog(
        title: Text('Hapus Semua Notifikasi'),
        content: Text('Apakah Anda yakin ingin menghapus semua notifikasi? Tindakan ini tidak dapat dibatalkan.'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('Batal'),
          ),
          TextButton(
            onPressed: () {
              notifications.clear();
              Get.back();
              Get.snackbar(
                'Berhasil',
                'Semua notifikasi telah dihapus',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.red,
                colorText: Colors.white,
                margin: EdgeInsets.all(10),
                borderRadius: 10,
                duration: Duration(seconds: 1),
              );
            },
            child: Text('Hapus', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  List<NotificationItem> get filteredNotifications {
    if (selectedFilter.value == 'Belum dibaca') {
      return notifications.where((item) => !item.isRead).toList();
    } else if (selectedFilter.value == 'Sudah dibaca') {
      return notifications.where((item) => item.isRead).toList();
    } else {
      return notifications;
    }
  }

  void changeFilter(String filter) {
    selectedFilter.value = filter;
  }
}

class NotificationItem {
  final int id;
  final String title;
  final String message;
  final String time;
  bool isRead;
  final String category;
  final IconData icon;
  final Color color;

  NotificationItem({
    required this.id,
    required this.title,
    required this.message,
    required this.time,
    required this.isRead,
    required this.category,
    required this.icon,
    required this.color,
  });
}