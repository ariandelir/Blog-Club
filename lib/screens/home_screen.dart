import 'package:blogclub/core/constants/dimensions.dart';
import 'package:blogclub/core/constants/extensions.dart';
import 'package:blogclub/core/constants/strings.dart';
import 'package:blogclub/gen/assets.gen.dart';
import 'package:blogclub/widgets/category.dart';
import 'package:blogclub/widgets/post_list.dart';
import 'package:blogclub/widgets/story_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(), // Smooth iOS-like scroll physics
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top bar with title and notification icon
              Padding(
                padding: AppDimensions.kPaddingHomeFirst,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppStrings.homeTopAppbarTitle,
                      style: context.theme.textTheme.titleMedium,
                    ),
                    Assets.images.icons.notification.image(
                      width: AppDimensions.kHomeNotificationSize,
                      height: AppDimensions.kHomeNotificationSize,
                    ),
                  ],
                ),
              ),

              // Main page title
              Padding(
                padding: AppDimensions.kPaddingHomeSecond,
                child: Text(
                  AppStrings.homeAppbarTitle,
                  style: context.theme.textTheme.headlineMedium,
                ),
              ),

              // Horizontal story list
              StoryList(stories: context.stories),

              SizedBox(height: AppDimensions.kSpacingMedium),

              // Category horizontal list
              CategoryList(),

              // Vertical list of posts
              PostList(),

              SizedBox(height: AppDimensions.kSpacingHuge),
            ],
          ),
        ),
      ),
    );
  }
}
