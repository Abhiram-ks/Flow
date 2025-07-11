part of 'notification_bloc.dart';

@immutable
abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationLoaded extends NotificationState {
  final List<NotificationEntity> notifications;
  final bool hasReachedEnd;

  NotificationLoaded({
    required this.notifications,
    this.hasReachedEnd = false,
  });
}

class NotificationPaginationLoading extends NotificationState {
  final List<NotificationEntity> notifications;

  NotificationPaginationLoading({required this.notifications});
}

class NotificationFailure extends NotificationState {
  final String error;
  NotificationFailure({required this.error});
}
