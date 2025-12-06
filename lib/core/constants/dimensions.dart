import 'package:flutter/material.dart';

class AppDimensions {
  // -------------------------------------------------------------------
  // Spacing
  // -------------------------------------------------------------------
  static const double kSpacingExtraSmall = 4.0;
  static const double kSpacingSmall = 8.0;
  static const double kSpacingMedium = 16.0;
  static const double kSpacingLarge = 24.0;
  static const double kSpacingExtraLarge = 32.0;
  static const double kSpacingSplash = 48.0;
  static const double kSpacingHuge = 64.0;
  static const double kSignupLetterSpacing = 1.0;

  // -------------------------------------------------------------------
  // Padding & Margin
  // -------------------------------------------------------------------
  static const kPaddingCustom = EdgeInsets.all(32);
  static const kPaddingUnviewedBorder = EdgeInsets.all(5);
  static const kMarginUnviewedBorder = EdgeInsets.all(2);
  static const kPaddingViewedBorder = EdgeInsets.all(7);

  static const kPaddingLanguageSwitcher = EdgeInsets.fromLTRB(32, 12, 32, 12);

  static const kPaddingArticleBodyTitle = EdgeInsets.fromLTRB(32, 32, 32, 16);

  static const kPaddingArticleCaption = EdgeInsets.fromLTRB(32, 0, 32, 74);

  static const double kPaddinFloatingActionButton = 32.0;

  static const kPaddinArticleTitle = EdgeInsets.fromLTRB(32, 16, 32, 16);

  static const kPaddinArticleProfileCard = EdgeInsets.fromLTRB(32, 0, 16, 32);

  static const kPaddinOnboardingCard = EdgeInsets.only(
    left: 32,
    right: 32,
    bottom: 8,
  );

  static const kPaddingMenuCard = EdgeInsets.fromLTRB(32, 0, 32, 64);

  static const kPaddingMenuCardRow = EdgeInsets.fromLTRB(24, 24, 24, 24);

  static const kPaddingMenuProfileAboutTitle = EdgeInsets.fromLTRB(
    32,
    0,
    32,
    0,
  );

  static const kPaddingMenuProfileDescriptionTitle = EdgeInsets.fromLTRB(
    32,
    4,
    32,
    32,
  );

  static const kPaddingMenuPosts = EdgeInsets.fromLTRB(32, 16, 32, 16);

  static const kPaddingAuthLogo = EdgeInsets.only(bottom: 32, top: 32);

  static const kPaddingAuthCard = EdgeInsets.fromLTRB(32, 48, 32, 32);

  static const kPaddingHomeFirst = EdgeInsets.fromLTRB(32, 16, 32, 0);

  static const kPaddingHomeSecond = EdgeInsets.fromLTRB(32, 10, 0, 16);

  static const kPaddingOnboarding = EdgeInsets.only(top: 32, bottom: 8);

  static const kPaddingStoryListView = EdgeInsets.symmetric(horizontal: 32);

  static const kMarginStoryItem = EdgeInsets.symmetric(horizontal: 8);

  static const kPaddingPostList = EdgeInsets.only(left: 32, right: 16);

  static const kMarginPost = EdgeInsets.fromLTRB(32, 8, 32, 8);

  static const kPaddingPost = EdgeInsets.fromLTRB(16, 0, 16, 0);

  static const kMarginCategory = EdgeInsets.fromLTRB(8, 0, 8, 16);

  static const kPaddingStoryViewer = EdgeInsets.symmetric(horizontal: 3);

  // -------------------------------------------------------------------
  // Border Radius
  // -------------------------------------------------------------------
  static const BorderRadius kDefaultBorderRadius = BorderRadius.all(
    Radius.circular(8.0),
  );

  static const BorderRadius kMediumBorderRadius = BorderRadius.all(
    Radius.circular(12.0),
  );

  static const BorderRadius kCustomBorderRadius = BorderRadius.only(
    topLeft: Radius.circular(32),
    topRight: Radius.circular(32),
  );

  static BorderRadius kSmallCircularBorderRadius = BorderRadius.circular(12);

  static BorderRadius kMediumCircularBorderRadius = BorderRadius.circular(24);

  static BorderRadius kStoryImageBorderRadius = BorderRadius.circular(17);

  static Radius kViewedBorder = Radius.circular(24);

  static BorderRadius kLargeCircularBorderRadius = BorderRadius.circular(32);

  static BorderRadius kCircularButtonBorderRadius = BorderRadius.circular(32.5);

  static BorderRadiusGeometry kPostImageBorderRadius =
      BorderRadiusGeometry.circular(16);

  static RoundedRectangleBorder kSignupButtonBorderRadius =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(12));

  static RoundedRectangleBorder kLoginButtonBorderRadius =
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(12));

  // -------------------------------------------------------------------
  // Sizes (Icons, Widgets, Images, Buttons)
  // -------------------------------------------------------------------
  static const double kArticleBoxWidth = 111.0;
  static const double kArticleBoxHeight = 48.0;

  static const double kIconSizeSmall = 14.0;
  static const double kIconSizeExtraSmall = 12.0;

  static const double kProfileImageSize = 60.0;

  static const double kSkillCardSize = 120.0;
  static const double kSkillIconSize = 40.0;

  static const double kButtonHeight = 48.0;

  static const double kArticleProfileWidth = 48.0;
  static const double kArticleProfileHeight = 48.0;

  static const double kArticleShadowSize = 120.0;

  static const double kSplashLogoSize = 150.0;

  static const double kOnboardingCardSize = 300.0;
  static const double kOnboardingButtonSize = 60.0;
  static const double kOnboardingButtonMinimumHeight = 60.0;
  static const double kOnboardingButtonMinimumWidth = 84.0;

  static const double kMenuProfileImageSize = 85.0;
  static const double kMenuSecondCardShadowSize = 32.0;
  static const double kMenuSecondCardHeight = 68.0;

  static const double kAuthLogoSize = 120.0;
  static const double kAuthBlueCardHeight = 60.0;

  static const double kHomeNotificationSize = 28.0;

  static const double kStoryMinHeight = 4.0;
  static const double kStoryCardHeight = 100.0;

  static const double kPostItemExtentSize = 140.0;
  static const double kPostImageSize = 120.0;

  static const double kSignupButtonSize = 60.0;
  static const double kLoginButtonSize = 60.0;

  static const double kSignupLogosSize = 36.0;
  static const double kLoginLogosSize = 36.0;

  static const double kStoryIconSize = 24.0;
  static const double storyBorderSize = 68.0;

  static const double kStrokeWidthSize = 2.0;

  static const double kBottomNavigationButtonLoc = 85.0;
  static const double kBottomNavigationCardHeight = 65.0;
  static const double kBottomNavigationButtonBorderWidth = 4.0;
  static const double kBottomNavigationItemSize = 24.0;

  static const double kViewportFractionSize = 0.8;
  static const double kAspectRatioSize = 1.2;

  static const int kInitialPageSize = 0;

  static const List<double> kDashPattern = [8, 2];

  static const double kAppbarElevation = 0.0;

  static const double kOnboardingDotWidth = 8.0;
  static const double kOnboardingDotHeigh = 8.0;

  static const double kCircularButtonSize = 65.0;

  static const int kMenuFlexSize = 1;

  // -------------------------------------------------------------------
  // Durations & Animation Timings
  // -------------------------------------------------------------------
  static const double kShadowBlurRadius = 20.0;

  static const kSplashDuration = 4;
  static const kStoryDuration = 4;
  static const kOnboardingDuration = 500;
}

/// Numeric constants for positioning, spacing and typography.
class AppNumbers {
  // -------------------------------------------------------------------
  // Positioned Layout Constants
  // -------------------------------------------------------------------
  static const double kMenuFirstPositionBottom = 32.0;
  static const double kMenuFirstPositionLeft = 96.0;
  static const double kMenuFirstPositionRight = 96.0;

  static const double kMenuSecondPositionRight = 64.0;
  static const double kMenuSecondPositionLeft = 64.0;
  static const double kMenuSecondPositionBottom = 32.0;

  static const double kMainPositionBottom = 0.0;
  static const double kMainPositionLeft = 0.0;
  static const double kMainPositionRight = 0.0;

  static const double kStoryFirstPositionTop = 50.0;
  static const double kStoryFirstPositionLeft = 10.0;
  static const double kStoryFirstPositionRight = 10.0;

  static const double kStorySecondPositionTop = 95.0;
  static const double kStorySecondPositionLeft = 20.0;
  static const double kStorySecondPositionRight = 20.0;

  static const double kCategorySecondPositionTop = 100.0;
  static const double kCategorySecondPositionLeft = 65.0;
  static const double kCategorySecondPositionRight = 65.0;
  static const double kCategorySecondPositionBottom = 24.0;

  static const double kCategoryThirdPositionLeft = 32.0;
  static const double kCategoryThirdPositionBottom = 48.0;

  static const double kBottomNavigationPositionBottom = 0.0;
  static const double kBottomNavigationPositionLeft = 0.0;
  static const double kBottomNavigationPositionRight = 0.0;

  static const double kStoryPositionRight = 0.0;
  static const double kStoryPositionBottom = 0.0;

  static const double kArticleShadowPosition = 0.0;

  // -------------------------------------------------------------------
  // Font Sizes
  // -------------------------------------------------------------------
  static const double kFontSizeBodyLarge = 13.0;
  static const double kFontSizeBodyMedium = 15.0;
  static const double kFontSizeSmall = 14.0;
  static const double kFontSizeMedium = 16.0;
  static const double kFontSizeLarge = 18.0;
}
