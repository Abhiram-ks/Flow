part of 'notification_bloc.dart';

@immutable
abstract class NotificationEvent {}
final class FetchNotifications extends NotificationEvent{}
