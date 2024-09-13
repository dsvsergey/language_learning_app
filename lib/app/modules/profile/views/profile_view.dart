import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/constants/assets.dart';
import '../../auth/views/auth_view.dart';
import '../../auth/controllers/auth_controller.dart';
import '../../widgets/svg_icon.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(242, 243, 250, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildProfileCard(),
                const SizedBox(height: 20),
                _buildSettingsSection(),
                const SizedBox(height: 20),
                _buildLegalInformation(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(155, 155, 155, 0.14),
            offset: Offset(0, 2),
            blurRadius: 7,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.edit, color: Color(0xFFFF8733)),
                onPressed: controller.editProfile,
              ),
              IconButton(
                icon: const Icon(Icons.logout, color: Color(0xFFFF8733)),
                onPressed: () {
                  // Реєструємо AuthController перед навігацією
                  Get.put(AuthController());
                  // Переходимо до AuthView
                  Get.offAll(() => AuthView());
                },
              )
            ],
          ),
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Obx(() => CircleAvatar(
                    radius: 60,
                    backgroundImage: controller.profileImage.value != null
                        ? FileImage(controller.profileImage.value!)
                        : null,
                    child: controller.profileImage.value == null
                        ? SvgPicture.asset(
                            Assets.resourceImagesAvatar,
                            fit: BoxFit.cover,
                          )
                        : null,
                  )),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.camera_alt, color: Color(0xFFFF8733)),
                  onPressed: controller.changeProfilePhoto,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Obx(() => Text(
                controller.user.value.username.value,
                style: const TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  height: 28.64 / 24,
                  color: Color(0xFF4E4E4E),
                ),
              )),
          const SizedBox(height: 8),
          Obx(() => Text(
                controller.user.value.email.value,
                style: const TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 19.09 / 16,
                  color: Color(0xFF793708),
                ),
              )),
          const SizedBox(height: 28),
          Obx(() => Text(
                'Наступне поновлення підписки ${controller.user.value.subscriptionRenewalDate.value}',
                style: const TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 19.09 / 16,
                  color: Color(0xFFA0A0A0),
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildSettingsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSettingItem(
          title: 'Мова застосунку',
          trailing: Obx(() => Text(
                controller.appLanguage.value,
                style: const TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  height: 19.09 / 16, // line-height / font-size
                  color: Color(0xFF4E4E4E),
                ),
                textAlign: TextAlign.right,
              )),
          onTap: () {
            // TODO: Відкрити діалог вибору мови
          },
        ),
        const SizedBox(height: 8),
        _buildSettingItem(
          title: 'Змінити пароль',
          onTap: controller.changePassword,
        ),
        const SizedBox(height: 8),
        _buildSettingItem(
          title: 'Нотіфікації',
          onTap: () {},
        ),
        const SizedBox(height: 8),
        _buildSettingItem(
          title: 'Запросити друзів',
          onTap: controller.inviteFriends,
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildSettingItem({
    required String title,
    Widget? trailing,
    required VoidCallback onTap,
  }) {
    return Container(
      width: 396,
      height: 56,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'SF Pro Display',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  height: 21.48 / 18,
                  color: Color(0xFF793708),
                ),
              ),
              const Spacer(),
              if (trailing != null) ...[trailing, const SizedBox(width: 8)],
              const SvgIcon(
                  assetName: Assets.resourceImagesRightChevrone,
                  height: 24,
                  color: Color(0xFFFF8733))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLegalInformation() {
    return Align(
      alignment: Alignment.centerLeft,
      child: GestureDetector(
        onTap: controller.showLegalInformation,
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: Text(
            'Правова інформація',
            style: TextStyle(
              fontFamily: 'SF Pro Display',
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 19.09 / 16,
              color: Color(0xFF3A89FD),
            ),
          ),
        ),
      ),
    );
  }
}
