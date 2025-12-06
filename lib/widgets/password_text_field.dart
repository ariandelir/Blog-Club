import 'package:blogclub/core/constants/dimensions.dart';
import 'package:blogclub/core/constants/strings.dart';
import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  /// Controls whether the password is visible or hidden
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      /// Hides the password content based on [obscureText]
      obscureText: obscureText,

      /// Disables suggestions for security
      enableSuggestions: false,

      /// Disables autocorrect for password fields
      autocorrect: false,

      decoration: InputDecoration(
        /// Password input label text
        label: const Text(AppStrings.authPassword),

        /// "Show / Hide" button inside the text field
        suffix: InkWell(
          /// Toggles password visibility when tapped
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          },

          /// Show/Hide text depending on password state
          child: Text(
            obscureText
                ? AppStrings.authShowPassword
                : AppStrings.authHidePassword,
            style: TextStyle(
              fontSize: AppNumbers.kFontSizeSmall,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}
