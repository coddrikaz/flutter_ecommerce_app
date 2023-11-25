import 'package:animations/animations.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

import '../../../core/app_data.dart';
import '../screen/cart_screen.dart';
import '../screen/favorite_screen.dart';
import '../screen/product_list_screen.dart';
import '../screen/profile_screen.dart';

class PageWrapper extends StatefulWidget {
  Widget? child;

  PageWrapper({super.key,  this.child});

  static const List<Widget> screens = [
    ProductListScreen(),
    FavoriteScreen(),
    CartScreen(),
    ProfileScreen()
  ];

  @override
  State<PageWrapper> createState() => _PageWrapperState();
}

class _PageWrapperState extends State<PageWrapper> {
  int newIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 800),
        child: Scaffold(
          bottomNavigationBar: BottomNavyBar(
            itemCornerRadius: 10,
            selectedIndex: newIndex,
            items: AppData.bottomNavyBarItems
                .map(
                  (item) => BottomNavyBarItem(
                icon: item.icon,
                title: Text(item.title),
                activeColor: item.activeColor,
                inactiveColor: item.inActiveColor,
              ),
            )
                .toList(),
            onItemSelected: (currentIndex) {
              newIndex = currentIndex;
              print('currentIndex $currentIndex');
              setState(() {
                widget.child = null;
              });
            },
          ),
          body: PageTransitionSwitcher(
            duration: const Duration(seconds: 1),
            transitionBuilder: (
                Widget child,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                ) {
              return FadeThroughTransition(
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              );
            },
            //child: widget.child,
            child: widget.child ?? PageWrapper.screens[newIndex],
          ),
        ),
      ),
    );
  }
}
