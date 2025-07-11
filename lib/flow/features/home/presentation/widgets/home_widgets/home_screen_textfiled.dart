// lib/widgets/home_top_search_bar.dart

import 'package:flow/flow/config/routes/routes.dart';
import 'package:flow/flow/config/theme/app_palette.dart';
import 'package:flow/flow/core/constant/constant_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;

class HomeTopSearchBar extends StatelessWidget {
  final double width;
  final double height;
  final int notificationCount;

  const HomeTopSearchBar({
    super.key,
    required this.width,
    required this.height,
    this.notificationCount = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: height * 0.06,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for products/stores',
                      hintStyle: GoogleFonts.quicksand(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Icon(CupertinoIcons.search, color: AppPalette.mainColor, size: 22),
              ],
            ),
          ),
        ),

        SizedBox(width: width * 0.03),
        InkWell(
          onTap: (){  Navigator.pushNamed(context, AppRoutes.notification); },
          child: badges.Badge(
            position: badges.BadgePosition.topEnd(top: -5, end: -2),
            badgeStyle: badges.BadgeStyle(
              badgeColor: AppPalette.redColor,
              padding: EdgeInsets.all(5),
            ),
            badgeContent: Text(
              '$notificationCount',
              style: TextStyle(color: AppPalette.whiteColor, fontSize: 10),
            ),
            child: Icon(Icons.notifications_outlined, color: AppPalette.redColor, size: 26),
          ),
        ),

        ConstantWidgets.width40(context),
        Icon(Icons.sell_outlined, color: AppPalette.orengeColor, size: 26),
      ],
    );
  }
}
