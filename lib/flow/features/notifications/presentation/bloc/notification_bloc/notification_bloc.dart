
import 'package:bloc/bloc.dart';
import 'package:flow/flow/features/notifications/domain/usecase/fetch_notifications_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../domain/entities/notification_entity.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final FetchNotificationsUsecase fetchUseCase;
  final int pageSize = 10;
  int currentIndex = 0;
  bool isFetching = false;

  NotificationBloc(this.fetchUseCase) : super(NotificationInitial()) {
   on<FetchNotifications>((event, emit) async {
  if (isFetching) return;
  isFetching = true;

  final isFirstLoad = state is NotificationInitial;
  if (isFirstLoad) {
    emit(NotificationLoading());
  } else if (state is NotificationLoaded) {
    emit(NotificationPaginationLoading(notifications: (state as NotificationLoaded).notifications));
  }

  try {
    final newItems = await fetchUseCase(currentIndex, pageSize);

    final hasReachedEnd = newItems.length < pageSize;
    currentIndex += newItems.length;

    final existing = state is NotificationLoaded
        ? (state as NotificationLoaded).notifications
        : state is NotificationPaginationLoading
            ? (state as NotificationPaginationLoading).notifications
            : [];

    emit(NotificationLoaded(
      notifications: [...existing, ...newItems],
      hasReachedEnd: hasReachedEnd,
    ));
  } catch (e) {
    emit(NotificationFailure(error: e.toString()));
  } finally {
    isFetching = false;
  }
});

  }
}
