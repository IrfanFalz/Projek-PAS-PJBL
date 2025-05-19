import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/pendaftaran_controller.dart';

class PendaftaranView extends GetView<PendaftaranController> {
  const PendaftaranView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    
    // Daftar pilihan ekskul
    final List<String> daftarEkskul = [
      'Dewan Galang',
      'Paskibra',
      'Futsal',
      'Basket',
      'Voli',
      'PMR',
      'Tari',
      'Al banjari',
      'Karate',
      'Band'
    ];
    
    // Rxn untuk ekskul yang dipilih (tanggal lahir sudah dihapus)
    final Rxn<String> selectedEkskul = Rxn<String>();
    final RxBool isAgree = false.obs;
    
    // App color scheme
    const primaryColor = Color(0xFFE04E4E);
    const accentColor = Color(0xFFF8D9D9);
    const backgroundColor = Color(0xFFF9F9F9);
    
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          // Enhanced header with gradient and icon
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFFE04E4E), Color(0xFFD83030)],
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x40E04E4E),
                  blurRadius: 16,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            padding: EdgeInsets.fromLTRB(20, statusBarHeight + 16, 20, 20),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: const Icon(Icons.arrow_back, color: Colors.white),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pendaftaran',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.white.withOpacity(0.8),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Ekstrakurikuler',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Form content
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  
                  // Welcome message
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [accentColor, accentColor.withOpacity(0.7)],
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Selamat Datang!',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          'Lengkapi formulir pendaftaran dengan data yang benar untuk bergabung dengan ekstrakurikuler pilihan kamu.',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: const Color(0xFF555555),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  const SizedBox(height: 8),
                  
                  // Data Pribadi section
                  _buildSectionCard(
                    context: context,
                    title: 'Data Pribadi',
                    icon: Icons.person_outline_rounded,
                    iconColor: primaryColor,
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Name field
                        _buildTextField(
                          label: 'Nama Lengkap',
                          hint: 'Masukkan nama lengkap',
                          controller: controller.nameController,
                          primaryColor: primaryColor,
                          icon: Icons.badge_outlined,
                        ),
                        const SizedBox(height: 20),
                        
                        // Class field
                        _buildTextField(
                          label: 'Kelas',
                          hint: 'Contoh: XI IPA 1',
                          controller: controller.classController,
                          primaryColor: primaryColor,
                          icon: Icons.class_outlined,
                        ),
                        const SizedBox(height: 20),
                        
                        // NIS field (Menggantikan Tanggal Lahir)
                        _buildTextField(
                          label: 'NIS',
                          hint: 'Masukkan Nomor Induk Siswa',
                          controller: controller.nisController,
                          primaryColor: primaryColor,
                          icon: Icons.numbers_rounded,
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Kontak section
                  _buildSectionCard(
                    context: context,
                    title: 'Informasi Kontak',
                    icon: Icons.contact_phone_rounded,
                    iconColor: primaryColor,
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Phone field
                        _buildTextField(
                          label: 'Nomor HP',
                          hint: 'Contoh: 08123456789',
                          controller: controller.phoneController,
                          keyboardType: TextInputType.phone,
                          primaryColor: primaryColor,
                          icon: Icons.phone_rounded,
                        ),
                        const SizedBox(height: 20),
                        
                        // Email field
                        _buildTextField(
                          label: 'Email',
                          hint: 'Contoh: nama@email.com',
                          controller: controller.emailController,
                          keyboardType: TextInputType.emailAddress,
                          primaryColor: primaryColor,
                          icon: Icons.email_rounded,
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Ekstrakurikuler section
                  _buildSectionCard(
                    context: context,
                    title: 'Pilihan Ekstrakurikuler',
                    icon: Icons.sports_soccer_rounded,
                    iconColor: primaryColor,
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Ekskul dropdown
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildFieldLabel('Pilih Ekstrakurikuler'),
                            const SizedBox(height: 8),
                            Obx(() => Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: selectedEkskul.value != null 
                                    ? primaryColor.withOpacity(0.3) 
                                    : Colors.grey.shade300,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.03),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  hint: Text(
                                    'Pilih salah satu', 
                                    style: TextStyle(
                                      color: Colors.grey[400],
                                      fontSize: 15,
                                    ),
                                  ),
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: selectedEkskul.value != null 
                                      ? primaryColor 
                                      : Colors.grey[400],
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                  value: selectedEkskul.value,
                                  items: daftarEkskul.map((String ekskul) {
                                    return DropdownMenuItem<String>(
                                      value: ekskul,
                                      child: Row(
                                        children: [
                                          _getEkskulIcon(ekskul),
                                          const SizedBox(width: 12),
                                          Text(
                                            ekskul,
                                            style: const TextStyle(fontSize: 15),
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (String? value) {
                                    selectedEkskul.value = value;
                                  },
                                ),
                              ),
                            )),
                          ],
                        ),
                        const SizedBox(height: 20),
                        
                        // Reason field
                        _buildTextField(
                          label: 'Alasan Bergabung',
                          hint: 'Ceritakan alasan dan minat anda bergabung dengan ekstrakurikuler ini',
                          controller: controller.reasonController,
                          maxLines: 4,
                          primaryColor: primaryColor,
                          icon: Icons.description_rounded,
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Agreement section
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade200),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          blurRadius: 12,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Obx(() => CheckboxListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      controlAffinity: ListTileControlAffinity.leading,
                      title: Text(
                        'Saya menyatakan bahwa data yang diisi adalah benar dan saya bersedia mengikuti semua peraturan ekstrakurikuler',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[800],
                          height: 1.5,
                        ),
                      ),
                      checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      value: isAgree.value,
                      activeColor: primaryColor,
                      checkColor: Colors.white,
                      onChanged: (value) {
                        isAgree.value = value ?? false;
                      },
                    )),
                  ),
                  
                  const SizedBox(height: 32),
                  
                  // Submit button
                  Obx(() => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: double.infinity,
                    height: 54,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: isAgree.value && 
                                 selectedEkskul.value != null 
                        ? [
                            BoxShadow(
                              color: primaryColor.withOpacity(0.4),
                              blurRadius: 12,
                              offset: const Offset(0, 6),
                            ),
                          ]
                        : [],
                    ),
                    child: ElevatedButton(
                      onPressed: isAgree.value && 
                                 selectedEkskul.value != null 
                        ? () => _handleSubmit(selectedEkskul.value!, context)
                        : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                        disabledBackgroundColor: Colors.grey[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Kirim Pendaftaran',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ),
                  )),
                  
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleSubmit(String ekskul, BuildContext context) {
    // Validate form using controller's method
    controller.submitForm();
    
    // Show success modal
    _showSuccessModal(context);
  }
  
  void _showSuccessModal(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Gambar sukses - menggunakan Image.asset
                Container(
                  width: 120,
                  height: 120,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/icon-berhasil.png', // Pastikan file gambar sudah tersedia pada path ini
                    width: 100,
                    height: 100,
                  ),
                ),
                const SizedBox(height: 20),
                
                // Success text
                Text(
                  'Pendaftaran Berhasil!',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 65, 175, 70),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                
                Text(
                  'Data pendaftaran kamu telah berhasil dikirim dan akan segera diproses.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 30),
                
                // Back to home button
                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      // Close dialog and navigate to home
                      Navigator.of(context).pop();
                      
                      // Navigate to root route and clear stack
                      Get.until((route) => route.isFirst);
                      // Or refresh the current page
                      Get.forceAppUpdate();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE04E4E),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Kembali ke Beranda',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  
  // Helper function untuk mendapatkan icon ekskul
  Widget _getEkskulIcon(String ekskul) {
    IconData iconData;
    
    switch (ekskul) {
      case 'Dewan Galang':
        iconData = Icons.emoji_events_rounded;
        break;
      case 'Paskibra':
        iconData = Icons.flag_rounded;
        break;
      case 'Futsal':
        iconData = Icons.sports_soccer_rounded;
        break;
      case 'Basket':
        iconData = Icons.sports_basketball_rounded;
        break;
      case 'Voli':
        iconData = Icons.sports_volleyball_rounded;
        break;
      case 'PMR':
        iconData = Icons.medical_services_rounded;
        break;
      case 'Tari':
        iconData = Icons.theater_comedy_rounded;
        break;
      case 'Al banjari':
        iconData = Icons.library_music_rounded;
        break;
      case 'Karate':
        iconData = Icons.sports_martial_arts_rounded;
        break;
      case 'Band':
        iconData = Icons.music_note_rounded;
        break;
      default:
        iconData = Icons.extension_rounded;
    }
    
    return Icon(
      iconData,
      size: 20,
      color: const Color(0xFFE04E4E),
    );
  }

  // Helper function untuk label field
  Widget _buildFieldLabel(String label) {
    return Row(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: Color(0xFF333333),
          ),
        ),
        const SizedBox(width: 4),
        Container(
          width: 4,
          height: 4,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFFE04E4E),
          ),
        ),
      ],
    );
  }

  // Helper function untuk membuat card section
  Widget _buildSectionCard({
    required BuildContext context,
    required String title,
    required IconData icon,
    required Color iconColor,
    required Widget content,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.01),
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: iconColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: iconColor, size: 20),
                ),
                const SizedBox(width: 14),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF333333),
                  ),
                ),
              ],
            ),
          ),
          
          // Divider
          Divider(color: Colors.grey.shade100, height: 1),
          
          // Content
          Padding(
            padding: const EdgeInsets.all(20),
            child: content,
          ),
        ],
      ),
    );
  }

  // Helper function untuk membuat text field
  Widget _buildTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
    required Color primaryColor,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
    IconData? icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldLabel(label),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          style: const TextStyle(fontSize: 15),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: Colors.grey[400],
              fontSize: 15,
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: maxLines > 1 ? 16 : 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: primaryColor),
            ),
            prefixIcon: icon != null
                ? Icon(icon, color: primaryColor, size: 20)
                : null,
            prefixIconConstraints: const BoxConstraints(
              minWidth: 50,
              minHeight: 0,
            ),
            suffixIcon: controller.text.isNotEmpty
                ? Icon(Icons.check_circle_rounded, color: primaryColor, size: 20)
                : null,
            isDense: true,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red),
            ),
          ),
        ),
      ],
    );
  }
}