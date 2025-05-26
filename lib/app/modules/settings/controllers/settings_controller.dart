import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
  // Notifikasi Settings
  final RxBool ekskulNotif = true.obs;
  final RxBool kegiatanNotif = true.obs;
  final RxBool pengumumanNotif = true.obs;
  final RxBool soundNotif = true.obs;

  // Tampilan Settings
  final RxBool darkMode = false.obs;
  final RxString selectedLanguage = 'Indonesia'.obs;

  // Methods untuk toggle notifikasi
  void toggleEkskulNotif(bool value) {
    ekskulNotif.value = value;
    Get.snackbar(
      'Pengaturan Tersimpan',
      value 
        ? 'Notifikasi ekstrakurikuler diaktifkan'
        : 'Notifikasi ekstrakurikuler dinonaktifkan',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 1),
      backgroundColor: Colors.green[100],
      colorText: Colors.green[800],
      icon: Icon(
        value ? Icons.notifications_active : Icons.notifications_off,
        color: Colors.green[600],
      ),
    );
  }

  void toggleKegiatanNotif(bool value) {
    kegiatanNotif.value = value;
    Get.snackbar(
      'Pengaturan Tersimpan',
      value 
        ? 'Notifikasi kegiatan diaktifkan'
        : 'Notifikasi kegiatan dinonaktifkan',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 1),
      backgroundColor: Colors.green[100],
      colorText: Colors.green[800],
      icon: Icon(
        value ? Icons.notifications_active : Icons.notifications_off,
        color: Colors.green[600],
      ),
    );
  }

  void togglePengumumanNotif(bool value) {
    pengumumanNotif.value = value;
    Get.snackbar(
      'Pengaturan Tersimpan',
      value 
        ? 'Notifikasi pengumuman diaktifkan'
        : 'Notifikasi pengumuman dinonaktifkan',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 1),
      backgroundColor: Colors.green[100],
      colorText: Colors.green[800],
      icon: Icon(
        value ? Icons.notifications_active : Icons.notifications_off,
        color: Colors.green[600],
      ),
    );
  }

  void toggleSoundNotif(bool value) {
    soundNotif.value = value;
    Get.snackbar(
      'Pengaturan Tersimpan',
      value 
        ? 'Suara notifikasi diaktifkan'
        : 'Suara notifikasi dinonaktifkan',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 1),
      backgroundColor: Colors.green[100],
      colorText: Colors.green[800],
      icon: Icon(
        value ? Icons.volume_up : Icons.volume_off,
        color: Colors.green[600],
      ),
    );
  }

  // Method untuk toggle dark mode (hanya tampilan)
  void toggleDarkMode(bool value) {
    darkMode.value = value;
    Get.snackbar(
      'Mode Tampilan',
      value ? 'Mode gelap diaktifkan' : 'Mode terang diaktifkan',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 1),
      backgroundColor: value ? Colors.grey[800] : Colors.grey[100],
      colorText: value ? Colors.white : Colors.grey[800],
      icon: Icon(
        value ? Icons.dark_mode : Icons.light_mode,
        color: value ? Colors.white : Colors.grey[600],
      ),
    );
  }

  // Method untuk menampilkan modal bahasa
  void showLanguageModal() {
    Get.bottomSheet(
      Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Pilih Bahasa',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildLanguageOption('Indonesia', 'id'),
            _buildLanguageOption('English', 'en'),
            _buildLanguageOption('العربية', 'ar'),
            const SizedBox(height: 20),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  Widget _buildLanguageOption(String language, String code) {
    return Obx(() => ListTile(
      title: Text(language),
      trailing: selectedLanguage.value == language 
        ? Icon(Icons.check, color: Colors.blue[600])
        : null,
      onTap: () {
        selectedLanguage.value = language;
        Get.back();
        Get.snackbar(
          'Bahasa Diubah',
          'Bahasa aplikasi diubah ke $language',
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 1),
          backgroundColor: Colors.blue[100],
          colorText: Colors.blue[800],
          icon: Icon(Icons.language, color: Colors.blue[600]),
        );
      },
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
    ));
  }

  // Method untuk menampilkan dialog tentang aplikasi
  void showAboutDialog() {
    Get.dialog(
      AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.info_outline, color: Colors.blue),
            SizedBox(width: 8),
            Text('Tentang Aplikasi'),
          ],
        ),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Aplikasi Ekstrakurikuler Siswa'),
            SizedBox(height: 8),
            Text('Versi: 1.0.0'),
            SizedBox(height: 8),
            Text('Dikembangkan untuk memudahkan siswa dalam mengikuti kegiatan ekstrakurikuler sekolah.'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Tutup'),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  // Method untuk menampilkan dialog bantuan
  void showHelpDialog() {
    Get.dialog(
      AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.help_outline, color: Colors.orange),
            SizedBox(width: 8),
            Text('Bantuan & Dukungan'),
          ],
        ),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Butuh bantuan?'),
            SizedBox(height: 12),
            Text('• Email: support@ekskulapp.com'),
            Text('• WhatsApp: +62 812-3456-7890'),
            Text('• Website: www.ekskulapp.com'),
            SizedBox(height: 12),
            Text('Tim kami siap membantu Anda 24/7!'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Tutup'),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  // Method untuk menampilkan kebijakan privasi
  void showPrivacyPolicy() {
    Get.dialog(
      AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.privacy_tip_outlined, color: Colors.green),
            SizedBox(width: 8),
            Text('Kebijakan Privasi'),
          ],
        ),
        content: const SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Privasi Anda Penting Bagi Kami'),
              SizedBox(height: 12),
              Text('Kami berkomitmen melindungi data pribadi Anda:'),
              SizedBox(height: 8),
              Text('• Data hanya digunakan untuk fungsi aplikasi'),
              Text('• Tidak dibagikan kepada pihak ketiga'),
              Text('• Tersimpan dengan aman dan terenkripsi'),
              Text('• Anda dapat menghapus data kapan saja'),
              SizedBox(height: 12),
              Text('Untuk informasi lengkap, kunjungi website kami.'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Tutup'),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  @override
  void onInit() {
    super.onInit();
    // Inisialisasi pengaturan default
    loadSettings();
  }

  // Method untuk memuat pengaturan (simulasi)
  void loadSettings() {
    // Di sini nanti bisa ditambahkan logic untuk load dari storage
    // Untuk sekarang menggunakan nilai default
  }

  // Method untuk menyimpan pengaturan (simulasi)
  void saveSettings() {
    // Di sini nanti bisa ditambahkan logic untuk save ke storage
    // Untuk sekarang hanya menampilkan snackbar
    Get.snackbar(
      'Tersimpan',
      'Pengaturan berhasil disimpan',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.green[100],
      colorText: Colors.green[800],
    );
  }
}