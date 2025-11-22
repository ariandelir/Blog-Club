import 'package:flutter/material.dart';
import 'package:blogclub/data.dart';

class StoryViewer extends StatefulWidget {
  final StoryData story;
  final List<StoryData> stories;

  const StoryViewer({
    super.key,
    required this.story,
    required this.stories,
  });

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

    currentIndex = widget.stories.indexOf(widget.story);

    progressController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

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

  void _pause() => progressController.stop();
  void _resume() => progressController.forward();

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
      onTapUp: (details) {
        final width = MediaQuery.of(context).size.width;
        if (details.localPosition.dx < width / 2) {
          _previousStory();
        } else {
          _nextStory();
        }
      },
      onLongPress: _pause,
      onLongPressUp: _resume,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Center(
              child: Image.asset(
                'assets/images/stories/${story.imageFileName}',
                fit: BoxFit.contain,
              ),
            ),

            Positioned(
              top: 50,
              left: 10,
              right: 10,
              child: Row(
                children: List.generate(
                  widget.stories.length,
                  (i) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: LinearProgressIndicator(
                        value: i < currentIndex
                            ? 1
                            : i == currentIndex
                                ? progressController.value
                                : 0,
                        backgroundColor: Colors.white24,
                        valueColor:
                            const AlwaysStoppedAnimation<Color>(Colors.white),
                        minHeight: 4,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Positioned(
              top: 95,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    story.name,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close, color: Colors.white),
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