import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

class NavigationController extends GetxController {
  // Current active page index
  var currentIndex = 0.obs;
  
  // Page routes corresponding to bottom nav items
  final List<String> pages = [
    Routes.HOME,
    Routes.PRESTASI,
    Routes.GALERI,
    Routes.PROFIL,
  ];
  
  // Change page based on index
  void changePage(int index) {
    // First update the index
    currentIndex.value = index;
    
    // Then navigate to the corresponding page
    Get.offAllNamed(pages[index]);
  }
  
  // Set current index without navigation (used when page is opened directly)
  void setIndex(int index) {
    currentIndex.value = index;
  }
}