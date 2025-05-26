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
  
  // Form controllers untuk ubah password
  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  
  // Observable untuk password visibility
  final RxBool isCurrentPasswordVisible = false.obs;
  final RxBool isNewPasswordVisible = false.obs;
  final RxBool isConfirmPasswordVisible = false.obs;
  
  // Loading state
  final RxBool isLoading = false.obs;
  
  // Jumlah ekstrakurikuler
  int get jumlahEkskul => ekstrakurikuler.length;
  
  // Jenis kelamin
  final String jenisKelamin = 'Laki-laki';
  
  // Status
  final String kelas = 'X RPL B';

  @override
  void onClose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }

  void onEditProfileTap() {
    Get.toNamed('/edit-profile'); // Navigasi ke halaman edit
  }

  void onSettingsTap() {
    Get.toNamed('/settings'); // Navigasi ke halaman settings
  }

  void onNotificationsTap() {
    Get.toNamed('/notification'); // Navigasi ke halaman notifikasi
  }

  void onHelpTap() {
    Get.toNamed('/help'); // Navigasi ke halaman bantuan
  }

  void onAboutTap() {
    Get.toNamed('/about'); // Navigasi ke halaman tentang aplikasi
  }

  void showChangePasswordModal() {
    // Reset form
    currentPasswordController.clear();
    newPasswordController.clear();
    confirmPasswordController.clear();
    isCurrentPasswordVisible.value = false;
    isNewPasswordVisible.value = false;
    isConfirmPasswordVisible.value = false;

    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Ubah Password',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: const Icon(Icons.close),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Form fields
              Obx(() => _buildPasswordField(
                controller: currentPasswordController,
                label: 'Password Saat Ini',
                isVisible: isCurrentPasswordVisible,
                onVisibilityToggle: () => isCurrentPasswordVisible.toggle(),
              )),
              const SizedBox(height: 15),

              Obx(() => _buildPasswordField(
                controller: newPasswordController,
                label: 'Password Baru',
                isVisible: isNewPasswordVisible,
                onVisibilityToggle: () => isNewPasswordVisible.toggle(),
              )),
              const SizedBox(height: 15),

              Obx(() => _buildPasswordField(
                controller: confirmPasswordController,
                label: 'Konfirmasi Password Baru',
                isVisible: isConfirmPasswordVisible,
                onVisibilityToggle: () => isConfirmPasswordVisible.toggle(),
              )),
              const SizedBox(height: 25),

              // Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Get.back(),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text('Batal'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Obx(() => ElevatedButton(
                      onPressed: isLoading.value ? null : changePassword,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE04E4E),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: isLoading.value
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            )
                          : const Text('Simpan'),
                    )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String label,
    required RxBool isVisible,
    required VoidCallback onVisibilityToggle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          obscureText: !isVisible.value,
          decoration: InputDecoration(
            hintText: 'Masukkan $label',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFE04E4E)),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                isVisible.value ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey[600],
              ),
              onPressed: onVisibilityToggle,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          ),
        ),
      ],
    );
  }

  void changePassword() async {
    // Validasi input
    if (currentPasswordController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Password saat ini tidak boleh kosong',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    if (newPasswordController.text.isEmpty) {
      Get.snackbar(
        'Error',
        'Password baru tidak boleh kosong',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    if (newPasswordController.text.length < 6) {
      Get.snackbar(
        'Error',
        'Password baru minimal 6 karakter',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    if (newPasswordController.text != confirmPasswordController.text) {
      Get.snackbar(
        'Error',
        'Konfirmasi password tidak cocok',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    try {
      isLoading.value = true;
      
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));
      
      // Simulasi proses ubah password berhasil
      Get.back(); // Tutup modal
      Get.snackbar(
        'Berhasil',
        'Password berhasil diubah',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      
    } catch (e) {
      Get.snackbar(
        'Error',
        'Gagal mengubah password. Silakan coba lagi.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void showLogoutConfirmation() {
    Get.dialog(
      AlertDialog(
        title: const Text('Konfirmasi Logout'),
        content: const Text('Yakin ingin keluar dari akun?'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
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