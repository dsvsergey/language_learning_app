import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Lesson {
  final String title;
  final String subtitle;
  final int number;

  Lesson({required this.title, required this.subtitle, required this.number});
}

class LearningController extends GetxController {
  final RxList<Lesson> lessons = <Lesson>[].obs;
  final RxInt freeLessonsCount = 7.obs;
  final RxDouble progress = 0.01.obs;
  final selectedLanguage = 'Польська'.obs;
  final isLessonsListExpanded = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadLessons();
  }

  void loadLessons() {
    // В реальному додатку ці дані можуть завантажуватися з API
    lessons.assignAll([
      Lesson(title: "Cześć", subtitle: "Урок 1", number: 1),
      Lesson(title: "Moje imię", subtitle: "Урок 2", number: 2),
      Lesson(title: "Jak się masz?", subtitle: "Урок 3", number: 3),
      Lesson(title: "Co robisz?", subtitle: "Урок 4", number: 4),
      Lesson(title: "Moje imię", subtitle: "Урок 5", number: 5),
      Lesson(title: "Cześć", subtitle: "Урок 6", number: 6),
    ]);
  }

  void startLesson(int lessonNumber) {
    // TODO: Реалізувати логіку початку уроку
    debugPrint('Початок уроку $lessonNumber');
  }

  void buySubscription() {
    // TODO: Реалізувати логіку покупки підписки
    debugPrint('Перехід до екрану покупки підписки');
  }

  void updateSelectedLanguage(String newValue) {
    selectedLanguage.value = newValue;
  }

  void toggleLessonsList() {
    isLessonsListExpanded.value = !isLessonsListExpanded.value;
  }
}
