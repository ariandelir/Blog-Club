import 'package:blogclub/core/constants/colors.dart';
import 'package:blogclub/core/constants/dimensions.dart';
import 'package:blogclub/core/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:blogclub/core/data/data.dart';

/// Fullscreen viewer for stories with progress indicators
class StoryViewer extends StatefulWidget {
  final StoryData story;
  final List<StoryData> stories;

  const StoryViewer({super.key, required this.story, required this.stories});

  @override
  State<StoryViewer> createState() => _StoryViewerState();
}

class _StoryViewerState extends State<StoryViewer>
    with SingleTickerProviderStateMixin {
  late AnimationController progressController;
  late int currentIndex;

  @override
  void initState() {
    super.initState();

    // Set current story index
    currentIndex = widget.stories.indexOf(widget.story);

    // Animation controller for the progress bar
    progressController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: AppDimensions.kStoryDuration),
    );

    // Move to next story when progress completes
    progressController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _nextStory();
      }
    });

    progressController.forward();
  }

  @override
  void dispose() {
    progressController.dispose();
    super.dispose();
  }

  // Pause story progress
  void _pause() => progressController.stop();

  // Resume story progress
  void _resume() => progressController.forward();

  // Show next story or close viewer if at last story
  void _nextStory() {
    if (currentIndex < widget.stories.length - 1) {
      setState(() {
        currentIndex++;
        progressController.reset();
        progressController.forward();
      });
    } else {
      Navigator.pop(context);
    }
  }

  // Show previous story if available
  void _previousStory() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
        progressController.reset();
        progressController.forward();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final story = widget.stories[currentIndex];

    return GestureDetector(
      // Tap left/right to move previous/next story
      onTapUp: (details) {
        final width = MediaQuery.of(context).size.width;
        if (details.localPosition.dx < width / 2) {
          _previousStory();
        } else {
          _nextStory();
        }
      },
      onLongPress: _pause, // Hold to pause
      onLongPressUp: _resume, // Release to resume
      child: Scaffold(
        backgroundColor: AppColors.kBlack,
        body: Stack(
          children: [
            // Story image
            Center(
              child: Image.asset(
                AppStrings.storyImage(story.imageFileName),
                fit: BoxFit.contain,
              ),
            ),

            // Story progress indicators at top
            Positioned(
              top: AppNumbers.kStoryFirstPositionTop,
              left: AppNumbers.kStoryFirstPositionLeft,
              right: AppNumbers.kStoryFirstPositionRight,
              child: Row(
                children: List.generate(
                  widget.stories.length,
                  (i) => Expanded(
                    child: Padding(
                      padding: AppDimensions.kPaddingStoryViewer,
                      child: LinearProgressIndicator(
                        value: i < currentIndex
                            ? 1
                            : i == currentIndex
                            ? progressController.value
                            : 0,
                        backgroundColor: AppColors.kGray,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          AppColors.kWhite,
                        ),
                        minHeight: AppDimensions.kStoryMinHeight,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // Story name and close button
            Positioned(
              top: AppNumbers.kStorySecondPositionTop,
              left: AppNumbers.kStorySecondPositionLeft,
              right: AppNumbers.kStorySecondPositionRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    story.name,
                    style: const TextStyle(
                      color: AppColors.kWhite,
                      fontSize: AppNumbers.kFontSizeLarge,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close, color: AppColors.kWhite),
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
