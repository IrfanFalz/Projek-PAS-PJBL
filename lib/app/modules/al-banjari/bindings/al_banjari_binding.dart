import 'package:get/get.dart';

import '../controllers/al_banjari_controller.dart';

class AlBanjariBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AlBanjariController>(
      () => AlBanjariController(),
    );
  }
}
