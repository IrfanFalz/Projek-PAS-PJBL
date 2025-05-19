import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/welcome_controller.dart';
import '../../../routes/app_pages.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double buttonHeight = 60;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: FadeTransition(
          opacity: controller.fadeAnimation,
          child: SlideTransition(
            position: controller.offsetAnimation,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Spacer untuk mendorong konten ke bawah (lebih ke tengah)
                  SizedBox(height: screenHeight * 0.07),
                  // Area gambar di tengah
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/logokedua.png',
                      width: screenWidth * 0.98,
                      fit: BoxFit.contain,
                    ),
                  ),

                  SizedBox(height: 0), // Tambahkan jarak kecil antara gambar dan teks

                  // Tulisan "Selamat Datang"
                  Text(
                    'Selamat Datang',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  
                  // Spacer untuk mendorong tombol ke bawah layar
                  Spacer(),
                  SizedBox(height: 15),
                  
                  // Tombol Masuk dengan animasi hover
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    onEnter: (_) => controller.onLoginButtonHover(true),
                    onExit: (_) => controller.onLoginButtonHover(false),
                    child: Obx(() => Transform.scale(
                      scale: controller.loginButtonScale.value,
                      child: Container(
                        width: screenWidth * 0.85,
                        height: buttonHeight,
                        child: ElevatedButton(
                          onPressed: controller.goToLogin,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFE04E4E),
                            foregroundColor: Colors.white,
                            textStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 12),
                            elevation: 3,
                          ),
                          child: Text('Masuk'),
                        ),
                      ),
                    )),
                  ),
                  
                  SizedBox(height: 16), // Jarak antar tombol
                  
                  // Tombol Daftar dengan animasi hover
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    onEnter: (_) => controller.onRegisterButtonHover(true),
                    onExit: (_) => controller.onRegisterButtonHover(false),
                    child: Obx(() => Transform.scale(
                      scale: controller.registerButtonScale.value,
                      child: Container(
                        width: screenWidth * 0.85,
                        height: buttonHeight,
                        child: OutlinedButton(
                          onPressed: controller.goToRegister,
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Color(0xFFE04E4E),
                            textStyle: TextStyle(
                              fontFamily: '',
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 12),
                            side: BorderSide(color: Color(0xFFE04E4E), width: 1.5),
                          ),
                          child: Text('Daftar'),
                        ),
                      ),
                    )),
                  ),
                  
                  // Ruang kosong di bawah untuk padding
                  SizedBox(height: screenHeight * 0.15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}