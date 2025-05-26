import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profil_controller.dart';
import '../../../../custom_bottom_navbar.dart';

class ProfilView extends GetView<ProfilController> {
  const ProfilView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header dengan foto profil
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 60, 20, 25),
              decoration: const BoxDecoration(
                color: Color(0xFFE04E4E),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage('assets/default.png'),
                    backgroundColor: Colors.white,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    controller.userName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    controller.userClass,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    controller.userEmail,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            // Konten utama
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  // Info singkat dengan informasi yang diperbarui
                  _buildInfoCard(),
                  const SizedBox(height: 20),

                  // Daftar ekstrakurikuler
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Ekstrakurikuler yang Diikuti',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildEkstraList(),
                  const SizedBox(height: 20),

                  // Menu pengaturan yang diperluas
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Menu Akun',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildMenuList(),
                  const SizedBox(height: 20), // Tambahkan space di bawah
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 3),
    );
  }

  Widget _buildInfoCard() {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey[200]!, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildInfoItem('3', 'Jumlah Ekskul'),
            _buildInfoItem('Laki-laki', 'Jenis Kelamin'),
            _buildInfoItem('X RPL B', 'Kelas'),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildEkstraList() {
    return Column(
      children: [
        _buildEkstraItem('Futsal', 'Kamis', Icons.sports_soccer),
        _buildEkstraItem('Band', 'Jumat', Icons.music_note),
        _buildEkstraItem('Basket', 'Selasa', Icons.sports_basketball),
      ],
    );
  }

  Widget _buildEkstraItem(String title, String schedule, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFFE04E4E)),
        title: Text(title),
        subtitle: Text(schedule),
      ),
    );
  }

  Widget _buildMenuList() {
    return Column(
      children: [
        // Kategori Akun
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.edit, color: Colors.blue),
                title: const Text('Edit Profil'),
                subtitle: const Text('Ubah informasi pribadi'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: controller.onEditProfileTap,
              ),
              const Divider(height: 1, indent: 16, endIndent: 16),
              ListTile(
                leading: const Icon(Icons.lock, color: Colors.orange),
                title: const Text('Ubah Password'),
                subtitle: const Text('Ganti password akun'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: controller.showChangePasswordModal,
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),

        // Kategori Pengaturan
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.settings, color: Colors.grey),
                title: const Text('Pengaturan'),
                subtitle: const Text('Preferensi aplikasi'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: controller.onSettingsTap,
              ),
              const Divider(height: 1, indent: 16, endIndent: 16),
              ListTile(
                leading: const Icon(Icons.notifications, color: Colors.purple),
                title: const Text('Notifikasi'),
                subtitle: const Text('Kelola notifikasi'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: controller.onNotificationsTap,
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),

        // Kategori Bantuan
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.help_outline, color: Colors.green),
                title: const Text('Bantuan'),
                subtitle: const Text('FAQ dan panduan'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: controller.onHelpTap,
              ),
              const Divider(height: 1, indent: 16, endIndent: 16),
              ListTile(
                leading: const Icon(Icons.info_outline, color: Colors.cyan),
                title: const Text('Tentang Aplikasi'),
                subtitle: const Text('Informasi aplikasi'),
                trailing: const Text(
                  'V 1.1.0',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: controller.onAboutTap,
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),

        // Logout
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text('Logout', style: TextStyle(color: Colors.red)),
            subtitle: const Text('Keluar dari akun'),
            onTap: controller.showLogoutConfirmation,
          ),
        ),
      ],
    );
  }
}