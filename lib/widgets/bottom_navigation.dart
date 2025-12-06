import 'package:blogclub/core/constants/colors.dart';
import 'package:blogclub/core/constants/dimensions.dart';
import 'package:blogclub/core/constants/extensions.dart';
import 'package:blogclub/core/constants/strings.dart';
import 'package:blogclub/gen/assets.gen.dart';
import 'package:blogclub/screens/main_screen.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
    required this.onTap,
    required this.selectedIndex,
  });

  final Function(int index) onTap;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.kBottomNavigationButtonLoc,
      child: Stack(
        children: [
          /// Main bottom navigation bar container
          Positioned(
            left: AppNumbers.kBottomNavigationPositionLeft,
            right: AppNumbers.kBottomNavigationPositionRight,
            bottom: AppNumbers.kBottomNavigationPositionBottom,
            child: Container(
              height: AppDimensions.kBottomNavigationCardHeight,
              decoration: BoxDecoration(
                color: AppColors.kWhite,
                boxShadow: [
                  BoxShadow(
                    blurRadius: AppDimensions.kShadowBlurRadius,
                    color: AppColors.kBottomNavigationShadowColor.withOpacity(
                      0.3,
                    ),
                  ),
                ],
              ),

              /// Navigation items row
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BottomNavigationItem(
                    iconFileName: AppStrings.homeIconFilePath,
                    activeIconFileName: AppStrings.homeActiveIconFilePath,
                    title: AppStrings.bottomNavigationHome,
                    isActive: selectedIndex == homeIndex,
                    onTap: () => onTap(homeIndex),
                  ),
                  BottomNavigationItem(
                    iconFileName: AppStrings.articleIconFilePath,
                    activeIconFileName: AppStrings.articleActiveIconFilePath,
                    title: AppStrings.bottomNavigationArticle,
                    isActive: selectedIndex == articleIndex,
                    onTap: () => onTap(articleIndex),
                  ),

                  /// Empty space for center floating button
                  const Expanded(child: SizedBox()),

                  BottomNavigationItem(
                    iconFileName: AppStrings.searchIconFilePath,
                    activeIconFileName: AppStrings.searchActiveIconFilePath,
                    title: AppStrings.bottomNavigationSearch,
                    isActive: selectedIndex == searchIndex,
                    onTap: () => onTap(searchIndex),
                  ),
                  BottomNavigationItem(
                    iconFileName: AppStrings.menuIconFilePath,
                    activeIconFileName: AppStrings.menuActiveIconFilePath,
                    title: AppStrings.bottomNavigationMenu,
                    isActive: selectedIndex == menuIndex,
                    onTap: () => onTap(menuIndex),
                  ),
                ],
              ),
            ),
          ),

          /// Center circular '+' button
          Center(
            child: Container(
              alignment: Alignment.topCenter,
              child: Container(
                height: AppDimensions.kCircularButtonSize,
                decoration: BoxDecoration(
                  borderRadius: AppDimensions.kCircularButtonBorderRadius,
                  // ignore: deprecated_member_use
                  color: Color(AppColors.kPrimaryColor.value),
                  border: Border.all(
                    color: AppColors.kOnPrimaryColor,
                    width: AppDimensions.kBottomNavigationButtonBorderWidth,
                  ),
                ),
                child: Assets.images.icons.plus.image(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavigationItem extends StatelessWidget {
  const BottomNavigationItem({
    super.key,
    required this.iconFileName,
    required this.activeIconFileName,
    required this.title,
    required this.onTap,
    required this.isActive,
  });

  final String iconFileName;
  final String activeIconFileName;
  final String title;
  final Function() onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Switch between active / inactive icons
            Image.asset(
              AppStrings.iconPath(activeIconFileName, iconFileName, isActive),
              width: AppDimensions.kBottomNavigationItemSize,
              height: AppDimensions.kBottomNavigationItemSize,
            ),

            SizedBox(height: AppDimensions.kSpacingExtraSmall),

            /// Label with active color when selected
            Text(
              title,
              style: context.theme.textTheme.bodySmall?.apply(
                color: isActive
                    ? context.theme.colorScheme.primary
                    : context.theme.textTheme.bodySmall!.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
