import 'package:get/get.dart';

class User {
  final RxString id;
  final RxString username;
  final RxString email;
  final RxString profileImageUrl;
  final RxString subscriptionRenewalDate;
  final RxBool hasActiveSubscription;
  final RxInt freeLessonsCount;

  User({
    required String id,
    required String username,
    required String email,
    String? profileImageUrl,
    String? subscriptionRenewalDate,
    bool hasActiveSubscription = false,
    int freeLessonsCount = 0,
  })  : id = id.obs,
        username = username.obs,
        email = email.obs,
        profileImageUrl = (profileImageUrl ?? '').obs,
        subscriptionRenewalDate = (subscriptionRenewalDate ?? '').obs,
        hasActiveSubscription = hasActiveSubscription.obs,
        freeLessonsCount = freeLessonsCount.obs;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      profileImageUrl: json['profile_image_url'],
      subscriptionRenewalDate: json['subscription_renewal_date'],
      hasActiveSubscription: json['has_active_subscription'] ?? false,
      freeLessonsCount: json['free_lessons_count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id.value,
      'username': username.value,
      'email': email.value,
      'profile_image_url': profileImageUrl.value,
      'subscription_renewal_date': subscriptionRenewalDate.value,
      'has_active_subscription': hasActiveSubscription.value,
      'free_lessons_count': freeLessonsCount.value,
    };
  }
}
