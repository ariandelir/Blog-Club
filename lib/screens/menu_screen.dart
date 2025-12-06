import 'package:blogclub/core/constants/colors.dart';
import 'package:blogclub/core/constants/dimensions.dart';
import 'package:blogclub/core/constants/extensions.dart';
import 'package:blogclub/core/constants/strings.dart';
import 'package:blogclub/gen/assets.gen.dart';
import 'package:blogclub/widgets/post_list.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Transparent AppBar for profile screen
              AppBar(
                elevation: AppDimensions.kAppbarElevation,
                backgroundColor: context.theme.colorScheme.surface.withOpacity(0),
                title: const Text(AppStrings.profileTitle),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.more_horiz_rounded),
                    onPressed: () {},
                  ),
                  const SizedBox(width: AppDimensions.kSpacingMedium),
                ],
              ),

              Stack(
                children: [
                  // Main profile info card
                  Container(
                    margin: AppDimensions.kPaddingMenuCard,
                    decoration: BoxDecoration(
                      borderRadius: AppDimensions.kMediumBorderRadius,
                      color: context.theme.colorScheme.surface,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: AppDimensions.kShadowBlurRadius,
                          color: context.theme.colorScheme.onSurface.withOpacity(
                            0.1,
                          ),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Profile row: image + name + title
                        Padding(
                          padding: AppDimensions.kPaddingMenuCardRow,
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: AppDimensions.kMediumBorderRadius,
                                child: Assets.images.stories.story1.image(
                                  width: AppDimensions.kMenuProfileImageSize,
                                  height: AppDimensions.kMenuProfileImageSize,
                                ),
                              ),
                              const SizedBox(
                                width: AppDimensions.kSpacingMedium,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(AppStrings.profileId),
                                    Text(
                                      AppStrings.profileUsername,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            fontWeight: FontWeight.w700,
                                            fontSize: AppNumbers.kFontSizeSmall,
                                          ),
                                    ),
                                    SizedBox(
                                      height: AppDimensions.kSpacingExtraSmall,
                                    ),
                                    Text(
                                      AppStrings.profileCareerPath,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            color:
                                                context.theme.colorScheme.primary,
                                            fontSize: AppNumbers.kFontSizeSmall,
                                            fontWeight: FontWeight.w400,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        // "About" section
                        Padding(
                          padding: AppDimensions.kPaddingMenuProfileAboutTitle,
                          child: Text(
                            AppStrings.profileAboutTitle,
                            style: context.theme.textTheme.titleLarge,
                          ),
                        ),

                        // Profile description text
                        Padding(
                          padding:
                              AppDimensions.kPaddingMenuProfileDescriptionTitle,
                          child: Text(
                            AppStrings.profileDescription,
                            style: context.theme.textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.w200,
                            ),
                          ),
                        ),

                        const SizedBox(height: AppDimensions.kSpacingLarge),
                      ],
                    ),
                  ),

                  // First shadow layer behind the stats card
                  Positioned(
                    bottom: AppNumbers.kMenuFirstPositionBottom,
                    left: AppNumbers.kMenuFirstPositionLeft,
                    right: AppNumbers.kMenuFirstPositionRight,
                    child: Container(
                      height: AppDimensions.kMenuSecondCardShadowSize,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: AppDimensions.kShadowBlurRadius,
                            color: context.theme.colorScheme.onSurface.withOpacity(
                              0.8,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Profile statistics card (Posts / Following / Followers)
                  Positioned(
                    bottom: AppNumbers.kMenuSecondPositionBottom,
                    left: AppNumbers.kMenuSecondPositionLeft,
                    right: AppNumbers.kMenuSecondPositionRight,
                    child: Container(
                      height: AppDimensions.kMenuSecondCardHeight,
                      decoration: BoxDecoration(
                        color: context.theme.colorScheme.primary,
                        borderRadius: AppDimensions.kSmallCircularBorderRadius,
                      ),
                      child: Row(
                        children: [
                          // Posts count section
                          Expanded(
                            flex: AppDimensions.kMenuFlexSize,
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.kMenuActiveColor,
                                borderRadius:
                                    AppDimensions.kSmallCircularBorderRadius,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AppStrings.profilePostCount,
                                    style: TextStyle(
                                      fontSize: AppNumbers.kFontSizeLarge,
                                      fontWeight: FontWeight.bold,
                                      color: context.theme.colorScheme.onPrimary,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: AppDimensions.kSpacingExtraSmall,
                                  ),
                                  Text(
                                    AppStrings.profilePostTitle,
                                    style: context.theme.textTheme.bodyLarge!
                                        .copyWith(
                                          fontWeight: FontWeight.w200,
                                          color:
                                              context.theme.colorScheme.onPrimary,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // Following count section
                          Expanded(
                            flex: AppDimensions.kMenuFlexSize,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppStrings.profileFollowingCount,
                                  style: TextStyle(
                                    fontSize: AppNumbers.kFontSizeLarge,
                                    fontWeight: FontWeight.bold,
                                    color: context.theme.colorScheme.onPrimary,
                                  ),
                                ),
                                const SizedBox(
                                  height: AppDimensions.kSpacingExtraSmall,
                                ),
                                Text(
                                  AppStrings.profileFollowingTitle,
                                  style: context.theme.textTheme.bodyLarge!
                                      .copyWith(
                                        fontWeight: FontWeight.w200,
                                        color: context.theme.colorScheme.onPrimary,
                                      ),
                                ),
                              ],
                            ),
                          ),

                          // Followers count section
                          Expanded(
                            flex: AppDimensions.kMenuFlexSize,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppStrings.profileFollowersCount,
                                  style: TextStyle(
                                    fontSize: AppNumbers.kFontSizeLarge,
                                    fontWeight: FontWeight.bold,
                                    color: context.theme.colorScheme.onPrimary,
                                  ),
                                ),
                                const SizedBox(
                                  height: AppDimensions.kSpacingExtraSmall,
                                ),
                                Text(
                                  AppStrings.profileFollowersTitle,
                                  style: context.theme.textTheme.bodyLarge!
                                      .copyWith(
                                        fontWeight: FontWeight.w200,
                                        color: context.theme.colorScheme.onPrimary,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              // Posts section container
              Container(
                decoration: BoxDecoration(
                  color: context.theme.colorScheme.surface,
                  borderRadius: AppDimensions.kCustomBorderRadius,
                ),
                child: Column(
                  children: [
                    // Posts header row (title + layout icons)
                    Padding(
                      padding: AppDimensions.kPaddingMenuPosts,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              AppStrings.profilePostsTitle,
                              style: context.theme.textTheme.titleLarge,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Assets.images.icons.grid.svg(),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Assets.images.icons.table.svg(),
                          ),
                        ],
                      ),
                    ),

                    // Loop through posts and render each widget
                    for (var i = 0; i < context.posts.length; i++) Post(post: context.posts[i]),

                    SizedBox(height: AppDimensions.kSpacingHuge),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
