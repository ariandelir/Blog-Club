import 'package:blogclub/core/constants/colors.dart';
import 'package:blogclub/core/constants/dimensions.dart';
import 'package:blogclub/core/constants/extensions.dart';
import 'package:blogclub/gen/assets.gen.dart';
import 'package:blogclub/screens/auth_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // Controls the onboarding pages
  final PageController _pageController = PageController();

  // Tracks current page index
  int page = 0;

  @override
  void initState() {
    // Listens to page changes and updates current index
    _pageController.addListener(() {
      if (_pageController.page!.round() != page) {
        setState(() {
          page = _pageController.page!.round();
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Scaffold(
      backgroundColor: themeData.colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            // Top area showing background image
            Expanded(
              child: Padding(
                padding: AppDimensions.kPaddingOnboarding,
                child: Assets.images.background.onboarding.image(),
              ),
            ),

            // Bottom card containing page text + indicator + button
            Container(
              height: AppDimensions.kOnboardingCardSize,
              decoration: BoxDecoration(
                color: themeData.colorScheme.surface,
                boxShadow: [
                  BoxShadow(
                    blurRadius: AppDimensions.kShadowBlurRadius,
                    color: AppColors.kBlack.withOpacity(0.1),
                  ),
                ],
                borderRadius: AppDimensions.kCustomBorderRadius,
              ),
              child: Column(
                children: [
                  // PageView for onboarding steps
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: context.onBoardingItems.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: AppDimensions.kPaddingCustom,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.onBoardingItems[index].title,
                                style: themeData.textTheme.headlineMedium,
                              ),
                              SizedBox(height: AppDimensions.kSpacingMedium),
                              Text(
                                context.onBoardingItems[index].description,
                                style: themeData.textTheme.titleMedium!.apply(
                                  fontSizeFactor: 0.9,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  // Bottom controls section
                  Container(
                    height: AppDimensions.kOnboardingButtonSize,
                    padding: AppDimensions.kPaddinOnboardingCard,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Page indicator dots
                        SmoothPageIndicator(
                          controller: _pageController,
                          count: context.onBoardingItems.length,
                          effect: ExpandingDotsEffect(
                            activeDotColor: themeData.colorScheme.primary,
                            dotWidth: AppDimensions.kOnboardingDotWidth,
                            dotHeight: AppDimensions.kOnboardingDotHeigh,
                            dotColor: themeData.colorScheme.primary.withOpacity(
                              0.1,
                            ),
                          ),
                        ),

                        // Next / Done button
                        ElevatedButton(
                          onPressed: () {
                            // If last page → navigate to MainScreen
                            if (page == context.onBoardingItems.length - 1) {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const AuthScreen(),
                                ),
                              );
                            } else {
                              // Go to next onboarding page
                              _pageController.animateToPage(
                                page + 1,
                                duration: const Duration(
                                  milliseconds:
                                      AppDimensions.kOnboardingDuration,
                                ),
                                curve: Curves.decelerate,
                              );
                            }
                          },
                          style: ButtonStyle(
                            iconColor: WidgetStateProperty.all(
                              AppColors.kOnPrimaryColor,
                            ),
                            backgroundColor: WidgetStateProperty.all(
                              AppColors.kPrimaryColor,
                            ),
                            minimumSize: WidgetStateProperty.all(
                              const Size(
                                AppDimensions.kOnboardingButtonMinimumWidth,
                                AppDimensions.kOnboardingButtonMinimumHeight,
                              ),
                            ),
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: AppDimensions.kMediumBorderRadius,
                              ),
                            ),
                          ),
                          child: Icon(
                            page == context.onBoardingItems.length - 1
                                ? CupertinoIcons.check_mark
                                : CupertinoIcons.arrow_right,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
