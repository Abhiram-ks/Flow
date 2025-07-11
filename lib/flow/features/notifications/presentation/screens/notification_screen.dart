import 'package:dio/dio.dart';
import 'package:flow/flow/features/notifications/data/datasources/notification_remote_data_source.dart';
import 'package:flow/flow/features/notifications/data/repository/notification_repository_impl.dart';
import 'package:flow/flow/features/notifications/domain/usecase/fetch_notifications_usecase.dart';
import 'package:flow/flow/features/notifications/presentation/bloc/network_bloc/network_bloc.dart';
import 'package:flow/flow/features/notifications/presentation/bloc/notification_bloc/notification_bloc.dart';
import 'package:flow/flow/features/notifications/presentation/widgets/notification_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/notification_screen_body.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => NotificationBloc(
                FetchNotificationsUsecase(
                  NotificationRepositoryImpl(
                    NotificationRemoteDataSource(dio: Dio()),
                  ),
                ),
              ),
        ),
        BlocProvider(create: (context) => NetworkBloc()),
      ],
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double width = constraints.maxWidth;
          final double height = constraints.maxHeight;
          return Scaffold(
            appBar: CustomAppBar(),
            body: NotificationScreenBody(width: width, height: height),
          );
        },
      ),
    );
  }
}

