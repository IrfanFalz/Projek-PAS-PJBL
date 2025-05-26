import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          'Pengaturan',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        backgroundColor: Color(0xffE04E4E),
        foregroundColor: Colors.white,
        elevation: 0.5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Notifikasi Section
            _buildSectionHeader('Notifikasi'),
            _buildSettingsCard([
              Obx(() => _buildSwitchTile(
                    'Notifikasi Ekstrakurikuler',
                    'Terima notifikasi untuk kegiatan ekstrakurikuler',
                    controller.ekskulNotif.value,
                    (value) => controller.toggleEkskulNotif(value),
                    Icons.school,
                  )),
              const Divider(height: 1),
              Obx(() => _buildSwitchTile(
                    'Notifikasi Kegiatan',
                    'Terima notifikasi untuk kegiatan dan acara',
                    controller.kegiatanNotif.value,
                    (value) => controller.toggleKegiatanNotif(value),
                    Icons.event,
                  )),
              const Divider(height: 1),
              Obx(() => _buildSwitchTile(
                    'Notifikasi Pengumuman',
                    'Terima notifikasi untuk pengumuman penting',
                    controller.pengumumanNotif.value,
                    (value) => controller.togglePengumumanNotif(value),
                    Icons.campaign,
                  )),
              const Divider(height: 1),
              Obx(() => _buildSwitchTile(
                    'Suara Notifikasi',
                    'Aktifkan suara untuk notifikasi',
                    controller.soundNotif.value,
                    (value) => controller.toggleSoundNotif(value),
                    Icons.volume_up,
                  )),
            ]),

            const SizedBox(height: 24),

            // Tampilan Section
            _buildSectionHeader('Tampilan'),
            _buildSettingsCard([
              _buildTappableTile(
                'Bahasa',
                'Indonesia',
                Icons.language,
                () => controller.showLanguageModal(),
              ),
              const Divider(height: 1),
              Obx(() => _buildSwitchTile(
                    'Mode Gelap',
                    'Aktifkan tema gelap',
                    controller.darkMode.value,
                    (value) => controller.toggleDarkMode(value),
                    Icons.dark_mode,
                  )),
            ]),

            const SizedBox(height: 24),

            // Aplikasi Section
            _buildSectionHeader('Aplikasi'),
            _buildSettingsCard([
              _buildTappableTile(
                'Kebijakan Privasi',
                'Baca kebijakan privasi kami',
                Icons.privacy_tip_outlined,
                () => controller.showPrivacyPolicy(),
              ),
            ]),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.grey[700],
        ),
      ),
    );
  }

  Widget _buildSettingsCard(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  Widget _buildSwitchTile(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: Colors.blue[600],
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Switch.adaptive(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.blue[600],
          ),
        ],
      ),
    );
  }

  Widget _buildTappableTile(
    String title,
    String subtitle,
    IconData icon,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: Colors.grey[600],
                size: 20,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: Colors.grey[400],
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}