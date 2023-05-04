import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class LightTheme{
  LightTheme._();
  static final ThemeData lightTheme = ThemeData.light(useMaterial3: true).copyWith(
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorConstants.forestGreen,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(color: Colors.black),
      unselectedIconTheme: IconThemeData(color: Colors.white),
    ),
  );
}