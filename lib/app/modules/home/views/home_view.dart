import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../../../../custom_bottom_navbar.dart';
import '../../../../navigation_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Make sure the navigation controller knows we're on the Home page (index 0)
    final NavigationController navController = Get.find<NavigationController>();
    navController.setIndex(0); // Set index to Home (0)
    
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red.shade400,
        elevation: 0,
        toolbarHeight: 70,
        centerTitle: false,
        title: ScaleTransition(
          scale: controller.welcomeAnimation,
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              'Beranda',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22,
                fontFamily: 'roboto',
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, right: 5.0),
            child: IconButton(
              icon: Icon(Icons.notifications, color: Colors.white, size: 30),
              onPressed: () {
                // Navigate to the notification page
                Get.toNamed('/notification');
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            // Header profile section with animation
            _buildProfileHeader(),
            
            // Main content with cards
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Ekstrakurikuler Terpopuler section
                _buildPopularExtracurricular(),
                
                // Ekstrakurikuler Aktif section
                _buildActiveExtracurricular(),
                
                // Add bottom padding for better UX
                SizedBox(height: 16),
              ],
            ),
          ],
        ),
      ),
      // Add the custom bottom navigation bar
      bottomNavigationBar: CustomBottomNavBar(currentIndex: 0),
    );
  }

  // Profile header section
  Widget _buildProfileHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.red.shade400,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          // Profile information with animation
          ScaleTransition(
            scale: controller.welcomeAnimation,
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/default.png'),
                ),
                SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selamat Datang,',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      controller.username,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      controller.email,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Search bar - added new
          SizedBox(height: 15),
          _buildSearchBar(),
        ],
      ),
    );
  }

  // Animated search bar
  Widget _buildSearchBar() {
    return FadeTransition(
      opacity: controller.fadeAnimation,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: TextFormField(
          controller: controller.searchController,
          decoration: InputDecoration(
            hintText: 'Cari informasi...',
            hintStyle: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 16,
            ),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.red.shade400,
              size: 24,
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          ),
          onChanged: controller.updateSearchQuery,
          onFieldSubmitted: (value) {
            Get.snackbar(
              'Pencarian',
              'Mencari: $value',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red.shade400,
              colorText: Colors.white,
              margin: EdgeInsets.all(10),
              borderRadius: 10,
              duration: Duration(seconds: 1),
            );
          },
        ),
      ),
    );
  }

  // Ekstrakurikuler Terpopuler Section
  Widget _buildPopularExtracurricular() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
            child: Text(
              'Ekstrakurikuler Terpopuler',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 12),
              children: [
                _buildPopularExtracurricularItem(
                  'Futsal', 
                  'assets/slideshow.futsal.png',
                  Colors.green.shade600,
                  '/futsal' // Route name for futsal
                ),
                _buildPopularExtracurricularItem(
                  'Bola Voli', 
                  'assets/slideshow.voli.png',
                  Colors.blue.shade600,
                  '/voli' // Route name for volleyball
                ),
                _buildPopularExtracurricularItem(
                  'Bola Basket', 
                  'assets/slideshow.basket.png',
                  Colors.orange.shade600,
                  '/basket' // Route name for basketball
                ),
                _buildPopularExtracurricularItem(
                  'Dewan Galang', 
                  'assets/slideshow.dg.png',
                  Colors.brown.shade600,
                  '/dewan-galang' // Route name for dewan galang
                ),
                _buildPopularExtracurricularItem(
                  'Paskibra', 
                  'assets/slideshow.paski.png',
                  Color.fromARGB(255, 48, 84, 93),
                  '/paskibra' // Route name for paskibra
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Item for Popular Extracurricular with Image - UPDATED WITH NAVIGATION
  Widget _buildPopularExtracurricularItem(String title, String imagePath, Color color, String routeName) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: GestureDetector(
        onTap: () {
          // Navigate to specific extracurricular page
          Get.toNamed(routeName);
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            width: 200,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 3,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Stack(
              children: [
                // Image loading with error handling
                Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    // Fallback if image fails to load
                    return Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: color.withOpacity(0.3),
                      child: Center(
                        child: Icon(
                          title == 'Futsal' ? Icons.sports_soccer :
                          title == 'Bola Voli' ? Icons.sports_volleyball :
                          title == 'Bola Basket' ? Icons.sports_basketball :
                          title == 'Dewan Galang' ? Icons.supervised_user_circle :
                          title == 'Paskibra' ? Icons.flag :
                          Icons.groups,
                          size: 40,
                          color: color,
                        ),
                      ),
                    );
                  },
                ),
                // Title overlay
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
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

  // Ekstrakurikuler Aktif Section
  Widget _buildActiveExtracurricular() {
    final List<Map<String, dynamic>> activeClubs = [
      {
        'name': 'Dewan Galang',
        'icon': Icons.supervised_user_circle,
        'members': '64 anggota',
        'time': 'Sen - sab',
        'location': 'Lapangan utama'
      },
      {
        'name': 'Paskibra',
        'icon': Icons.flag,
        'members': '40 anggota',
        'time': 'Kamis',
        'location': 'Lapangan utama'
      },
      {
        'name': 'Futsal',
        'icon': Icons.sports_soccer,
        'members': '80 anggota',
        'time': 'Kamis',
        'location': 'Lapangan basket'
      },
      {
        'name': 'Basket',
        'icon': Icons.sports_basketball,
        'members': '50 anggota',
        'time': 'Selasa',
        'location': 'Lapangan basket'
      },
      {
        'name': 'Voli',
        'icon': Icons.sports_volleyball,
        'members': '40 anggota',
        'time': 'Selasa',
        'location': 'Lapangan voli'
      },
      {
        'name': 'Karate',
        'icon': Icons.sports_martial_arts,
        'members': '25 anggota',
        'time': 'Rab',
        'location': 'Lapangan Utama'
      },
      {
        'name': 'Palang Merah Remaja',
        'icon': Icons.medical_services,
        'members': '30 anggota',
        'time': 'Sen - Jum',
        'location': 'Ruang UKS'
      },
      {
        'name': 'Al Banjari',
        'icon': Icons.library_music,
        'members': '20 anggota',
        'time': 'kam',
        'location': 'Mushola'
      },
      {
        'name': 'Tari',
        'icon': Icons.theater_comedy,
        'members': '35 anggota',
        'time': 'Sel',
        'location': 'Aula'
      },
      {
        'name': 'Band',
        'icon': Icons.music_note,
        'members': '30 anggota',
        'time': 'Rab',
        'location': 'Ruang Musik'
      }
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ekstrakurikuler aktif',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 12),
          ...activeClubs.map((club) => _buildActiveExtracurricularItem(club)),
        ],
      ),
    );
  }

  // Item for Active Extracurricular List - UPDATED to handle overflow and navigation
  Widget _buildActiveExtracurricularItem(Map<String, dynamic> club) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: Colors.grey.shade200,
          child: Icon(
            club['icon'],
            color: Color(0xFF2B384B),
          ),
        ),
        title: Text(
          club['name'],
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.people, size: 14, color: Colors.grey.shade600),
                SizedBox(width: 4),
                Text(
                  club['members'],
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            SizedBox(height: 2),
            Row(
              children: [
                Icon(Icons.access_time, size: 14, color: Colors.grey.shade600),
                SizedBox(width: 4),
                Text(
                  club['time'],
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
            SizedBox(height: 2),
            Row(
              children: [
                Icon(Icons.location_on, size: 14, color: Colors.grey.shade600),
                SizedBox(width: 4),
                Expanded(
                  child: Text(
                    club['location'],
                    style: TextStyle(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ],
        ),
        trailing: Icon(Icons.chevron_right),
        onTap: () {
          final String routeName = '/${club['name'].toString().toLowerCase().replaceAll(' ', '-')}';
          Get.toNamed(routeName);
        },
      ),
    );
  }
}