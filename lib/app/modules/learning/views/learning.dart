import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:progress_line/progress_line.dart';

import '../../../core/constants/assets.dart';
import '../../widgets/svg_icon.dart';
import '../controllers/learning_controller.dart';

class Learning extends GetView<LearningController> {
  final String selectedLanguage;
  final List<String> languages;

  Learning({Key? key})
      : selectedLanguage = 'Польська',
        languages = ['Польська', 'Англійська', 'Німецька', 'Французька'],
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = Get.put(LearningController());
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(242, 243, 250, 1),
        ),
        child: Column(
          children: [
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        Assets.resourceImagesFlag,
                        height: 44,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            DropdownButton<String>(
                              value: selectedLanguage,
                              icon: const Icon(Icons.arrow_drop_down),
                              iconSize: 24,
                              elevation: 16,
                              underline:
                                  Container(), // This removes the underline
                              style: const TextStyle(
                                color: Color.fromRGBO(58, 137, 253, 1),
                                fontFamily: 'SF Pro Display',
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                height: 1.18,
                                letterSpacing: 0,
                              ),
                              onChanged: (String? newValue) {
                                c.updateSelectedLanguage(newValue!);
                              },
                              items: languages.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                            const Text(
                              'Лікар (В2)',
                              style: TextStyle(
                                fontFamily: 'SF Pro Display',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                height: 19 / 16,
                                letterSpacing: 0,
                                color: Color.fromRGBO(78, 78, 78, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(216, 107, 31, 0.14),
                              offset: Offset(0, 2),
                              blurRadius: 7,
                            ),
                          ],
                        ),
                        child: IconButton(
                          icon: const SvgIcon(
                            assetName: Assets.resourceImagesBell,
                            height: 28,
                            color: Color(0xFFFF8733),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: const Color(0xFF3A89FD),
                        borderRadius: BorderRadius.circular(19),
                      ),
                      child: const Center(
                        child: Text(
                          '7',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 55,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 10,
                      child: ProgressLineWidget(
                        percent: c.progress.value,
                        lineWidth: 6,
                        width: 400,
                        lineColors: const [Color(0xFFFF8733)],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Obx(() => Text(
                        "${(c.progress.value * 100).toInt()}%",
                        style: const TextStyle(
                          color: Color.fromRGBO(78, 78, 78, 1),
                          fontFamily: 'SF Pro Display',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 19 / 16,
                          letterSpacing: 0,
                        ),
                      )),
                  const SizedBox(
                    width: 55,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Divider(
              height: 1,
              color: Color.fromARGB(255, 199, 199, 199),
            ),
            _message(),
            Expanded(
              child: Obx(() => ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 16, right: 16, top: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Розділ 1',
                                  style: TextStyle(
                                    fontFamily: 'SF Pro Display',
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    height: 26 / 22,
                                    letterSpacing: 0,
                                    color: Color.fromRGBO(121, 55, 8, 1),
                                  ),
                                ),
                                Text(
                                  'Почніть навчання',
                                  style: TextStyle(
                                    fontFamily: 'SF Pro Display',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    height: 19 / 16,
                                    letterSpacing: 0,
                                    color: Color.fromRGBO(122, 122, 122, 1),
                                  ),
                                )
                              ],
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(216, 107, 31, 0.14),
                                    offset: Offset(0, 2),
                                    blurRadius: 7,
                                  ),
                                ],
                              ),
                              child: IconButton(
                                icon: AnimatedRotation(
                                  turns:
                                      c.isLessonsListExpanded.value ? 0.5 : 0,
                                  duration: const Duration(milliseconds: 300),
                                  child: const SvgIcon(
                                    assetName: Assets.resourceImagesChevrone,
                                    height: 28,
                                    color: Color(0xFFFF8733),
                                  ),
                                ),
                                onPressed: () => c.toggleLessonsList(),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      AnimatedSize(
                        duration: const Duration(milliseconds: 300),
                        child: c.isLessonsListExpanded.value
                            ? Column(
                                children: [
                                  _buildLessonTile(
                                      'Урок 1',
                                      'Cześć',
                                      Assets.resourceImagesThumb1,
                                      Colors.yellow),
                                  _buildLessonTile('Урок 2', 'Moje imię',
                                      Assets.resourceImagesThumb2, Colors.blue),
                                  _buildLessonTile('Урок 3', 'Jak się masz?',
                                      Assets.resourceImagesThumb3, Colors.blue),
                                  _buildLessonTile(
                                      'Урок 4',
                                      'Co robisz?',
                                      Assets.resourceImagesThumb4,
                                      Colors.white),
                                  _buildLessonTile(
                                      'Урок 5',
                                      'Moje imię',
                                      Assets.resourceImagesThumb5,
                                      Colors.white),
                                ],
                              )
                            : Container(),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLessonTile(String lessonNumber, String lessonTitle,
      String imagePath, Color backgroundColor) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
      child: Container(
        width: 396,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(216, 107, 31, 0.14),
              offset: Offset(0, 2),
              blurRadius: 7,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                  width: 80,
                  height: 80,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      lessonNumber,
                      style: const TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 19 / 16,
                        letterSpacing: 0,
                        color: Color.fromRGBO(160, 160, 160, 1),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      lessonTitle,
                      style: const TextStyle(
                        fontFamily: 'SF Pro Display',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        height: 21 / 18,
                        letterSpacing: 0,
                        color: Color.fromRGBO(121, 55, 8, 1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _message() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Column(
        children: [
          Container(
            width: 396,
            height: 155,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color.fromRGBO(255, 135, 51, 1)),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(155, 155, 155, 0.14),
                  offset: Offset(0, 2),
                  blurRadius: 7,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  SvgPicture.asset(
                    Assets.resourceImagesAlud1,
                    width: 76,
                    height: 76,
                  ),
                  const SizedBox(width: 24),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Раді тебе бачити!',
                            style: TextStyle(
                              fontFamily: 'SF Pro Display',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              height: 19 / 16,
                              letterSpacing: 0,
                              color: Color.fromRGBO(174, 151, 138, 1),
                            )),
                        SizedBox(height: 8),
                        Text(
                          'У тебе 7 безкоштовних уроків',
                          style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            height: 21 / 18,
                            letterSpacing: 0,
                            color: Color.fromRGBO(121, 55, 8, 1),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Щоб мати необмежений доступ до навчання - оформи підписку.',
                          style: TextStyle(
                            fontFamily: 'SF Pro Display',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 19 / 16,
                            letterSpacing: 0,
                            color: Color.fromRGBO(78, 78, 78, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 396,
            height: 56,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(255, 135, 51, 1),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  // Add your onTap functionality here
                },
                child: const Center(
                  child: Text(
                    'Купити підписку',
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      height: 26 / 22,
                      letterSpacing: 0,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
