import 'package:get/get.dart';

import '../controllers/voli_controller.dart';

class VoliBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VoliController>(
      () => VoliController(),
    );
  }
}
