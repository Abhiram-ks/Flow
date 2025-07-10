import 'package:flow/flow/features/home/presentation/widgets/splash_widgets/splash_screen_body.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double height = constraints.maxHeight;

        return Scaffold(
          body: SplashScreenBody(height: height),
        );
      }
    );
  }
}