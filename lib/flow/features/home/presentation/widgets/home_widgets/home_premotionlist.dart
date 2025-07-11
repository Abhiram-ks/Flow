import 'package:flow/flow/config/theme/app_palette.dart';
import 'package:flow/flow/core/constant/constant_size.dart';
import 'package:flow/flow/core/utils/app_image.dart';
import 'package:flow/flow/features/home/presentation/widgets/home_widgets/home_custom_banner.dart';
import 'package:flow/flow/features/home/presentation/widgets/home_widgets/home_custom_tradingcard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PromotionsList extends StatelessWidget {
  final double hight;
  final double width;
  const PromotionsList({super.key, required this.hight, required this.width});

  @override
  Widget build(BuildContext context) {
    final products = List.generate(8, (index) => const TrendingProductCard());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ConstantWidgets.hight10(context),
        Text(
          "Top picks for you",
          style: GoogleFonts.quicksand(
            fontWeight: FontWeight.w700,
            fontSize: 21,
          ),
        ),
        ConstantWidgets.hight10(context),
        PromoBanner(
          title: 'DISCOUNT\n25%\nALL FRUITS',
          buttonText: 'CHECK NOW',
          containerColors: [AppPalette.greenColor, Colors.blue, Colors.yellow],
          textColor: Colors.white,
          buttonColor: Colors.orange,
          imageList: [AppImages.fruits, AppImages.fruits, AppImages.fruits],
          height: hight * 0.224,
          width: width * 0.4,
          onTap: () {},
        ),
        ConstantWidgets.hight20(context),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Trending",
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
        SizedBox(
          height: hight * 0.13,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder:
                (context, index) =>
                    SizedBox(width: width * 0.7, child: products[index]),
          ),
        ),

        SizedBox(
          height: hight * 0.13,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder:
                (context, index) =>
                    SizedBox(width: width * 0.7, child: products[index + 4]),
          ),
        ),
        ConstantWidgets.hight20(context),
        Text(
          "Craze deals",
          style: GoogleFonts.quicksand(
            fontWeight: FontWeight.w700,
            fontSize: 21,
          ),
        ),
        ConstantWidgets.hight10(context),
        PromoBanner(
          title: 'Customer favourite top supermarkets',
          buttonText: 'Explore',
          containerColors: [AppPalette.blackColor],
          textColor: Colors.white,
          buttonColor: Colors.orange,
          imageList: [AppImages.explore, AppImages.explore],
          iconData: true,
          height: hight * 0.2,
          width: width * 0.22,
          onTap: () {},
        ),
         ConstantWidgets.hight30(context),
      ],
    );
  }
}