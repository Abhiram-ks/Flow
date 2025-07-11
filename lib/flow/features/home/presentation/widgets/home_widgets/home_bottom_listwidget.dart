
import 'package:flow/flow/config/theme/app_palette.dart';
import 'package:flow/flow/core/constant/constant_size.dart';
import 'package:flow/flow/core/utils/app_image.dart';
import 'package:flow/flow/features/home/presentation/widgets/home_widgets/home_custom_banner.dart';
import 'package:flow/flow/features/home/presentation/widgets/home_widgets/home_custom_nearbycard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomWidgetsList extends StatelessWidget {
  final double hight;
  final double width;
  const BottomWidgetsList({
    super.key,
    required this.hight,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PromoBanner(
          title: 'Refer & Earn',
          buttonText: 'CHECK NOW',
          containerColors: [AppPalette.mainColor],
          textColor: Colors.white,
          buttonColor: Colors.orange,

          imageList: [AppImages.referAndEarn],
          height: hight * 0.12,
          width: width * 0.2,
          iconData: true,
          isGift: true,
          onTap: () {},
        ),
        ConstantWidgets.hight30(context),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Nearby stores",
              style: GoogleFonts.quicksand(
                fontWeight: FontWeight.w700,
                fontSize: 21,
              ),
            ),
            Text(
              "See all",
              style: GoogleFonts.quicksand(
                fontWeight: FontWeight.bold,
                color: AppPalette.mainColor,
              ),
            ),
          ],
        ),
        ConstantWidgets.hight20(context),
        NearProductCard(),
        ConstantWidgets.hight20(context),
        NearProductCard(),
        ConstantWidgets.hight50(context),
        Center(
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: AppPalette.mainColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            ),
            child: Text(
              'View all stores',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        ConstantWidgets.hight30(context),
      ],
    );
  }
}
