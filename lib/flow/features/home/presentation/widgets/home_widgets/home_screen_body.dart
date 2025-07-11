import 'package:flow/flow/core/constant/constant_size.dart';
import 'package:flow/flow/core/utils/app_image.dart';
import 'package:flow/flow/features/home/presentation/widgets/home_widgets/home_categorys_grids.dart';
import 'package:flow/flow/features/home/presentation/widgets/home_widgets/home_custom_banner.dart';
import 'package:flow/flow/features/home/presentation/widgets/home_widgets/home_premotionlist.dart';
import 'package:flow/flow/features/home/presentation/widgets/home_widgets/home_screen_textfiled.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
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

class NearProductCard extends StatelessWidget {
  const NearProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppPalette.whiteColor,
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(
            color: AppPalette.whiteColor,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              AppImages.nearbyShop,
              fit: BoxFit.fill,
              height: 80,
              width: 80,
            ),
          ),
          ConstantWidgets.width30(context),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Freshly Baker',
                          style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          'Sweets, North Indian',
                          style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Site No - 1 | 6.4 kms ',
                          style: GoogleFonts.quicksand(fontSize: 12),
                        ),
                        ConstantWidgets.hight10(context),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 4.5,
                            horizontal: 5.5,
                          ),
                          decoration: BoxDecoration(
                            color: AppPalette.grayColor,
                            borderRadius: BorderRadius.circular(2),
                          ),

                          child: Text(
                            'Top Store',
                            style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '★ 4.1',
                          style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          '45 mins',
                          style: GoogleFonts.quicksand(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: AppPalette.orengeColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Icon(
                            LucideIcons.badgePercent,
                            size: 20,
                            color: AppPalette.redColor,
                          ),
                          ConstantWidgets.width20(context),
                          Flexible(
                            child: Text(
                              '★ 4.1 | 45 mins',
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w700,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Icon(
                            LucideIcons.shoppingCart600,
                            size: 20,
                            color: AppPalette.greenColor,
                          ),
                          ConstantWidgets.width20(context),
                          Flexible(
                            child: Text(
                              '3400+ items available',
                              style: GoogleFonts.quicksand(
                                fontWeight: FontWeight.w700,
                                fontSize: 11,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
