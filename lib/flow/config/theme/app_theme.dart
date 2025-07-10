import 'package:flow/flow/config/theme/app_palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


/// This class defines the overall theme configuration for the Flutter application,
/// including colors, fonts, text styles, and widget theming for both light and dark modes.

class AppTheme {
  static final lightTheme = ThemeData(
    // Primary color used throughout the app
    primaryColor: AppPalette.blueColor,
    brightness: Brightness.light,
    // Background color for all Scaffold widgets
    scaffoldBackgroundColor: AppPalette.whiteColor,
    fontFamily: GoogleFonts.roboto().fontFamily,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppPalette.whiteColor,
      selectedItemColor: AppPalette.blackColor,
      unselectedItemColor: AppPalette.grayColor,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppPalette.blueColor,
     iconTheme: IconThemeData(color: AppPalette.blackColor),
    ),
    // Text styles for body text elements
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppPalette.blackColor),
      bodyMedium: TextStyle(color: AppPalette.blackColor),
      bodySmall: TextStyle(color: AppPalette.blackColor),
    )
  );
}