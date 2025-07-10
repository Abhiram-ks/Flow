import 'package:flow/flow/features/home/presentation/widgets/home_widgets/home_screen_body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        final double height = constraints.maxHeight;

        return SafeArea(
          child: Scaffold(
            body:HomeScreenBody(width: width, height: height)
          ),
        );
      },
    );
  }
}
