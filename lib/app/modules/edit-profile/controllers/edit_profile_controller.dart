// edit_profile_controller.dart
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {
  final fullName = ''.obs;
  final hometown = ''.obs;
  final studentClass = ''.obs;
  final gender = ''.obs; // 'male' or 'female'
  final profileImage = Rxn<String>();

  void updateFullName(String value) => fullName.value = value;
  void updateHometown(String value) => hometown.value = value;
  void updateClass(String value) => studentClass.value = value;
  void updateGender(String value) => gender.value = value;

  Future<void> pickImage(ImageSource source) async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: source);
      if (pickedFile != null) {
        profileImage.value = pickedFile.path;
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image: ${e.toString()}');
    }
  }

  void saveChanges() {
    // Here you would typically save to your backend/database
    // For now, we'll just navigate back
    Get.back(); // This will return to the profile page
  }
}