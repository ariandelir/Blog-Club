import 'package:blogclub/core/config/app.dart';
import 'package:blogclub/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  // Configure the system UI (status bar and navigation bar)
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: AppColors.kSystemChromeColor,
      statusBarColor: AppColors.kSystemChromeColor,
      systemNavigationBarDividerColor: AppColors.kSystemChromeColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  // Launch the app
  runApp(const MyApp());
}
