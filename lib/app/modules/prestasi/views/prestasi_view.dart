import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/prestasi_controller.dart';
import '../../../../custom_bottom_navbar.dart';
import '../../../../navigation_controller.dart';

// View Prestasi
class PrestasiView extends StatelessWidget {
  PrestasiView({Key? key}) : super(key: key);

  final PrestasiController controller = Get.put(PrestasiController());

  // New method to build the prestasi header
  Widget _buildPrestasiHeader() {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFE04E4E), Colors.red.shade700],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.emoji_events, color: Colors.amber, size: 32),
              SizedBox(width: 12),
              Text(
                "Prestasi Sekolah",
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildStatItem("${controller.getTotalPrestasi()}", "Total Prestasi", Icons.stars),
              _buildStatItem("${controller.ekstrakurikulerList.length}", "Ekstrakurikuler", Icons.group),
              Obx(() {
                final topEkskul = controller.getEkskulPrestasiTerbanyak();
                return _buildStatItem(topEkskul?.nama ?? "-", "Terbanyak", Icons.emoji_events_outlined);
              }),
            ],
          ),
        ],
      ),
    );
  }

  // New method to build stat items
  Widget _buildStatItem(String value, String label, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.amber[200], size: 24),
        SizedBox(height: 8),
        Text(value, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
        Text(label, style: TextStyle(color: Colors.white70, fontSize: 12)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Prestasi Ekstrakurikuler",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFFE04E4E),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(color: Color(0xFFE04E4E)),
          );
        }

        if (controller.ekstrakurikulerList.isEmpty) {
          return const Center(
            child: Text("Tidak ada data ekstrakurikuler yang tersedia"),
          );
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPrestasiHeader(),
              _buildEkstrakurikulerSelector(),
              controller.selectedEkstrakurikuler.value == null
                  ? const Padding(
                      padding: EdgeInsets.all(16),
                      child: Text("Pilih ekstrakurikuler untuk melihat prestasi"),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Text(
                            "Tentang ${controller.selectedEkstrakurikuler.value!.nama}",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                          child: Text(
                            controller.selectedEkstrakurikuler.value!.deskripsi,
                            style: const TextStyle(fontSize: 14, color: Colors.black54),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: const [
                              Icon(Icons.emoji_events, color: Colors.amber),
                              SizedBox(width: 8),
                              Text(
                                "Prestasi yang Telah Diraih",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (controller.selectedEkstrakurikuler.value!.prestasi.isEmpty)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              "Belum ada prestasi untuk ${controller.selectedEkstrakurikuler.value!.nama}",
                              style: const TextStyle(color: Colors.grey),
                            ),
                          )
                        else
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: controller.selectedEkstrakurikuler.value!.prestasi.length,
                            itemBuilder: (context, index) {
                              final prestasi = controller.selectedEkstrakurikuler.value!.prestasi[index];
                              return _buildPrestasiCard(prestasi);
                            },
                          ),
                      ],
                    ),
            ],
          ),
        );
      }),
      bottomNavigationBar: CustomBottomNavBar(currentIndex: 1),
    );
  }

  Widget _buildEkstrakurikulerSelector() {
    return Container(
      height: 120,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemCount: controller.ekstrakurikulerList.length,
        itemBuilder: (context, index) {
          final ekskul = controller.ekstrakurikulerList[index];
          return Obx(() {
            final isSelected = controller.selectedEkstrakurikuler.value?.id == ekskul.id;
            return GestureDetector(
              onTap: () => controller.selectEkstrakurikuler(ekskul),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 8),
                width: 100,
                decoration: BoxDecoration(
                  color: isSelected ? Color(0xFFE0964E) : Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 5, offset: Offset(0, 2)),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.white : Colors.grey[100],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        _getIconForEkskul(ekskul.nama),
                        color: isSelected ? Color(0xffB03030) : Colors.grey[700],
                        size: 28,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      ekskul.nama,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black87,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "${ekskul.prestasi.length} Prestasi",
                      style: TextStyle(
                        color: isSelected ? Colors.white70 : Colors.grey,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        },
      ),
    );
  }

  Widget _buildPrestasiCard(prestasi) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
            ),
            child: prestasi.gambar != null && prestasi.gambar.isNotEmpty
              ? Image.asset(
                  prestasi.gambar, 
                  fit: BoxFit.cover, 
                  errorBuilder: (context, error, stackTrace) {
                    return Center(child: Icon(Icons.photo, size: 50, color: Colors.grey[400]));
                  }
                )
              : Center(child: Icon(Icons.photo, size: 50, color: Colors.grey[400])),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(color: Colors.amber[100], borderRadius: BorderRadius.circular(20)),
                      child: Text(_formatDate(prestasi.tanggal),
                        style: TextStyle(color: Colors.amber[800], fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Text(prestasi.judul,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                ),
                SizedBox(height: 8),
                Text(prestasi.deskripsi,
                  style: TextStyle(fontSize: 14, color: Colors.black54, height: 1.5),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        Get.dialog(_buildDetailDialog(prestasi));
                      },
                      icon: Icon(Icons.remove_red_eye, size: 16),
                      label: Text("Lihat Detail"),
                      style: TextButton.styleFrom(foregroundColor: Colors.indigo),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailDialog(prestasi) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                ),
                child: prestasi.gambar != null && prestasi.gambar.isNotEmpty
                  ? Image.asset(
                      prestasi.gambar, 
                      fit: BoxFit.cover, 
                      errorBuilder: (context, error, stackTrace) {
                        return Center(child: Icon(Icons.photo, size: 64, color: Colors.grey[400]));
                      }
                    )
                  : Center(child: Icon(Icons.photo, size: 64, color: Colors.grey[400])),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.close),
                  color: Colors.white,
                  style: IconButton.styleFrom(backgroundColor: Colors.black38),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(prestasi.judul, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                    SizedBox(width: 8),
                    Text(_formatDate(prestasi.tanggal, isLong: true), style: TextStyle(color: Colors.grey[600])),
                  ],
                ),
                SizedBox(height: 16),
                Text("Deskripsi", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text(prestasi.deskripsi, style: TextStyle(fontSize: 14, height: 1.5)),
                SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date, {bool isLong = false}) {
    final monthsShort = ["Jan", "Feb", "Mar", "Apr", "Mei", "Jun", "Jul", "Agu", "Sep", "Okt", "Nov", "Des"];
    final monthsLong = ["Januari", "Februari", "Maret", "April", "Mei", "Juni", "Juli", "Agustus", "September", "Oktober", "November", "Desember"];
    final day = date.day.toString().padLeft(2, '0');
    final month = isLong ? monthsLong[date.month - 1] : monthsShort[date.month - 1];
    return "$day $month ${date.year}";
  }

  IconData _getIconForEkskul(String nama) {
    switch (nama.toLowerCase()) {
      case "futsal":
        return Icons.sports_soccer;
      case "palang merah remaja":
        return Icons.medical_services;
      case "paskibra":
        return Icons.flag;
      case "dewan galang":
        return Icons.supervised_user_circle;
      case "basket":
        return Icons.sports_basketball;
      case "voli":
        return Icons.sports_volleyball;
      case "band":
        return Icons.music_note;
      case "karate":
        return Icons.sports_martial_arts;
      case "al banjari":
        return Icons.mosque;
      case "tari":
        return Icons.theater_comedy;
      default:
        return Icons.extension;
    }
  }
}