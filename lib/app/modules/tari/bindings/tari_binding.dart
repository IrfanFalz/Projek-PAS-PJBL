import 'package:get/get.dart';

import '../controllers/tari_controller.dart';

class TariBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TariController>(
      () => TariController(),
    );
  }
}
