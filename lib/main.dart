// main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'initial_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GoEkskul',
      initialBinding: InitialBinding(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFFE04E4E),
        fontFamily: 'Montserrat', // Font default untuk seluruh aplikasi
        
        // Konfigurasi TextTheme untuk berbagai jenis teks
        textTheme: const TextTheme(
          // Untuk judul besar (headline)
          displayLarge: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 24.0,
            fontWeight: FontWeight.w700, // Bold
            color: Color(0xFF333333),
          ),
          // Untuk sub judul
          titleLarge: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 20.0,
            fontWeight: FontWeight.w600, // SemiBold
            color: Color(0xFF333333),
          ),
          // Untuk judul kecil
          titleMedium: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 16.0,
            fontWeight: FontWeight.w500, // Medium
            color: Color(0xFF333333),
          ),
          // Untuk deskripsi
          bodyLarge: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 16.0,
            fontWeight: FontWeight.w400, // Regular
            color: Color(0xFF666666),
          ),
          // Untuk deskripsi yang lebih kecil
          bodyMedium: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 14.0,
            fontWeight: FontWeight.w400, // Regular
            color: Color(0xFF666666),
          ),
          // Untuk caption atau teks kecil
          bodySmall: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 12.0,
            fontWeight: FontWeight.w400, // Regular
            color: Color(0xFF888888),
          ),
        ),
        
        // Optional: AppBarTheme jika ingin menyesuaikan AppBar
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 18.0,
            fontWeight: FontWeight.w600, // SemiBold
            color: Colors.white,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL, // Tetap memulai dari rute awal (SplashScreen)
      getPages: AppPages.routes,
      defaultTransition: Transition.fadeIn, // <-- Semua navigasi pakai fadeIn
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}