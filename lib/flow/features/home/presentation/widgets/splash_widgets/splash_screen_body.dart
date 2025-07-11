import 'package:flow/flow/config/theme/app_palette.dart';
import 'package:flow/flow/core/constant/constant_size.dart';
import 'package:flow/flow/core/utils/app_image.dart';
import 'package:flow/flow/features/home/presentation/provider/bloc/splash_bloc/splash_bloc.dart';
import 'package:flow/flow/features/home/presentation/widgets/splash_widgets/handle_splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreenBody extends StatefulWidget {
  final double height;
  const SplashScreenBody({super.key, required this.height});

  @override
  State<SplashScreenBody> createState() => _SplashScreenBodyState();
}

class _SplashScreenBodyState extends State<SplashScreenBody> {
   @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SplashBloc>().add(GotoHomeScreen());
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) {
        handleSplashState(context, state);
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 170,
                height: 170,
                child: Image.asset(AppImages.appLogo, fit: BoxFit.cover),
              ),
            ),
            ConstantWidgets.hight30(context),
            SizedBox(
              height: 30,
              width: 30,
              child: CircularProgressIndicator(color: AppPalette.mainColor),
            ),
          ],
        ),
      ),
    );
  }
}
