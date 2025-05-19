import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'navigation_controller.dart';

class CustomBottomNavBar extends StatelessWidget {
  // Current page index is passed to highlight the active icon
  final int currentIndex;
  
  const CustomBottomNavBar({
    Key? key,
    required this.currentIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Cek apakah NavigationController sudah terdaftar
    if (!Get.isRegistered<NavigationController>()) {
      // Jika belum, buat instance baru
      Get.put(NavigationController(), permanent: true);
    }
    
    // Get the NavigationController instance
    final NavigationController controller = Get.find<NavigationController>();
    
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, -1),
          ),
        ],
      ),
      child: Obx(() => BottomNavigationBar(
        currentIndex: controller.currentIndex.value,
        onTap: controller.changePage,
        selectedItemColor: Colors.red.shade400,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        unselectedLabelStyle: TextStyle(fontSize: 12),
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.house_outlined),
            activeIcon: Icon(Icons.house),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events_outlined),
            activeIcon: Icon(Icons.emoji_events),
            label: 'Prestasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo_library_outlined),
            activeIcon: Icon(Icons.photo_library),
            label: 'Galeri',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            activeIcon: Icon(Icons.account_circle),
            label: 'Profil',
          ),
        ],
      )),
    );
  }
}