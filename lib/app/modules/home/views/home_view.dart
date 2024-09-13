import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/assets.dart';
import '../../learning/controllers/learning_controller.dart';
import '../../learning/views/learning.dart';
import '../../profile/controllers/profile_controller.dart';
import '../../profile/views/profile_view.dart';
import '../../widgets/svg_icon.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
            child: _buildCurrentScreen(controller.currentIndex.value),
          )),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }

  Widget _buildCurrentScreen(int index) {
    switch (index) {
      case 0:
        return GetBuilder<LearningController>(
          key: const ValueKey('learning'),
          init: LearningController(),
          builder: (_) => Learning(),
        );
      case 1:
        return const Center(
          key: ValueKey('favorites'),
          child: Text('Екран Обране'),
        );
      case 2:
        return const Center(
          key: ValueKey('roadmap'),
          child: Text('Екран План навчання'),
        );
      case 3:
        return GetBuilder<ProfileController>(
          key: const ValueKey('profile'),
          init: ProfileController(),
          builder: (controller) => const ProfileView(),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}

class CustomBottomNavigationBar extends GetView<HomeController> {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 83,
      padding: const EdgeInsets.fromLTRB(16, 7, 16, 0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(65, 71, 114, 0.14),
            offset: Offset(0, -4),
            blurRadius: 14,
          ),
        ],
      ),
      child: Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavItem(Assets.resourceImagesLearn, 'Навчання', 0),
              _buildNavItem(Assets.resourceImagesFavorites, 'Обране', 1),
              _buildNavItem(Assets.resourceImagesRoadmap, 'План навчання', 2),
              _buildNavItem(Assets.resourceImagesUser, 'Профіль', 3),
            ],
          )),
    );
  }

  Widget _buildNavItem(String iconPath, String label, int index) {
    return GestureDetector(
      onTap: () => controller.changePage(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgIcon(
            assetName: iconPath,
            height: 24,
            color: controller.currentIndex.value == index
                ? Colors.orange
                : Colors.grey,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: controller.currentIndex.value == index
                  ? Colors.orange
                  : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
