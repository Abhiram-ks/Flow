import 'package:flow/flow/core/constant/constant_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../config/theme/app_palette.dart';

class HomeScreenBody extends StatefulWidget {
  final double width;
  final double height;
  const HomeScreenBody({super.key, required this.width, required this.height});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: widget.width * .04),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ConstantWidgets.hight20(context),
            Row(
              children: [
                Icon(Icons.location_on_rounded, color: AppPalette.mainColor),
                Text(
                  "ABCD, New Delhi",
                  style: GoogleFonts.quicksand(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: AppPalette.mainColor,
                ),
              ],
            ),
            IconButton(onPressed: (){
              
            }, icon: Icon(Icons.notifications_active))
            
          ],
        ),
      ),
    );
  }
}
