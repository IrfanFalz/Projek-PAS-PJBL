import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2B384B),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
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
                // Hero animation for icon
                Hero(
                  tag: 'authIcon',
                  child: Icon(
                    Icons.app_registration_rounded,
                    size: 70,
                    color: Color(0xFF2B384B),
                  ),
                ),
                const SizedBox(height: 15),
                // AnimatedContainer untuk judul
                AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  child: const Text(
                    "Daftar",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                // Form fields dengan stagger animation
                _buildStaggeredFormFields(),
                const SizedBox(height: 25),
                // Button dengan animasi
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
                        Get.toNamed(Routes.LOGIN);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF2B384B),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 5,
                      ),
                      child: const Text(
                        "DAFTAR",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(224, 255, 255, 255),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Link dengan animasi fadeIn
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0.0, end: 1.0),
                  duration: Duration(milliseconds: 700),
                  builder: (context, value, child) {
                    return Opacity(
                      opacity: value,
                      child: child,
                    );
                  },
                  child: GestureDetector(
                    onTap: () => Get.toNamed(Routes.LOGIN),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: "Sudah punya akun? ",
                            style: TextStyle(color: Colors.black54),
                          ),
                          TextSpan(
                            text: "Masuk",
                            style: TextStyle(
                              color: Color(0xFF2B384B),
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  // Helper method untuk membuat form fields dengan staggered animation
  Widget _buildStaggeredFormFields() {
    return Column(
      children: [
        _buildAnimatedTextField(
          200, 
          TextField(
            decoration: InputDecoration(
              labelText: "Username",
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
        ),
        const SizedBox(height: 15),
        _buildAnimatedTextField(
          300, 
          TextField(
            decoration: InputDecoration(
              labelText: "Email",
              prefixIcon: const Icon(Icons.email),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.red.shade400, width: 2),
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        _buildAnimatedTextField(
          400, 
          TextField(
            decoration: InputDecoration(
              labelText: "Nomor Telepon",
              prefixIcon: const Icon(Icons.phone),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.red.shade400, width: 2),
              ),
            ),
            keyboardType: TextInputType.phone,
          ),
        ),
        const SizedBox(height: 15),
        _buildAnimatedTextField(
          500, 
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
        ),
      ],
    );
  }
  
  // Helper method untuk membuat form field dengan animasi
  Widget _buildAnimatedTextField(int delay, Widget child) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(milliseconds: delay),
      builder: (context, value, c) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, (1-value) * 20),
            child: child,
          ),
        );
      },
    );
  }
}