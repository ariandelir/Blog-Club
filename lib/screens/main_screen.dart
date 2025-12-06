import 'package:blogclub/core/constants/dimensions.dart';
import 'package:blogclub/screens/article_sceen.dart';
import 'package:blogclub/screens/home_screen.dart';
import 'package:blogclub/screens/menu_screen.dart';
import 'package:blogclub/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'search_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

// Screen index constants
const int homeIndex = 0;
const int articleIndex = 1;
const int searchIndex = 2;
const int menuIndex = 3;

class _MainScreenState extends State<MainScreen> {
  // Stores currently selected tab index
  int selectedScreenIndex = homeIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Keeps screens alive while switching tabs
          IndexedStack(
            index: selectedScreenIndex,
            children: [
              HomeScreen(),
              ArticleScreen(),
              SearchScreen(),
              MenuScreen(),
            ],
          ),

          // Custom bottom navigation positioned above bottom edge
          Positioned(
            bottom: AppNumbers.kMainPositionBottom,
            left: AppNumbers.kMainPositionLeft,
            right: AppNumbers.kMainPositionRight,
            child: BottomNavigation(
              selectedIndex: selectedScreenIndex,
              onTap: (int index) {
                // Update UI when user selects another tab
                setState(() {
                  selectedScreenIndex = index;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
