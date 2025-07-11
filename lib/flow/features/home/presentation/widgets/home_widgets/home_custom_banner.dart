
import 'package:flow/flow/config/theme/app_palette.dart';
import 'package:flow/flow/features/home/presentation/provider/cubit/image_slider_cubit/image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class PromoBanner extends StatelessWidget {
  final double height;
  final double width;
  final String title;
  final bool? iconData;
  final bool? isGift;
  final String buttonText;
  final List<Color> containerColors;
  final Color textColor;
  final Color buttonColor;
  final List<String> imageList;
  final VoidCallback onTap;

  const PromoBanner({
    required this.height,
    required this.title,
    required this.buttonText,
    required this.containerColors,
    required this.textColor,
    required this.buttonColor,
    required this.imageList,
    required this.onTap,
    required this.width,
    this.iconData = false,
    this.isGift = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImageSliderCubit(imageList: imageList),
      child: Builder(
        builder: (context) {
          final cubit = context.read<ImageSliderCubit>();
          return SizedBox(
            height: height,
            child: PageView.builder(
              controller: cubit.pageController,
              itemCount: imageList.length,
              onPageChanged: cubit.updatePage,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: containerColors[index % containerColors.length],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: GoogleFonts.quicksand(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                color: textColor,
                              ),
                            ),
                            iconData == true
                                ? isGift == true ? 
                                Text(
                                        'Invite your friends & earn 15% off',
                                        style: GoogleFonts.quicksand(
                                          color: AppPalette.whiteColor,
                                        ),
                                      )
                                :
                                ElevatedButton(
                                  onPressed: onTap,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    elevation: 0,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 5,
                                    ),
                                    shadowColor: Colors.transparent,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Explore',
                                        style: GoogleFonts.quicksand(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: buttonColor,
                                        ),
                                      ),
                                      const SizedBox(width: 6),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: buttonColor,
                                      ),
                                    ],
                                  ),
                                )
                                :  
                                 ElevatedButton(
                                  onPressed: onTap,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: buttonColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 0,
                                      horizontal: 25.0,
                                    ),
                                  ),
                                  child: Text(
                                    buttonText,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          imageList[index],
                          width: width,
                          height: height,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}


