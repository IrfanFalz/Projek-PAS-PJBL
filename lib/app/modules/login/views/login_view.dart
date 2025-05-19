import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade400,
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Hero widget untuk animasi transisi icon
              Hero(
                tag: 'authIcon',
                child: Icon(
                  Icons.lock_open_rounded,
                  size: 70,
                  color: Colors.red.shade400,
                ),
              ),
              const SizedBox(height: 15),
              // AnimatedContainer untuk animasi judul
              AnimatedContainer(
                duration: Duration(milliseconds: 400),
                child: const Text(
                  "Masuk",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              // TweenAnimationBuilder untuk form fields
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: Duration(milliseconds: 500),
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Transform.translate(
                      offset: Offset(0, (1-value) * 20),
                      child: child,
                    ),
                  );
                },
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        labelText: "Username / Email",
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.red.shade400, width: 2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: const Icon(Icons.visibility_off),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.red.shade400, width: 2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              // TweenAnimationBuilder untuk button
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: Duration(milliseconds: 600),
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: Transform.translate(
                      offset: Offset(0, (1-value) * 30),
                      child: child,
                    ),
                  );
                },
                child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        // Menampilkan loading animation sebelum navigasi
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return Center(
                              child: Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      width: 40,
                                      height: 40,
                                      child: CircularProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.red.shade400,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    Text(
                                      "Memproses...",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                        
                        // Simulasi proses login dengan delay
                        Future.delayed(Duration(seconds: 2), () {
                          // Tutup dialog loading
                          Navigator.of(context).pop();
                          
                          // Tampilkan snackbar sukses login
                          Get.snackbar(
                            "Berhasil",
                            "Login sukses! Selamat datang kembali.",
                            backgroundColor: Colors.green.shade600,
                            colorText: Colors.white,
                            snackPosition: SnackPosition.TOP,
                            margin: EdgeInsets.all(15),
                            borderRadius: 10,
                            duration: Duration(seconds:1 ),
                            icon: Icon(Icons.check_circle, color: Colors.white),
                          );
                          
                          // Navigasi ke HOME dengan animasi
                          Future.delayed(Duration(milliseconds: 500), () {
                            Get.offAllNamed(Routes.HOME);
                          });
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade400,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 5,
                      ),
                      child: const Text(
                        "MASUK",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(224, 255, 255, 255),
                        ),
                      ),
                    ),
                  ),
              ),
              const SizedBox(height: 15),
              // TweenAnimationBuilder untuk link options
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: Duration(milliseconds: 700),
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value,
                    child: child,
                  );
                },
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.RESET_PASSWORD);
                      },
                      child: Text(
                        "Lupa Password?",
                        style: TextStyle(
                          color: Colors.red.shade400,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.REGISTER),
                      child: RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: "Belum punya akun? ",
                              style: TextStyle(color: Colors.black54),
                            ),
                            TextSpan(
                              text: "Daftar",
                              style: TextStyle(
                                color: Colors.red.shade400,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}