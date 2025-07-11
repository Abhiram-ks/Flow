
import 'package:flow/flow/config/theme/app_palette.dart';
import 'package:flow/flow/core/constant/constant_size.dart';
import 'package:flow/flow/core/utils/app_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

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
