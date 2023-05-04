import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/color_constants.dart';

class LightTheme{
  LightTheme._();
  static final ThemeData lightTheme = ThemeData.light(useMaterial3: true).copyWith(
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorConstants.mountainMeadow,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.white,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(color: Colors.black),
      unselectedIconTheme: IconThemeData(color: Colors.white),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorConstants.mountainMeadow,
      titleTextStyle: const TextStyle(color: ColorConstants.white, fontSize:16),
      iconTheme: const IconThemeData(color:  ColorConstants.white),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: ColorConstants.mountainMeadow,
        statusBarIconBrightness: Brightness.light,
      ),
      elevation: 0,
     // toolbarHeight: MediaQueryData.fromWindow(WidgetsBinding.instance.window).padding.top + 56,
      scrolledUnderElevation: 0,
      actionsIconTheme: const IconThemeData(color: ColorConstants.white),

    ),
    scaffoldBackgroundColor: ColorConstants.alabaster,
  );
}