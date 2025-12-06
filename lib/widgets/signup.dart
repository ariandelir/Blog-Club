import 'package:blogclub/core/constants/colors.dart';
import 'package:blogclub/core/constants/dimensions.dart';
import 'package:blogclub/core/constants/extensions.dart';
import 'package:blogclub/core/constants/strings.dart';
import 'package:blogclub/gen/assets.gen.dart';
import 'package:blogclub/widgets/password_text_field.dart';
import 'package:flutter/material.dart';

/// Signup form widget displayed on the Signup tab of AuthScreen
class Signup extends StatelessWidget {
  const Signup({super.key,});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Welcome title for signup
        Text(
          AppStrings.authSignupWelcomeTitle,
          style: context.theme.textTheme.headlineMedium,
        ),
        const SizedBox(height: AppDimensions.kSpacingSmall),
        // Hint/description text below the title
        Text(
          AppStrings.authSignupHintTitle,
          style: context.theme.textTheme.titleMedium!.apply(fontSizeFactor: 0.8),
        ),
        const SizedBox(height: AppDimensions.kSpacingMedium),
        // Full name input field
        const TextField(
          decoration: InputDecoration(
            label: Text(AppStrings.authSignupFullname),
          ),
        ),
        // Username input field
        const TextField(
          decoration: InputDecoration(
            label: Text(AppStrings.authSignupUsername),
          ),
        ),
        // Password input field with show/hide toggle
        const PasswordTextField(),
        const SizedBox(height: AppDimensions.kSpacingLarge),
        // Signup button
        ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(AppColors.kPrimaryColor),
            minimumSize: WidgetStateProperty.all(
              Size(
                MediaQuery.of(context).size.width,
                AppDimensions.kSignupButtonSize,
              ),
            ),
            shape: WidgetStateProperty.all(
              AppDimensions.kSignupButtonBorderRadius,
            ),
          ),
          child: Text(
            AppStrings.authSignupTitle.toUpperCase(),
            style: TextStyle(color: AppColors.kOnPrimaryColor),
          ),
        ),
        const SizedBox(height: AppDimensions.kSpacingMedium),
        // Or sign up with social media text
        const Center(
          child: Text(
            AppStrings.authSignupGoogleMethod,
            style: TextStyle(letterSpacing: AppDimensions.kSignupLetterSpacing),
          ),
        ),
        const SizedBox(height: AppDimensions.kSpacingMedium),
        // Row of social login icons: Google, Facebook, Twitter
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.icons.google.image(
              width: AppDimensions.kSignupLogosSize,
              height: AppDimensions.kSignupLogosSize,
            ),
            const SizedBox(width: AppDimensions.kSpacingLarge),
            Assets.images.icons.facebook.image(
              width: AppDimensions.kSignupLogosSize,
              height: AppDimensions.kSignupLogosSize,
            ),
            const SizedBox(width: AppDimensions.kSpacingLarge),
            Assets.images.icons.twitter.image(
              width: AppDimensions.kSignupLogosSize,
              height: AppDimensions.kSignupLogosSize,
            ),
          ],
        ),
      ],
    );
  }
}
