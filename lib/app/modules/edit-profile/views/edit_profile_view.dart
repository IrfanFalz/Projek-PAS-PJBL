import 'dart:io'; // Add this import for File class

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});

  void _showImagePickerModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Pilih dari Galeri'),
                onTap: () {
                  controller.pickImage(ImageSource.gallery);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Ambil Foto dengan Kamera'),
                onTap: () {
                  controller.pickImage(ImageSource.camera);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.close),
                title: const Text('Tutup'),
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubah Profil'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: controller.saveChanges,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: () => _showImagePickerModal(context),
              child: Obx(() {
                final imagePath = controller.profileImage.value;
                return CircleAvatar(
                  radius: 50,
                  backgroundImage: imagePath != null
                      ? FileImage(File(imagePath))
                      : const AssetImage('assets/default_profile.png') as ImageProvider,
                  child: imagePath == null
                      ? const Icon(Icons.camera_alt, size: 40)
                      : null,
                );
              }),
            ),
            const SizedBox(height: 24),
            _buildTextField(
              label: 'Nama Lengkap',
              onChanged: controller.updateFullName,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              label: 'Kota asal',
              onChanged: controller.updateHometown,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              label: 'Kelas',
              onChanged: controller.updateClass,
            ),
            const SizedBox(height: 16),
            _buildGenderSelector(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required Function(String) onChanged,
  }) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        fillColor: Colors.grey[100],
      ),
      onChanged: onChanged,
    );
  }

  Widget _buildGenderSelector() {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Jenis Kelamin',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: ChoiceChip(
                  label: const Text('Pria'),
                  selected: controller.gender.value == 'male',
                  onSelected: (selected) {
                    controller.updateGender(selected ? 'male' : '');
                  },
                  selectedColor: Colors.blue[200],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ChoiceChip(
                  label: const Text('Wanita'),
                  selected: controller.gender.value == 'female',
                  onSelected: (selected) {
                    controller.updateGender(selected ? 'female' : '');
                  },
                  selectedColor: Colors.pink[200],
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}