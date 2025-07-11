import 'package:flow/flow/config/theme/app_palette.dart';
import 'package:flow/flow/features/home/presentation/widgets/home_widgets/home_screen_body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

       final double width = MediaQuery.of(context).size.width;
       final double height = MediaQuery.of(context).size.height;


        return ColoredBox(
          color: AppPalette.whiteColor,
          child: SafeArea(
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                body:HomeScreenBody(width: width, height: height)
              ),
          ),
        );
  
  }
}
