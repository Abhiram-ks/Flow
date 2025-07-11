
import 'package:flow/flow/config/theme/app_palette.dart';
import 'package:flow/flow/core/constant/constant_size.dart';
import 'package:flow/flow/core/utils/date_formalt.dart';
import 'package:flow/flow/features/notifications/presentation/bloc/notification_bloc/notification_bloc.dart';
import 'package:flow/flow/features/notifications/presentation/widgets/notification_imageurl.dart';
import 'package:flow/flow/features/notifications/presentation/widgets/notification_screen_body.dart' show NotificationScreenBody;
import 'package:flow/flow/features/notifications/presentation/widgets/notification_tail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationBuilder extends StatelessWidget {
  const NotificationBuilder({
    super.key,
    required ScrollController scrollController,
    required this.widget,
  }) : _scrollController = scrollController;

  final ScrollController _scrollController;
  final NotificationScreenBody widget;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationBloc, NotificationState>(
      builder: (context, state) {
        if (state is NotificationLoading &&
            state is! NotificationPaginationLoading) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: CircularProgressIndicator(
                    color: AppPalette.mainColor,
                  ),
                ),
                ConstantWidgets.hight10(context),
                Text(
                  'Just a moment...',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Please wait while we process your request'),
              ],
            ),
          );
        }
    
        if (state is NotificationLoaded ||
            state is NotificationPaginationLoading) {
          final notifications =
              state is NotificationLoaded
                  ? state.notifications
                  : (state as NotificationPaginationLoading).notifications;
    
          return RefreshIndicator(
            color: AppPalette.mainColor,
            backgroundColor: AppPalette.whiteColor,
            onRefresh: () async {
              context.read<NotificationBloc>().add(FetchNotifications());
            },
            child: ListView.separated(
              controller: _scrollController,
              itemCount:
                  notifications.length +
                  (state is NotificationPaginationLoading ? 1 : 0),
              separatorBuilder:
                  (_, __) => Divider(color: AppPalette.grayColor),
              itemBuilder: (context, index) {
                if (index < notifications.length) {
                  final item = notifications[index];
                  final randomImage = NotificationImage.getRandomImage();
                  return AnimatedSwitcher(
                    duration: Duration(microseconds: 300),
                    child: NotificationTile(
                      imagePath: randomImage,
                      title: item.title,
                      subtitle: item.body,
                      time: DateFormatter.formatTimestamp(item.timestamp),
                      height: widget.height,
                      width: widget.width,
                    ),
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 1.5,
                        color: AppPalette.mainColor,
                      ),
                    ),
                  );
                }
              },
            ),
          );
        }
    
        if (state is NotificationFailure) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.cloud_off_sharp, size: 50),
                ConstantWidgets.hight10(context),
                Text(
                  "Oop's Unable to complete the request.",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text('Please try again later.'),
              ],
            ),
          );
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.notifications_off_outlined, size: 50),
              ConstantWidgets.hight10(context),
              Text(
                "An unexpected error occurred during the process.",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text("Please try again later."),
            ],
          ),
        );
      },
    );
  }
}