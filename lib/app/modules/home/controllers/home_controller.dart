import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin {
  // User data
  final String username = 'Irfan Fahri Lazuardi';
  final String email = 'fahriirfan08@gmail.com';
  
  // Animation controllers
  late AnimationController _animationController;
  late Animation<double> welcomeAnimation;
  late Animation<double> fadeAnimation;
  late Animation<Offset> slideAnimation;
  
  // Search controller - New
  final TextEditingController searchController = TextEditingController();
  final RxString searchQuery = ''.obs;
  
  // For bottom navbar
  var activeMenuIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    
    // Setup animations
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1200),
    );
    
    welcomeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.0, 0.5, curve: Curves.easeOut),
    );
    
    fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.3, 0.8, curve: Curves.easeIn),
    );
    
    slideAnimation = Tween<Offset>(
      begin: Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.3, 0.8, curve: Curves.easeOut),
    ));
    
    // Start the animation
    _animationController.forward();
  }

  @override
  void onClose() {
    _animationController.dispose();
    searchController.dispose(); // Don't forget to dispose the search controller
    super.onClose();
  }

  // Change the active menu in bottom navigation
  void changeActiveMenu(int index) {
    activeMenuIndex.value = index;
  }
  
  // Update search query - New
  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }
}