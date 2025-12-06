import 'package:blogclub/core/constants/dimensions.dart';
import 'package:blogclub/gen/assets.gen.dart';
import 'package:blogclub/screens/onboarding_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Delay for splash duration then navigate to OnBoardingScreen
    Future.delayed(Duration(seconds: AppDimensions.kSplashDuration)).then((_) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background splash image stretched to cover entire screen
          Positioned.fill(
            child: Assets.images.background.splash.image(fit: BoxFit.cover),
          ),

          // App Logo positioned in the center
          Center(
            child: Assets.images.icons.logo.svg(
              width: AppDimensions.kSplashLogoSize,
            ),
          ),
        ],
      ),
    );
  }
}
