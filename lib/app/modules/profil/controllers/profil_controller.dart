import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilController extends GetxController {
  // Data user
  final String userName = 'Irfan Fahri Lazuardi';
  final String userClass = 'X RPL B';
  final String userEmail = 'inicontoh12@gmail.com';
  
  // Ekstrakurikuler yang diikuti
  final List<Map<String, dynamic>> ekstrakurikuler = [
    {'nama': 'Futsal', 'jadwal': 'Kamis', 'icon': Icons.sports_soccer},
    {'nama': 'Band', 'jadwal': 'Jumat', 'icon': Icons.music_note},
    {'nama': 'Basket', 'jadwal': 'Selasa', 'icon': Icons.sports_basketball},
  ];
  
  // Jumlah ekstrakurikuler
  int get jumlahEkskul => ekstrakurikuler.length;
  
  // Jenis kelamin
  final String jenisKelamin = 'Laki-laki';
  
  // Status
  final String kelas = 'X RPL B';

  void onEditProfileTap() {
    Get.toNamed('/edit-profile'); // Navigasi ke halaman edit
  }

  void showLogoutConfirmation() {
    Get.dialog(
      AlertDialog(
        title: const Text('Konfirmasi Logout'),
        content: const Text('Yakin ingin keluar dari akun?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: logout,
            child: const Text('Logout', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void logout() {
    // Proses logout
    Get.offAllNamed('/login');
  }
}