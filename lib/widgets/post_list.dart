import 'package:blogclub/core/constants/colors.dart';
import 'package:blogclub/core/constants/dimensions.dart';
import 'package:blogclub/core/constants/strings.dart';
import 'package:blogclub/core/data/data.dart';
import 'package:blogclub/gen/fonts.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// A vertical list of posts displayed on the Home screen
class PostList extends StatelessWidget {
  const PostList({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve posts from the local database
    final posts = AppDatabase.posts;

    return Column(
      children: [
        // Header row: Latest News title + "More" button
        Padding(
          padding: AppDimensions.kPaddingPostList,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                AppStrings.homeLatestNewsTitle,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  AppStrings.homeMoreTitle,
                  // ignore: deprecated_member_use
                  style: TextStyle(color: Color(AppColors.kPrimaryColor.value)),
                ),
              ),
            ],
          ),
        ),
        // Scrollable list of posts
        ListView.builder(
          physics: ClampingScrollPhysics(),
          itemCount: posts.length,
          shrinkWrap: true,
          itemExtent: AppDimensions.kPostItemExtentSize,
          itemBuilder: (context, index) {
            final post = posts[index];
            return Post(post: post); // Single post widget
          },
        ),
      ],
    );
  }
}

/// Individual post widget displaying image, title, caption, likes, time, and bookmark
class Post extends StatelessWidget {
  const Post({super.key, required this.post});

  final PostData post;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppDimensions.kMarginPost,
      decoration: BoxDecoration(
        color: AppColors.kWhite,
        borderRadius: AppDimensions.kMediumCircularBorderRadius,
        boxShadow: [
          BoxShadow(
            blurRadius: AppDimensions.kShadowBlurRadius,
            color: AppColors.kPostShadowColor,
          ),
        ],
      ),
      child: Row(
        children: [
          // Post image on the left
          ClipRRect(
            borderRadius: AppDimensions.kPostImageBorderRadius,
            child: Image.asset(
              AppStrings.smallPostImage(post.imageFileName),
              width: AppDimensions.kPostImageSize,
            ),
          ),
          // Post content on the right
          Expanded(
            child: Padding(
              padding: AppDimensions.kPaddingPost,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Post caption
                  Text(
                    post.caption,
                    style: TextStyle(
                      fontFamily: FontFamily.avenir,
                      fontSize: AppNumbers.kFontSizeSmall,
                      // ignore: deprecated_member_use
                      color: Color(AppColors.kPrimaryColor.value),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: AppDimensions.kSpacingSmall),
                  // Post title
                  Text(
                    post.title,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SizedBox(height: AppDimensions.kSpacingMedium),
                  // Likes, time, and bookmark row
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      // Likes icon
                      Icon(
                        CupertinoIcons.hand_thumbsup,
                        size: AppNumbers.kFontSizeMedium,
                        color: Theme.of(context).textTheme.bodyMedium!.color,
                      ),
                      SizedBox(width: AppDimensions.kSpacingExtraSmall),
                      // Likes count
                      Text(
                        post.likes,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(width: AppDimensions.kSpacingMedium),
                      // Time icon
                      Icon(
                        CupertinoIcons.clock,
                        size: AppNumbers.kFontSizeMedium,
                        color: Theme.of(context).textTheme.bodyMedium!.color,
                      ),
                      SizedBox(width: AppDimensions.kSpacingExtraSmall),
                      // Post time
                      Text(
                        post.time,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      // Bookmark icon aligned to the right
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            post.isBookmarked
                                ? CupertinoIcons.bookmark_fill
                                : CupertinoIcons.bookmark,
                            size: AppNumbers.kFontSizeMedium,
                            color: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.color,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
