import 'package:flow/flow/config/theme/app_palette.dart';
import 'package:flow/flow/features/notifications/presentation/bloc/network_bloc/network_bloc.dart';
import 'package:flow/flow/features/notifications/presentation/bloc/notification_bloc/notification_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void handleNetworkState(BuildContext context, NetworkState state) {
  if (state is NetworkGood) {
     context.read<NotificationBloc>().add(FetchNotifications());
  }else if (state is NetworkBad) {
     showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: Text('Connection Failure.'),
        content: Text(state.error),
        actions: [
          CupertinoDialogAction(
            child: Text('Retry', style: TextStyle(color: AppPalette.redColor)),
            onPressed: () {
              Navigator.of(context).pop();
              context.read<NetworkBloc>().add(CheckConnectivity());
            },
          ),
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(
              'Cancel',
              style: TextStyle(color: AppPalette.blackColor),
            ),
          ),
        ],
      ),
    );
  }
}