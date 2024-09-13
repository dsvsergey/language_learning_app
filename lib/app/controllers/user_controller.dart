import 'package:get/get.dart';

class AuthController extends GetxController {
  final emailError = RxString('');
  final passwordError = RxString('');

  void login(String email, String password) {
    emailError.value = '';
    passwordError.value = '';

    // Проста валідація
    if (email.isEmpty) {
      emailError.value = 'Введіть email';
    } else if (!GetUtils.isEmail(email)) {
      emailError.value = 'Невірний формат email';
    }

    if (password.isEmpty) {
      passwordError.value = 'Введіть пароль';
    } else if (password.length < 6) {
      passwordError.value = 'Пароль має бути не менше 6 символів';
    }

    // Якщо немає помилок, виконуємо вхід
    if (emailError.isEmpty && passwordError.isEmpty) {
      // TODO: Реалізувати логіку входу
      Get.offNamed('/home');
    }
  }
}
