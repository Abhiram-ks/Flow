import 'package:flow/flow/config/routes/routes.dart';
import 'package:flow/flow/config/theme/app_palette.dart';
import 'package:flow/flow/features/home/presentation/provider/bloc/splash_bloc/splash_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void handleSplashState(BuildContext context, SplashState state) {
  if (state is GoToNavigate) {
     Navigator.pushReplacementNamed(context, AppRoutes.navigation);
  } else if (state is SplashFailure) {
     showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: Text('Loading Failure.'),
        content: Text(state.error),
        actions: [
          CupertinoDialogAction(
            child: Text('Retry', style: TextStyle(color: AppPalette.redColor)),
            onPressed: () {
              Navigator.of(context).pop();
              context.read<SplashBloc>().add(GotoHomeScreen());
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