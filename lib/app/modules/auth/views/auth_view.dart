import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/assets.dart';
import '../controllers/auth_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(242, 243, 250, 1),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 21),
                          const Text(
                            'Вхід',
                            style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0,
                            ),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            'Привіт! Раді знову тебе бачити.',
                            style: TextStyle(
                              color: Color.fromRGBO(174, 151, 138, 1),
                              fontFamily: 'SF Pro Display',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              height: 19 / 16,
                              letterSpacing: 0,
                            ),
                          ),
                          const SizedBox(height: 40),
                          _buildTextField(
                            controller: controller.emailController,
                            hint: 'username@mail.com',
                            errorText: controller.emailError,
                            prefixIconData: Icons.alternate_email,
                          ),
                          const SizedBox(height: 16),
                          _buildTextField(
                            controller: controller.passwordController,
                            hint: '**********',
                            obscureText: true,
                            errorText: controller.passwordError,
                            prefixIconData: Icons.lock,
                          ),
                          const SizedBox(height: 33),
                          ElevatedButton(
                            onPressed: controller.login,
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color(0xFFFF8733), // #FF8733
                              minimumSize: const Size(double.infinity, 56),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                            ),
                            child: const Text(
                              'Увійти',
                              style: TextStyle(
                                fontFamily: 'SF Pro Display',
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                height: 26.25 / 22,
                                color: Colors.white, // #FFFFFF
                              ),
                            ),
                          ),
                          const SizedBox(height: 50),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: const Color(0xFFC7C7C7),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                child: Text(
                                  'або',
                                  style: TextStyle(
                                    color: Color(0xFFC7C7C7),
                                    fontFamily: 'SF Pro Display',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  height: 1,
                                  color: const Color(0xFFC7C7C7),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 50),
                          _buildSocialButton(
                            onPressed: controller.loginWithFacebook,
                            text: 'Увійти через Facebook',
                            backgroundColor: const Color(0xFF1877F2),
                            textColor: Colors.white,
                            iconAsset: Assets.resourceImagesFacebookLogo,
                            fontFamily: 'Helvetica',
                            fontWeight: FontWeight.w700,
                          ),
                          const SizedBox(height: 24),
                          _buildSocialButton(
                            onPressed: controller.loginWithGoogle,
                            text: 'Увійти через Google',
                            backgroundColor: Colors.white,
                            textColor: const Color(0x8A000000), // #0000008A
                            iconAsset: Assets.resourceImagesGoogleLogo,
                            fontFamily: 'Helvetica',
                            fontWeight: FontWeight.w700,
                          ),
                          const SizedBox(height: 70),
                          Align(
                            alignment: Alignment.topCenter,
                            child: TextButton(
                              onPressed: controller.forgotPassword,
                              child: const Text(
                                'Забув пароль?',
                                style: TextStyle(
                                  fontFamily: 'SF Pro Display',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  height: 19.09 /
                                      16, // line-height в Flutter задається як відношення до fontSize
                                  color: Color(0xFF3A89FD), // #3A89FD
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Center(
                            child: TextButton(
                              onPressed: () {
                                // TODO: Навігація на екран реєстрації
                              },
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Не маєте акаунту? ',
                                    style: TextStyle(
                                      color: Color.fromRGBO(174, 151, 138, 1),
                                      fontFamily: 'SF Pro Display',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      height: 19 / 16,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                  Text(
                                    'Створити безкоштовно',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    bool obscureText = false,
    required RxString errorText,
    IconData? prefixIconData,
  }) {
    return Obx(() {
      final hasError = errorText.isNotEmpty;
      final borderColor = hasError
          ? const Color.fromRGBO(253, 17, 17, 1)
          : const Color(0xFFC7C7C7);
      final iconColor =
          hasError ? const Color.fromRGBO(253, 17, 17, 1) : Colors.grey;

      return TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hint,
          errorText: hasError ? errorText.value : null,
          errorStyle: const TextStyle(
            fontFamily: 'SF Pro Display',
            fontSize: 16,
            fontWeight: FontWeight.w400,
            height: 19.09 / 16,
          ),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: borderColor, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: borderColor, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: borderColor, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: borderColor, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: borderColor, width: 1),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          prefixIcon: prefixIconData != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 16, right: 8),
                  child: Icon(
                    prefixIconData,
                    color: iconColor,
                    size: 20,
                  ),
                )
              : null,
          prefixIconConstraints:
              const BoxConstraints(minWidth: 0, minHeight: 0),
        ),
      );
    });
  }

  Widget _buildSocialButton({
    required VoidCallback onPressed,
    required String text,
    required Color backgroundColor,
    required Color textColor,
    required String iconAsset,
    required String fontFamily,
    required FontWeight fontWeight,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        minimumSize: const Size(396, 54),
        padding: const EdgeInsets.symmetric(horizontal: 50.5),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            iconAsset,
            height: 24,
            width: 24,
          ),
          const SizedBox(width: 15),
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontFamily: fontFamily,
              fontSize: 20,
              fontWeight: fontWeight,
              height: 23 / 20,
            ),
          ),
        ],
      ),
    );
  }
}
