
import 'package:flow/flow/features/notifications/domain/entities/notification_entity.dart';
import 'package:flow/flow/features/notifications/domain/repositories/notification_repository.dart';

class FetchNotificationsUsecase {
  final NotificationRepository repository;

  FetchNotificationsUsecase(this.repository);

    Future<List<NotificationEntity>> call(int offset, int limit) {
    return repository.getNotifications(offset: offset, limit: limit);
  }
}