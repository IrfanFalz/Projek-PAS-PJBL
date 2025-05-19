import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dewan_galang_controller.dart';

class DewanGalangView extends GetView<DewanGalangController> {
  const DewanGalangView({super.key});

  @override
  Widget build(BuildContext context) {
    // Get statusbar height to adjust padding correctly
    final statusBarHeight = MediaQuery.of(context).padding.top;
    
    return Scaffold(
      backgroundColor: Colors.grey[100],
      // Remove SafeArea and manage padding manually
      body: Column(
        children: [
          // Red header with back button and title with proper padding
          Container(
            width: double.infinity,
            color: const Color(0xFFE04E4E),
            // Add statusBarHeight to top padding to account for system status bar
            padding: EdgeInsets.fromLTRB(16, statusBarHeight + 12, 16, 16),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: const Icon(Icons.arrow_back, color: Colors.white),
                ),
                const SizedBox(width: 24),
                Text(
                  'Ekstrakurikuler',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          
          // Content area (scrollable)
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 50, 30, 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image and title section
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 5,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            ),
                            // Gunakan Image.asset bukan Image.network untuk gambar lokal
                            child: Image.asset(
                              'assets/1.png',
                              width: double.infinity,
                              height: 150,
                              fit: BoxFit.cover,
                              cacheWidth: 800, // Menambahkan cacheWidth
                              filterQuality: FilterQuality.medium, // Menambahkan filterQuality
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Dewan Galang',
                                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Organisasi pramuka untuk siswa tingkat penggalang. Kegiatan ini dirancang untuk membangun karakter kepemimpinan, keterampilan sosial, dan ikut serta dalam berbagai pelatihan seperti kemah, pioneering, hingga lomba pramuka.',
                                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    height: 1.5,
                                  ),
                                  textAlign: TextAlign.justify, 
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Details section in 2x2 grid
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      childAspectRatio: 2, // Make boxes smaller/wider
                      children: [
                        // Jadwal box
                        _buildInfoBox(
                          context: context,
                          icon: Icons.calendar_today,
                          iconColor: Colors.blue,
                          title: 'Jadwal',
                          value: 'Sen - Sab',
                        ),
                        
                        // Anggota box
                        _buildInfoBox(
                          context: context,
                          icon: Icons.people,
                          iconColor: Colors.green,
                          title: 'Anggota',
                          value: '64 siswa',
                        ),
                        
                        // Lokasi box
                        _buildInfoBox(
                          context: context,
                          icon: Icons.location_on,
                          iconColor: Colors.red,
                          title: 'Lokasi',
                          value: 'Lapangan sekolah',
                        ),
                        
                        // Pembimbing box
                        _buildInfoBox(
                          context: context,
                          icon: Icons.person,
                          iconColor: Colors.purple,
                          title: 'Pembimbing',
                          value: 'Bpk. Arya Kusuma',
                        ),
                      ],
                    ),

                    // Registration button
                    Padding(
                      padding: const EdgeInsets.only(top: 24, bottom: 16),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () => Get.toNamed('/pendaftaran'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFE04E4E),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            'Daftar Sekarang',
                            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  // Helper method to build each info box
  Widget _buildInfoBox({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required String title,
    required String value,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 18),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.visible,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}