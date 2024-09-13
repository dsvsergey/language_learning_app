import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/models/user_model.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  final Rx<User> user = User(
    id: '1',
    username: 'Байда Вишневецький',
    email: 'username@gmail.com',
    subscriptionRenewalDate: '20.05.2024',
    hasActiveSubscription: true,
    freeLessonsCount: 7,
  ).obs;

  final RxString appLanguage = 'Українська'.obs;

  final Rx<File?> profileImage = Rx<File?>(null);

  void changePassword() {
    // TODO: Реалізувати логіку зміни пароля
    debugPrint('Відкрито екран зміни пароля');
  }

  void toggleNotifications() {
    // TODO: Реалізувати логіку вмикання/вимикання нотифікацій
    debugPrint('Змінено налаштування нотифікацій');
  }

  void inviteFriends() {
    // TODO: Реалізувати логіку запрошення друзів
    debugPrint('Відкрито екран запрошення друів');
  }

  void showLegalInformation() {
    // TODO: Реалізувати відображення правової інформації
    debugPrint('Відображено правову інформацію');
  }

  void changeAppLanguage(String language) {
    appLanguage.value = language;
    // TODO: Реалізувати логіку зміни мови додатку
    debugPrint('Мову додатку змінено на $language');
  }

  void updateUserProfile(Map<String, dynamic> newData) {
    user.update((val) {
      if (val != null) {
        val.username.value = newData['username'] ?? val.username.value;
        val.email.value = newData['email'] ?? val.email.value;
        val.profileImageUrl.value =
            newData['profile_image_url'] ?? val.profileImageUrl.value;
        val.subscriptionRenewalDate.value =
            newData['subscription_renewal_date'] ??
                val.subscriptionRenewalDate.value;
        val.hasActiveSubscription.value = newData['has_active_subscription'] ??
            val.hasActiveSubscription.value;
        val.freeLessonsCount.value =
            newData['free_lessons_count'] ?? val.freeLessonsCount.value;
      }
    });
  }

  Future<void> changeProfilePhoto() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);

      if (image != null) {
        profileImage.value = File(image.path);
        debugPrint('Image path: ${image.path}');
        update();
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
      Get.snackbar('Error', 'Failed to pick image. Please try again.');
    }
  }

  void editProfile() {
    _showEditProfileDialog();
  }

  void _showEditProfileDialog() {
    final TextEditingController nameController =
        TextEditingController(text: user.value.username.value);
    final TextEditingController emailController =
        TextEditingController(text: user.value.email.value);

    Get.dialog(
      AlertDialog(
        title: const Text('Редагувати профіль'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Ім'я"),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
          ],
        ),
        actions: [
          TextButton(
            child: const Text('Скасувати',
                style: TextStyle(color: Color(0xFFFF8733))),
            onPressed: () => Get.back(),
          ),
          TextButton(
            child: const Text('Зберегти',
                style: TextStyle(color: Color(0xFFFF8733))),
            onPressed: () {
              updateUserProfile({
                'username': nameController.text,
                'email': emailController.text,
              });
              Get.back();
            },
          ),
        ],
      ),
    );
  }

  // Метод для завантаження даних користувача
  Future<void> loadUserData() async {
    // TODO: Реалізувати завантаження даних користувача з API або локального сховища
    debugPrint('Завантаження даних користувача');
    // Тут буде код для отримання даних користувача
    // Після отримання даних, оновіть об'єкт user
  }

  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }
}
