import 'package:get/get.dart';

import '../controllers/band_controller.dart';

class BandBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BandController>(
      () => BandController(),
    );
  }
}
