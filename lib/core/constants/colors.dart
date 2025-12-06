import 'package:flutter/material.dart';

class AppColors {
  // -------------------------------------------------------------------
  // 1. Core Brand Colors
  // -------------------------------------------------------------------
  static final Color kPrimaryColor = Color(0xff376AED);

  // -------------------------------------------------------------------
  // 2. Light Theme Colors
  // -------------------------------------------------------------------
  static const Color kAppbarBackgroundColor = Colors.white;
  static const Color kOnPrimaryColor = Colors.white;
  static const Color kSurfaceColor = Colors.white;

  static final Color kPrimaryTextColor = Color(0xff0D253C);
  static final Color kSecondaryTextColor = Color(0xff2D4379);
  static final Color kViewedStoryColor = Color(0xff7B8BB2);

  static const List<Color> kUnviewedStoryColors = [
    Color(0xff376AED),
    Color(0xff49B0E2),
    Color(0xff9CECFB),
  ];

  static const Color kTabActiveColor = Colors.white;
  static const Color kTabInactiveColor = Colors.white54;
  static const Color kMenuActiveColor = Color(0xff2151CD);
  static const Color kSystemChromeColor = Colors.white;

  static const Color kCategoryShadowColor = Color(0xaa0D253C);
  static const Color kPostShadowColor = Color(0x1a5282FF);
  static const Color kBottomNavigationShadowColor = Color(0xff9bB487);

  static const Color kSurfaceLight = Color(0x0d000000);
  static const Color kAppBarLight = Color.fromARGB(255, 235, 235, 235);

  // -------------------------------------------------------------------
  // 3. Common Utility Colors
  // -------------------------------------------------------------------
  static const Color kWhite = Colors.white;
  static const Color kBlack = Colors.black;
  static const Color kBlue = Colors.blue;
  static const Color kTransparent = Colors.transparent;
  static const Color kDarkBlue = Color(0xff0D253C);
  static const Color kGray = Colors.white24;
}
