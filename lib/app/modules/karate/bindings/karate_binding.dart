import 'package:get/get.dart';

import '../controllers/karate_controller.dart';

class KarateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<KarateController>(
      () => KarateController(),
    );
  }
}
