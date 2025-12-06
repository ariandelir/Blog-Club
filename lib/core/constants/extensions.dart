import 'package:blogclub/core/data/data.dart';
import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  ThemeData get theme => Theme.of(this);

  List<StoryData> get stories => AppDatabase.stories;
  List<PostData> get posts => AppDatabase.posts;
  List<OnBoardingItem> get onBoardingItems => AppDatabase.onBoardingItems;
  List<Category> get categories => AppDatabase.categories;
}
