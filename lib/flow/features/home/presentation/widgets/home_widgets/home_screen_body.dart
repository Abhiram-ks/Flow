import 'package:flow/flow/core/constant/constant_size.dart';
import 'package:flow/flow/features/home/presentation/widgets/home_widgets/home_bottom_listwidget.dart';
import 'package:flow/flow/features/home/presentation/widgets/home_widgets/home_categorys_grids.dart';
import 'package:flow/flow/features/home/presentation/widgets/home_widgets/home_premotionlist.dart';
import 'package:flow/flow/features/home/presentation/widgets/home_widgets/home_screen_textfiled.dart';
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: widget.width * .04),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ConstantWidgets.hight30(context),
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
              ConstantWidgets.hight20(context),
              HomeTopSearchBar(
                width: widget.width,
                height: widget.height,
                notificationCount: 2,
              ),
              ConstantWidgets.hight30(context),
              CategoryGridSection(width: widget.width, height: widget.height),
              PromotionsList(hight: widget.height, width: widget.width),
              BottomWidgetsList(hight: widget.height, width: widget.width),
            ],
          ),
        ),
      ),
    );
  }
}
