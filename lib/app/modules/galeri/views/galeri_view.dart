import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/galeri_controller.dart';
import '../../../../custom_bottom_navbar.dart';

class GaleriView extends GetView<GaleriController> {
  const GaleriView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Galeri Ekstrakurikuler',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false, // <= RATA KIRI
        backgroundColor: Get.theme.primaryColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return _buildLoadingShimmer();
              } else if (controller.getFilteredItems().isEmpty) {
                return _buildEmptyState();
              } else {
                return _buildGaleriGrid(context);
              }
            }),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(currentIndex: 2),
    );
  }

  Widget _buildGaleriGrid(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(() => GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: controller.getFilteredItems().length,
        itemBuilder: (context, index) {
          final item = controller.getFilteredItems()[index];

          return GestureDetector(
            onTap: () {
              _showImagesGalleryModal(context, item);
            },
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Gambar
                  Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                        image: DecorationImage(
                          image: AssetImage(item.thumbnailImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  // Informasi
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 4),
                          Text(
                            item.date,
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      )),
    );
  }

  void _showImagesGalleryModal(BuildContext context, GaleriItem item) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Close', // <-- WAJIB ADA!
      barrierColor: Colors.black87,
      transitionDuration: Duration(milliseconds: 200),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Stack(
          children: [
            // Image Carousel
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Title
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      item.title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // Image Carousel
                  Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: PageView.builder(
                      itemCount: item.imageAssets.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          child: Image.asset(
                            item.imageAssets[index],
                            fit: BoxFit.contain,
                          ),
                        );
                      },
                    ),
                  ),
                  // Image Counter
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      '${item.imageAssets.length} Foto',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Close Button
            Positioned(
              top: 40,
              right: 20,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.7),
                  radius: 20,
                  child: Icon(Icons.close, color: Colors.white),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildLoadingShimmer() {
    return GridView.builder(
      padding: EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: 6,
      itemBuilder: (_, __) => Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: Colors.grey.shade300,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.grey.shade300, Colors.grey.shade100],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/empty_gallery.png',
            height: 150,
          ),
          SizedBox(height: 16),
          Text(
            'Tidak ada foto galeri.',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}