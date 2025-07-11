import 'package:flow/flow/config/theme/app_palette.dart';
import 'package:flow/flow/features/home/presentation/widgets/home_widgets/home_categorys_data.dart';
import 'package:flow/flow/features/home/presentation/widgets/home_widgets/home_custom_categorycards.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryGridSection extends StatelessWidget {
  final double width;
  final double height;

  const CategoryGridSection({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final categories = CategoryData.categories;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "What would you like to do today?",
          style: GoogleFonts.quicksand(
            fontWeight: FontWeight.w700,
            fontSize: 21,
          ),
        ),
        SizedBox(height: 16),
        GridView.builder(
          itemCount: categories.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 0.8,
            crossAxisSpacing: 4,
            mainAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            final cat = categories[index];
            return CategoryItemCard(
              title: cat["title"]!,
              imagePath: cat["image"]!,
              discountLabel: cat["discount"],
              width: width,
              height: height,
            );
          },
        ),
        SizedBox(height: 5),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("More",style:  GoogleFonts.quicksand(
            fontWeight: FontWeight.w700, color: AppPalette.mainColor ),),
              Icon(Icons.keyboard_arrow_down,color: AppPalette.mainColor,)
            ],
          )
        )
      ],
    );
  }
}
