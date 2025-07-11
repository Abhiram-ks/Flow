
import 'package:flow/flow/features/notifications/presentation/bloc/network_bloc/network_bloc.dart';
import 'package:flow/flow/features/notifications/presentation/bloc/notification_bloc/notification_bloc.dart';
import 'package:flow/flow/features/notifications/presentation/widgets/handle_networkstate.dart';
import 'package:flow/flow/features/notifications/presentation/widgets/notification_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationScreenBody extends StatefulWidget {
  const NotificationScreenBody({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  State<NotificationScreenBody> createState() => _NotificationScreenBodyState();
}

class _NotificationScreenBodyState extends State<NotificationScreenBody> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    context.read<NotificationBloc>().add(FetchNotifications());
    context.read<NetworkBloc>().add(CheckConnectivity());

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        context.read<NotificationBloc>().add(FetchNotifications());
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NetworkBloc, NetworkState>(
      listener: (context, state) {
        handleNetworkState(context, state);
      },
      child: NotificationBuilder(scrollController: _scrollController, widget: widget),
    );
  }
}
