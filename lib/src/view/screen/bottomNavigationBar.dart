//
// import 'package:bottom_navy_bar/bottom_navy_bar.dart';
// import 'package:e_commerce_flutter/core/app_data.dart';
// import 'package:flutter/material.dart';
//
// class BottomNavigationBar extends StatelessWidget {
//   final Widget child;
//   final int newIndex;
//   const BottomNavigationBar({super.key, required this.child, required this.newIndex});
//
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavyBar(
//       itemCornerRadius: 10,
//       selectedIndex: newIndex,
//       items: AppData.bottomNavyBarItems
//           .map(
//             (item) => BottomNavyBarItem(
//           icon: item.icon,
//           title: Text(item.title),
//           activeColor: item.activeColor,
//           inactiveColor: item.inActiveColor,
//         ),
//       )
//           .toList(),
//       onItemSelected: (currentIndex) {
//         newIndex = currentIndex;
//       },
//     );
//   }
// }