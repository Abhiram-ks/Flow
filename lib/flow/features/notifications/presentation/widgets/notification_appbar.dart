import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../config/theme/app_palette.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const CustomAppBar({super.key}) : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppPalette.whiteColor,
      iconTheme: const IconThemeData(color: AppPalette.whiteColor),
      elevation: 2, 
      shadowColor: AppPalette.grayColor.withValues(alpha: 128),
      surfaceTintColor: Colors.transparent, 
      automaticallyImplyLeading: false,

      leading: IconButton.filled(
        tooltip: 'Back To Home',
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back, color: AppPalette.whiteColor),
        style: IconButton.styleFrom(
          backgroundColor: AppPalette.mainColor,
          shape: const CircleBorder(),
        ),
      ),

      title: Text(
        'Notifications',
        style: GoogleFonts.quicksand(
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),

    );
  }
}




