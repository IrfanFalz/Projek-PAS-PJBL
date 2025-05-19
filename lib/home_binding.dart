import 'package:get/get.dart';
import 'app/modules/home/controllers/home_controller.dart';
import 'navigation_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    // Pastikan NavigationController sudah terinisialisasi
    if (!Get.isRegistered<NavigationController>()) {
      Get.put(NavigationController(), permanent: true);
    }
    
    // Inisialisasi HomeController
    Get.lazyPut<HomeController>(() => HomeController());
  }
}