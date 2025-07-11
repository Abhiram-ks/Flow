import 'package:flow/flow/features/home/presentation/provider/cubit/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:flow/flow/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../../config/theme/app_palette.dart';

const double bottomNavBarHeight = 70.0;

class BottomNavigationControllers extends StatelessWidget {
  final List<Widget> _screens = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  BottomNavigationControllers({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: AppPalette.whiteColor.withAlpha((0.3 * 255).round()),
        highlightColor: AppPalette.whiteColor.withAlpha((0.2 * 255).round()),
      ),
      child: BlocProvider(
        create: (context) => ButtomNavCubit(),
        child: Builder(
          builder: (context) {
            return Scaffold(
              body: BlocBuilder<ButtomNavCubit, BottomNavItem>(
                builder: (context, state) {
                  switch (state) {
                    case BottomNavItem.home:
                      return _screens[0];
                    case BottomNavItem.revenue:
                      return _screens[1];
                    case BottomNavItem.service:
                      return _screens[2];
                    case BottomNavItem.chat:
                      return _screens[3];
                  }
                },
              ),
              bottomNavigationBar: BlocBuilder<ButtomNavCubit, BottomNavItem>(
                builder: (context, state) {
                  return SizedBox(
                    height: bottomNavBarHeight,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppPalette.whiteColor,
                        boxShadow: [
                          BoxShadow(
                            color:AppPalette.grayColor,
                            offset: Offset(0, -2), 
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: BottomNavigationBar(
                        enableFeedback: true,
                        useLegacyColorScheme: true,
                        elevation:  0,
                        iconSize: 26,
                        selectedItemColor: AppPalette.mainColor,
                        backgroundColor: AppPalette.whiteColor,
                        landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
                        unselectedLabelStyle: TextStyle(
                          color: AppPalette.grayColor,
                        ),
                        showSelectedLabels: true,
                        showUnselectedLabels: true,
                        type: BottomNavigationBarType.fixed,
                        currentIndex: BottomNavItem.values.indexOf(state),
                        onTap: (index) {
                          context.read<ButtomNavCubit>().selectItem(
                            BottomNavItem.values[index],
                          );
                        },
                        items: const [
                          BottomNavigationBarItem(
                            icon: Icon(LucideIcons.store),
                            label: 'Home',
                            activeIcon: Icon(LucideIcons.store600),
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(LucideIcons.shoppingBasket),
                            label: 'Cart',
                            activeIcon: Icon(LucideIcons.shoppingBasket600),
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(LucideIcons.shoppingBag),
                            label: 'My Order',
                            activeIcon: Icon(LucideIcons.shoppingBag600),
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(LucideIcons.user),
                            label: 'Account',
                            activeIcon: Icon(LucideIcons.user600),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
