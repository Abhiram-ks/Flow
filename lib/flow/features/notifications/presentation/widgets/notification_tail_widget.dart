
import 'package:flow/flow/core/utils/app_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../config/theme/app_palette.dart';

class NotificationTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final String subtitle;
  final String time;
  final double height;
  final double width;

  const NotificationTile({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: height * .01,
        horizontal: width * .03,
      ),
      decoration: BoxDecoration(color: AppPalette.whiteColor),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Image.network(
              imagePath,
              width: 30,
              height: 30,
              fit: BoxFit.contain,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return SizedBox(
                  width: 30,
                  height: 30,
                  child: Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  AppImages.appLogo,
                  width: 30,
                  height: 30,
                  fit: BoxFit.contain,
                );
              },
            ),
          ),

          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.quicksand(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppPalette.blackColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: GoogleFonts.quicksand(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade800,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  time,
                  style: GoogleFonts.quicksand(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
