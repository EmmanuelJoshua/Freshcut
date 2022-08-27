import 'package:flutter/material.dart';

const white = Colors.white;
const black = Colors.black;
const kSunGold = Color(0xFFF2BC3D);

Map<int, Color> color = {
  50: black.withOpacity(0.1),
  100: black.withOpacity(0.2),
  200: black.withOpacity(0.3),
  300: black.withOpacity(0.4),
  400: black.withOpacity(0.5),
  500: black.withOpacity(0.6),
  600: black.withOpacity(0.7),
  700: black.withOpacity(0.8),
  800: black.withOpacity(0.9),
  900: black,
};
MaterialColor kPrimaryColor = MaterialColor(0xff000000, color);

ThemeData get appTheme {
  return ThemeData(
    fontFamily: 'Grotesk',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primarySwatch: kPrimaryColor,
    primaryColor: black,
    scaffoldBackgroundColor: black,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.black.withOpacity(0)),
  );
}
