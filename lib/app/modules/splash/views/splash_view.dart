import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            // Memindahkan logo ke atas dengan menggunakan Transform
            child: Transform.translate(
              offset: Offset(0, -40), // Pindahkan ke atas 40 pixel
              child: ScaleTransition(
                scale: controller.logoAnimation,
                child: Image.asset(
                  'assets/group92.png', // Gambar logo
                  width: 250,
                  height: 100,
                ),
              ),
            ),
          ),
          // GAMBAR muncul dari bawah
          Align(
            alignment: Alignment.bottomCenter,
            child: SlideTransition(
              position: controller.imageAnimation,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Image.asset(
                  'assets/spenda1.png',
                  width: 230,
                  height: 200,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}