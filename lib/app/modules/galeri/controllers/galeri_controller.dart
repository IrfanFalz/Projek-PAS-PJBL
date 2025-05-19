import 'package:get/get.dart';

class GaleriController extends GetxController {
  final RxList<GaleriItem> galeriItems = <GaleriItem>[].obs;
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchGaleriItems();
  }

  void fetchGaleriItems() {
    isLoading.value = true;

    Future.delayed(Duration(milliseconds: 800), () {
      galeriItems.value = [
        GaleriItem(
          id: 1,
          title: 'Sparing Tim Basket Putri dengan SMP Neger 1',
          description: 'Kegiatan latihan rutin tim basket putra SMA Harapan Bangsa',
          imageAssets: [
            'assets/basket-detail.png',
            'assets/basket 2.png',
            'assets/basket1 1.png',
          ],
          thumbnailImage: 'assets/basket-detail.png',
          date: '8 Januari 2025',
        ),
        GaleriItem(
          id: 2,
          title: 'Upacara Hari Pramuka ',
          description: 'Penampilan tari tradisional pada acara pentas seni tahunan',
          imageAssets: [
            'assets/upacara.dg.png',
            'assets/slideshow.dg.png',
          ],
          thumbnailImage: 'assets/upacara.dg.png',
          date: '25 November 2024',
        ),
        GaleriItem(
          id: 3,
          title: 'Sparing Tim Futsal dengan SMP Negeri 50',
          description: 'Tim robotik meraih juara 2 di kompetisi nasional',
          imageAssets: [
            'assets/slideshow.futsal.png',
            'assets/futsal-detail.png',
          ],
          thumbnailImage: 'assets/slideshow.futsal.png',
          date: '15 Maret 2025',
        ),
        GaleriItem(
          id: 4,
          title: 'Panmpilan Ekstra tari pada pekan pakar',
          description: 'Rapat kerja pengurus OSIS periode 2025/2026',
          imageAssets: [
            'assets/tari.galeri.png',
            'assets/ekstra-tari.jpg',
          ],
          thumbnailImage: 'assets/tari.galeri.png',
          date: '23 Desember 2024',
        ),
        GaleriItem(
          id: 5,
          title: 'JUARA 2 MULA LPKBB JURAGAN 2 ',
          description: 'Tim futsal sekolah bertanding di turnamen antar SMA',
          imageAssets: [
            'assets/slideshow.paski.png',
            'assets/berita dempo cup 1 (1).png',
          ],
          thumbnailImage: 'assets/slideshow.paski.png',
          date: '20 Januari 2025',
        ),
        GaleriItem(
          id: 6,
          title: 'Kemenangan tim futsal sekolah',
          description: 'Latihan paduan suara untuk acara ulang tahun sekolah',
          imageAssets: [
            'assets/default.png',
            'assets/default.png',
          ],
          thumbnailImage: 'assets/default.png',
          date: '12 Februari 2025',
        ),
      ];

      isLoading.value = false;
    });
  }

  List<GaleriItem> getFilteredItems() {
    return galeriItems;
  }
}

class GaleriItem {
  final int id;
  final String title;
  final String description;
  final List<String> imageAssets;  // Multiple images
  final String thumbnailImage;     // Image for thumbnail in grid
  final String date;

  GaleriItem({
    required this.id,
    required this.title,
    required this.description,
    required this.imageAssets,
    required this.thumbnailImage,
    required this.date,
  });
}