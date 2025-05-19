import 'package:get/get.dart';

import '../controllers/futsal_controller.dart';

class FutsalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FutsalController>(
      () => FutsalController(),
    );
  }
}
