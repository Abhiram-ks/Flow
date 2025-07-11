import 'package:flow/flow/core/utils/app_image.dart';
import 'package:flow/flow/features/notifications/domain/entities/notification_entity.dart';

class NotificationModel extends NotificationEntity {
  NotificationModel({
    required super.image,
    required super.title,
    required super.body,
    required super.timestamp,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      image: json['image'] ?? AppImages.appLogo,
      title: json['title'] ?? 'No Notifications Available!',
      body: json['body'] ?? 'Unable to load notifications.',
      timestamp: DateTime.tryParse(json['timestamp'] ?? '') ?? DateTime.now(),
    );
  }
}
