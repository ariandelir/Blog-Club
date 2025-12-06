import 'package:blogclub/core/constants/dimensions.dart';
import 'package:blogclub/core/constants/extensions.dart';
import 'package:blogclub/core/constants/strings.dart';
import 'package:blogclub/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Article detail screen displaying title, author info, image, and content.
class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Floating like button at bottom center
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(
          bottom: AppDimensions.kPaddinFloatingActionButton,
        ),
        child: Container(
          width: AppDimensions.kArticleBoxWidth,
          height: AppDimensions.kArticleBoxHeight,
          decoration: BoxDecoration(
            color: context.theme.colorScheme.primary,
            borderRadius: AppDimensions.kMediumBorderRadius,
            boxShadow: [
              BoxShadow(
                blurRadius: AppDimensions.kShadowBlurRadius,
                color: context.theme.colorScheme.primary.withOpacity(0.5),
              ),
            ],
          ),
          child: InkWell(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Assets.images.icons.thumbs.svg(),
                const SizedBox(width: AppDimensions.kSpacingSmall),
                Text(
                  AppStrings.articleLikesCount,
                  style: TextStyle(
                    fontSize: AppNumbers.kFontSizeMedium,
                    fontWeight: FontWeight.w400,
                    color: context.theme.colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      backgroundColor: context.theme.colorScheme.surface,

      body: Stack(
        children: [
          // Scrollable article content
          CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              /// AppBar with article title and options
              SliverAppBar(
                title: const Text(AppStrings.articleAppbarTitle),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz_rounded),
                  ),
                  const SizedBox(width: AppDimensions.kSpacingMedium),
                ],
              ),

              /// Main article content list
              SliverList(
                delegate: SliverChildListDelegate.fixed([
                  // Article title
                  Padding(
                    padding: AppDimensions.kPaddinArticleTitle,
                    child: Text(
                      AppStrings.articleTitle,
                      style: context.theme.textTheme.headlineMedium,
                    ),
                  ),

                  // Author profile section
                  Padding(
                    padding: AppDimensions.kPaddinArticleProfileCard,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: AppDimensions.kMediumBorderRadius,
                          child: Assets.images.stories.story9.image(
                            width: AppDimensions.kArticleProfileWidth,
                            height: AppDimensions.kArticleProfileHeight,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: AppDimensions.kSpacingMedium),

                        /// Author name & posting time
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppStrings.articleUsername,
                                style: context.theme.textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                height: AppDimensions.kSpacingExtraSmall,
                              ),
                              const Text(AppStrings.articlePostingTime),
                            ],
                          ),
                        ),

                        /// Share & bookmark buttons
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            CupertinoIcons.share,
                            color: context.theme.colorScheme.primary,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            CupertinoIcons.bookmark,
                            color: context.theme.colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// Main article image
                  ClipRRect(
                    borderRadius: AppDimensions.kCustomBorderRadius,
                    child: Assets.images.background.singlePost.image(),
                  ),

                  /// Sub-title of article body
                  Padding(
                    padding: AppDimensions.kPaddingArticleBodyTitle,
                    child: Text(
                      AppStrings.articleBodyTitle,
                      style: context.theme.textTheme.headlineSmall,
                    ),
                  ),

                  /// Article text content
                  Padding(
                    padding: AppDimensions.kPaddingArticleCaption,
                    child: Text(
                      AppStrings.articleCaption,
                      style: context.theme.textTheme.bodyMedium,
                    ),
                  ),

                  const SizedBox(height: AppDimensions.kSpacingExtraLarge),
                ]),
              ),
            ],
          ),

          /// Top-to-bottom fade shadow for floating button visibility
          Positioned(
            bottom: AppNumbers.kArticleShadowPosition,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: AppDimensions.kArticleShadowSize,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    context.theme.colorScheme.surface,
                    context.theme.colorScheme.surface.withOpacity(0),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
