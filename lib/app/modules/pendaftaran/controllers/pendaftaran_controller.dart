import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PendaftaranController extends GetxController {
  // Text controllers for form fields
  final nameController = TextEditingController();
  final classController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final reasonController = TextEditingController();
  final nisController = TextEditingController(); // Tambahkan controller untuk NIS
  
  // Form validation state
  final isFormValid = false.obs;
  
  @override
  void onInit() {
    super.onInit();
    // Add listeners to validate form when text changes
    nameController.addListener(validateForm);
    classController.addListener(validateForm);
    phoneController.addListener(validateForm);
    emailController.addListener(validateForm);
    nisController.addListener(validateForm); // Tambahkan listener untuk NIS
  }
  
  @override
  void onClose() {
    // Dispose controllers to prevent memory leaks
    nameController.dispose();
    classController.dispose();
    phoneController.dispose();
    emailController.dispose();
    reasonController.dispose();
    nisController.dispose(); // Dispose NIS controller
    super.onClose();
  }
  
  // Validate the form
  void validateForm() {
    isFormValid.value = 
        nameController.text.isNotEmpty &&
        classController.text.isNotEmpty &&
        phoneController.text.isNotEmpty &&
        GetUtils.isPhoneNumber(phoneController.text) &&
        emailController.text.isNotEmpty &&
        GetUtils.isEmail(emailController.text) &&
        nisController.text.isNotEmpty; // Tambahkan validasi untuk NIS
  }
  
  // Submit the form
  void submitForm() {
    if (nameController.text.isEmpty ||
        classController.text.isEmpty ||
        phoneController.text.isEmpty ||
        emailController.text.isEmpty ||
        nisController.text.isEmpty) { // Tambahkan validasi untuk NIS
      Get.snackbar(
        'Error',
        'Semua field harus diisi',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    
    if (!GetUtils.isEmail(emailController.text)) {
      Get.snackbar(
        'Error',
        'Email tidak valid',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    
    if (!GetUtils.isPhoneNumber(phoneController.text)) {
      Get.snackbar(
        'Error',
        'Nomor telepon tidak valid',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    
    // Validasi NIS (tambahkan sesuai kebutuhan)
    if (nisController.text.length < 5) { // Contoh: minimal 5 digit
      Get.snackbar(
        'Error',
        'NIS tidak valid (minimal 5 digit)',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }
    
    // If all validations pass, show success message
    Get.snackbar(
      'Sukses',
      'Pendaftaran berhasil dikirim',
      backgroundColor: Colors.green,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
    
    // You can add your API call here to submit the form data
    
    // Navigate back after a short delay
    Future.delayed(const Duration(seconds: 1), () {
      Get.back();
    });
  }
}