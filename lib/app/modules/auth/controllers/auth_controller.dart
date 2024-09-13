import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final emailError = RxString('');
  final passwordError = RxString('');

  void login() {
    // Очищаємо попередні помилки
    emailError.value = '';
    passwordError.value = '';

    // Виконуємо базову валідацію
    if (emailController.text.isEmpty) {
      emailError.value = 'Введіть email';
    } else if (!GetUtils.isEmail(emailController.text)) {
      emailError.value = 'Невірний формат email';
    }

    if (passwordController.text.isEmpty) {
      passwordError.value = 'Введіть пароль';
    } else if (passwordController.text.length < 6) {
      passwordError.value = 'Пароль має бути не менше 6 символів';
    }

    // Якщо немає помилок, виконуємо вхід
    if (emailError.isEmpty && passwordError.isEmpty) {
      // TODO: Реалізувати реальну логіку входу
      debugPrint('Вхід виконано успішно');
      Get.offNamed('/home');
    }
  }

  void loginWithFacebook() {
    // TODO: Реалізувати вхід через Facebook
    debugPrint('Вхід через Facebook');
  }

  void loginWithGoogle() {
    // TODO: Реалізувати вхід через Google
    debugPrint('Вхід через Google');
  }

  void forgotPassword() {
    // TODO: Реалізувати відновлення пароля
    debugPrint('Відновлення пароля');
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
