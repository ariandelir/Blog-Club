import 'package:blogclub/data.dart';
import 'package:blogclub/story_viewer.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

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
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 32),
        itemCount: widget.stories.length,
        itemBuilder: (context, index) {
          final story = widget.stories[index];
          return GestureDetector(
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
            child: StoryItem(story: story),
          );
        },
      ),
    );
  }
}

// ------------------------------

class StoryItem extends StatelessWidget {
  final StoryData story;
  const StoryItem({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      child: Column(
        children: [
          Stack(
            children: [
              story.isViewed ? _viewedBorder() : _unviewedBorder(),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  'assets/images/icons/${story.iconFileName}',
                  width: 24,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(story.name),
        ],
      ),
    );
  }

  Widget _unviewedBorder() {
    return Container(
      width: 68,
      height: 68,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [
            Color(0xff376AED),
            Color(0xff49B0E2),
            Color(0xff9CECFB),
          ],
        ),
      ),
      child: Container(
        margin: const EdgeInsets.all(2),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
        ),
        child: _image(),
      ),
    );
  }

  Widget _viewedBorder() {
    return SizedBox(
width: 68,
      height: 68,
      child: DottedBorder( 
          options:  RoundedRectDottedBorderOptions(
           padding: EdgeInsets.all(7),
          dashPattern: [8, 2],
          strokeWidth: 2,
          color: Color(0xff7B8BB2), radius: Radius.circular(24),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: _image(),
        ),
      ),
    );
  }

  Widget _image() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(17),
      child: Image.asset('assets/images/stories/${story.imageFileName}'),
    );
  }
}
