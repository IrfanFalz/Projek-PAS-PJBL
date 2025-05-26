import 'package:get/get.dart';

import '../controllers/palang_merah_remaja_controller.dart';

class PalangMerahRemajaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PalangMerahRemajaController>(
      () => PalangMerahRemajaController(),
    );
  }
}
