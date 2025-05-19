import 'package:get/get.dart';

import '../controllers/dewan_galang_controller.dart';

class DewanGalangBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DewanGalangController>(
      () => DewanGalangController(),
    );
  }
}
