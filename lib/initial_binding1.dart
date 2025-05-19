import 'package:get/get.dart';
import 'navigation_controller.dart';

class Initialbdg implements Bindings {
  @override
  void dependencies() {
    // Inisialisasi NavigationController sebagai singleton
    Get.put(NavigationController(), permanent: true);
  }
}