import 'package:get/get.dart';

import '../controllers/paskibra_controller.dart';

class PaskibraBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaskibraController>(
      () => PaskibraController(),
    );
  }
}
