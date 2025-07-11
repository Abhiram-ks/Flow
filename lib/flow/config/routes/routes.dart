import 'package:flow/flow/core/utils/app_image.dart';
import 'package:flow/flow/features/home/presentation/screens/home_screen.dart';
import 'package:flow/flow/features/home/presentation/screens/splash_screen.dart';
import 'package:flow/flow/features/home/presentation/widgets/navigation/bottom_nav_control.dart';
import 'package:flow/flow/features/notifications/presentation/screens/notification_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splash = '/';
  static const String home  = '/home_screen';
  static const String notification  = '/notification_screen';
  static const String navigation  = '/bottom_nav_control';

  static Route<dynamic> generateRoute(RouteSettings settings){
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_)=> const SplashScreen());
      case home:
        return MaterialPageRoute(builder: (_) =>const HomeScreen());
      case notification:
        return MaterialPageRoute(builder: (_) =>const NotificationScreen());
      case navigation:
        return MaterialPageRoute(builder: (_) =>  BottomNavigationControllers());
      default:
       return MaterialPageRoute(
          builder: (_) =>  Scaffold(
            body: Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppImages.appLogo, fit: BoxFit.cover,width: 170,height: 170,),
                Text('Oops!. PAGE NOT FOUND. 404')
              ],
            )),
          ),
        );
    }
  }
}