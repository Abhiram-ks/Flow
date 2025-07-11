import 'package:flow/flow/features/notifications/data/datasources/notification_remote_data_source.dart';
import 'package:flow/flow/features/notifications/domain/entities/notification_entity.dart';
import 'package:flow/flow/features/notifications/domain/repositories/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationRemoteDataSource dataSource;

  NotificationRepositoryImpl(this.dataSource);

  @override
  Future<List<NotificationEntity>> getNotifications({required int offset, required int limit}) {
    return dataSource.fetchNotifications(offset: offset, limit: limit);
  }
}
