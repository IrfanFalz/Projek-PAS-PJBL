import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController logoController;
  late Animation<double> logoAnimation;

  late AnimationController imageController;
  late Animation<Offset> imageAnimation;

  @override
  void onInit() {
    super.onInit();

    logoController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );
    logoAnimation = CurvedAnimation(
      parent: logoController,
      curve: Curves.easeInOutBack,
    );

    imageController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    imageAnimation = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: imageController,
      curve: Curves.easeOutCubic,
    ));

    logoController.forward();
    imageController.forward();

    // Navigasi ke welcome page setelah delay 3 detik
    Future.delayed(Duration(seconds: 3), () {
      Get.offNamed(Routes.WELCOME);
    });
  }

  @override
  void onClose() {
    logoController.dispose();
    imageController.dispose();
    super.onClose();
  }
}