import 'package:flutter/material.dart';
import 'package:get/get.dart';


class WelcomeController extends GetxController with GetSingleTickerProviderStateMixin {
  // Animasi untuk tampilan welcome screen
  late AnimationController _animationController;
  late Animation<double> fadeAnimation;
  late Animation<Offset> offsetAnimation;
  
  // Variable untuk animasi hover efek
  final loginButtonScale = 1.0.obs;
  final registerButtonScale = 1.0.obs;

  @override
  void onInit() {
    super.onInit();
    
    // Inisialisasi controller animasi
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );

    // Animasi fadeIn
    fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.0, 0.5, curve: Curves.easeOut),
    ));

    // Animasi slide up
    offsetAnimation = Tween<Offset>(
      begin: Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.3, 1.0, curve: Curves.easeOutQuint),
    ));

    // Jalankan animasi ketika halaman pertama kali dimuat
    _animationController.forward();
  }

  // Navigasi ke halaman login 
  void goToLogin() {
    Get.toNamed('/login');
  }

  // Navigasi ke halaman register
  void goToRegister() {
    Get.toNamed('/register');
  }

  // Fungsi untuk animasi hover pada tombol login
  void onLoginButtonHover(bool isHovering) {
    loginButtonScale.value = isHovering ? 1.05 : 1.0;
  }

  // Fungsi untuk animasi hover pada tombol register
  void onRegisterButtonHover(bool isHovering) {
    registerButtonScale.value = isHovering ? 1.05 : 1.0;
  }

  @override
  void onClose() {
    _animationController.dispose();
    super.onClose();
  }
}