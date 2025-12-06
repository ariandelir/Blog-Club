import 'package:blogclub/core/constants/colors.dart';
import 'package:blogclub/core/constants/dimensions.dart';
import 'package:blogclub/core/constants/extensions.dart';
import 'package:blogclub/core/constants/strings.dart';
import 'package:blogclub/gen/assets.gen.dart';
import 'package:blogclub/widgets/login.dart';
import 'package:blogclub/widgets/signup.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  // Index for switching between Login and Signup tabs
  static const int loginTab = 0;
  static const int signUpTab = 1;

  // Currently selected tab index
  int selectedTabIndex = loginTab;

  @override
  Widget build(BuildContext context) {
    // Base text style for tab titles
    final tabTextStyle = TextStyle(
      color: context.theme.colorScheme.onPrimary,
      fontSize: AppNumbers.kFontSizeLarge,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // App logo area
            Padding(
              padding: AppDimensions.kPaddingAuthLogo,
              child: SizedBox(
                height: AppDimensions.kAuthLogoSize,
                child: Assets.images.icons.logo.svg(
                  width: AppDimensions.kAuthLogoSize,
                ),
              ),
            ),

            // Blue card container that holds tabs and form contents
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: AppDimensions.kCustomBorderRadius,
                  color: context.theme.colorScheme.primary,
                ),
                child: Column(
                  children: [
                    // Tabs: Login / Signup
                    SizedBox(
                      height: AppDimensions.kAuthBlueCardHeight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Switch to Login form
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selectedTabIndex = loginTab;
                              });
                            },
                            child: Text(
                              AppStrings.authLoginTitle.toUpperCase(),
                              style: tabTextStyle.apply(
                                color: selectedTabIndex == loginTab
                                    ? AppColors.kTabActiveColor
                                    : AppColors.kTabInactiveColor,
                              ),
                            ),
                          ),

                          // Switch to Signup form
                          TextButton(
                            onPressed: () {
                              setState(() {
                                selectedTabIndex = signUpTab;
                              });
                            },
                            child: Text(
                              AppStrings.authSignupTitle.toUpperCase(),
                              style: tabTextStyle.apply(
                                color: selectedTabIndex == signUpTab
                                    ? AppColors.kTabActiveColor
                                    : AppColors.kTabInactiveColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // White card: displays Login or Signup form
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: AppDimensions.kCustomBorderRadius,
                          color: context.theme.colorScheme.surface,
                        ),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: AppDimensions.kPaddingAuthCard,

                            // Conditional rendering based on selected tab
                            child: selectedTabIndex == loginTab
                                ? Login()
                                : Signup(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
