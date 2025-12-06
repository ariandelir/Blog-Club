import 'package:blogclub/core/constants/colors.dart';
import 'package:blogclub/core/constants/dimensions.dart';
import 'package:blogclub/core/constants/strings.dart';
import 'package:blogclub/core/data/data.dart';
import 'package:blogclub/widgets/story_viewer.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

/// Horizontal scrollable list of stories
class StoryList extends StatefulWidget {
  final List<StoryData> stories;
  const StoryList({super.key, required this.stories});

  @override
  State<StoryList> createState() => _StoryListState();
}

class _StoryListState extends State<StoryList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.kStoryCardHeight,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: AppDimensions.kPaddingStoryListView,
        itemCount: widget.stories.length,
        itemBuilder: (context, index) {
          final story = widget.stories[index];
          return GestureDetector(
            // On tap, open StoryViewer and mark story as viewed
            onTap: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      StoryViewer(story: story, stories: widget.stories),
                ),
              );

              setState(() {
                story.isViewed = true;
              });
            },
            child: _StoryItem(story: story),
          );
        },
      ),
    );
  }
}

/// Individual story item widget
class _StoryItem extends StatelessWidget {
  final StoryData story;
  const _StoryItem({required this.story});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: AppDimensions.kMarginStoryItem,
      child: Column(
        children: [
          Stack(
            children: [
              // Display border depending on whether story is viewed
              story.isViewed ? viewedBorder() : unViewedBorder(),
              // Story icon positioned at bottom right
              Positioned(
                bottom: AppNumbers.kStoryPositionBottom,
                right: AppNumbers.kStoryPositionRight,
                child: Image.asset(
                  AppStrings.icon(story.iconFileName),
                  width: AppDimensions.kStoryIconSize,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.kSpacingSmall),
          // Story name below the image
          Text(story.name),
        ],
      ),
    );
  }

  /// Unviewed story with gradient border
  Widget unViewedBorder() {
    return Container(
      width: AppDimensions.storyBorderSize,
      height: AppDimensions.storyBorderSize,
      decoration: BoxDecoration(
        borderRadius: AppDimensions.kMediumCircularBorderRadius,
        gradient: LinearGradient(colors: AppColors.kUnviewedStoryColors),
      ),
      child: Container(
        margin: AppDimensions.kMarginUnviewedBorder,
        padding: AppDimensions.kPaddingUnviewedBorder,
        decoration: BoxDecoration(
          color: AppColors.kWhite,
          borderRadius: AppDimensions.kMediumCircularBorderRadius,
        ),
        child: image(),
      ),
    );
  }

  /// Viewed story with dotted border
  Widget viewedBorder() {
    return SizedBox(
      width: AppDimensions.storyBorderSize,
      height: AppDimensions.storyBorderSize,
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          padding: AppDimensions.kPaddingViewedBorder,
          dashPattern: AppDimensions.kDashPattern,
          strokeWidth: AppDimensions.kStrokeWidthSize,
          color: AppColors.kViewedStoryColor,
          radius: AppDimensions.kViewedBorder,
        ),
        child: ClipRRect(
          borderRadius: AppDimensions.kMediumCircularBorderRadius,
          child: image(),
        ),
      ),
    );
  }

  /// Story image widget used inside the borders
  Widget image() {
    return ClipRRect(
      borderRadius: AppDimensions.kStoryImageBorderRadius,
      child: Image.asset(AppStrings.storyImage(story.imageFileName)),
    );
  }
}
