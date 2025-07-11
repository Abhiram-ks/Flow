
import 'package:flow/flow/features/notifications/domain/entities/notification_entity.dart';

abstract class NotificationRepository {
  Future<List<NotificationEntity>> getNotifications({required int offset, required int limit });
}