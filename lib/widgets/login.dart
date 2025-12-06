import 'package:blogclub/core/constants/colors.dart';
import 'package:blogclub/core/constants/dimensions.dart';
import 'package:blogclub/core/constants/extensions.dart';
import 'package:blogclub/core/constants/strings.dart';
import 'package:blogclub/gen/assets.gen.dart';
import 'package:blogclub/screens/main_screen.dart';
import 'package:blogclub/widgets/password_text_field.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key, });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Login welcome title
        Text(
          AppStrings.authLoginWelcomeTitle,
          style: context.theme.textTheme.headlineMedium,
        ),

        const SizedBox(height: AppDimensions.kSpacingSmall),

        /// Short hint under the main title
        Text(
          AppStrings.authLoginHintTitle,
          style: context.theme.textTheme.titleMedium!.apply(fontSizeFactor: 0.8),
        ),

        const SizedBox(height: AppDimensions.kSpacingMedium),

        /// Username text field
        const TextField(
          decoration: InputDecoration(
            label: Text(AppStrings.authLoginUsername),
          ),
        ),

        /// Custom password input field
        const PasswordTextField(),

        const SizedBox(height: AppDimensions.kSpacingLarge),

        /// Login button
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
          },
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(AppColors.kPrimaryColor),
            minimumSize: WidgetStateProperty.all(
              Size(
                MediaQuery.of(context).size.width,
                AppDimensions.kLoginButtonSize,
              ),
            ),
            shape: WidgetStateProperty.all(
              AppDimensions.kLoginButtonBorderRadius,
            ),
          ),
          child: Text(
            AppStrings.authLoginTitle.toUpperCase(),
            style: const TextStyle(color: AppColors.kOnPrimaryColor),
          ),
        ),

        /// Forgot password section
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(AppStrings.authLoginForgotPassword),
            TextButton(
              onPressed: () {},
              child: const Text(AppStrings.authLoginResetPassword),
            ),
          ],
        ),

        const SizedBox(height: AppDimensions.kSpacingMedium),

        /// Google login text label
        const Center(
          child: Text(
            AppStrings.authLoginGoogleMethod,
            style: TextStyle(letterSpacing: AppDimensions.kSignupLetterSpacing),
          ),
        ),

        const SizedBox(height: AppDimensions.kSpacingMedium),

        /// Social login icons (Google, Facebook, Twitter)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.images.icons.google.image(
              width: AppDimensions.kLoginLogosSize,
              height: AppDimensions.kLoginLogosSize,
            ),
            const SizedBox(width: AppDimensions.kSpacingLarge),

            Assets.images.icons.facebook.image(
              width: AppDimensions.kLoginLogosSize,
              height: AppDimensions.kLoginLogosSize,
            ),
            const SizedBox(width: AppDimensions.kSpacingLarge),

            Assets.images.icons.twitter.image(
              width: AppDimensions.kLoginLogosSize,
              height: AppDimensions.kLoginLogosSize,
            ),
          ],
        ),
      ],
    );
  }
}
