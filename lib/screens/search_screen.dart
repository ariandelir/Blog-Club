import 'package:blogclub/core/constants/strings.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar showing the search title
      appBar: AppBar(
        title: Text(
          AppStrings.searchAppbarTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: false,
      ),

      // Placeholder body for future search UI
      body: Container(),
    );
  }
}
