![Minion App Screenshot](https://i.imgur.com/0LM5B5Q.png)

# Blog Club

A modern Flutter blog application built on Clean Architecture. The project implements Custom Navigation, Tabbed Authentication (Auth) Flow, and a dynamic Story Viewer. The use of Type-Safe Assets and Modular Design principles ensures high code quality and scalability.

---

## Overview

For help getting started with Flutter, view our online [documentation](https://flutter.dev/).                                                  
BlogClub is a modern, feature-rich content application that manages the complete user lifecycle, starting with a visual Onboarding sequence and a dedicated Authentication module (Login/Signup). All primary content, including news articles and dynamic stories, is accessed via a custom Bottom Navigation Bar leading to a highly organized Main Feed. The application emphasizes a smooth, responsive user experience optimized for content discovery across mobile devices.

---

## ✨ Key Features
- Clean Architecture & Modular Design principles for maintainability.
- Tabbed Auth Flow: Seamless transition between Login and Signup forms on a single screen.
- Reusable Password Input: Custom PasswordTextField with built-in visibility toggle (Show/Hide).
- Custom, stateful Bottom Navigation: Unique design using IndexedStack to preserve screen state across tabs.
- Dynamic Story Status: Story cards utilize gradients and dotted borders to visually distinguish between viewed and unviewed content.
- Full-screen Animated Story Viewer: Implemented with an AnimationController for precise progress indication.
- Multi-section Home Feed: Organized layout combining horizontal Category Slider, a vertical Post List, and the Story List.
- Dedicated Profile Section: Includes a user profile card and post view with visual layout toggles (Grid/Table icons).
- High Code Quality: Centralized constants and utilization of Type-Safe Assets (flutter_gen) and Context Extensions.

---

## 🛠 Technologies & Tools

BlogClub is built using the Flutter framework and modern packages to ensure high performance, responsiveness, and adherence to a Clean Architecture model:

- Flutter & Dart – Core application framework and language for developing the cross-platform codebase.
- Clean Architecture – `Code structured` into separate layers (e.g., Constants, Data, Presentation) for high maintainability.
- Type-Safe Assets – Utilizes `flutter_gen` for static, compile-time safe access to all images, SVGs, and fonts.
- Custom Theming – Centralized `theme configuration` using the Avenir font family and custom ColorScheme.
- flutter_svg – Used for rendering high-quality, scalable vector graphics icons throughout the app.
- dotted_border – Implemented to create the custom visual differentiation for viewed story avatars.
- smooth_page_indicator – Provides the polished, animated page indicators for the multi-step Onboarding flow.
- UI Components – Integrates `carousel_slider` for the horizontal category list and CupertinoIcons for system-style UI icons.

---


## 📌 Notes

- Make sure your Flutter SDK is version **>=3.10.0** as specified in `pubspec.yaml`.
- All images and fonts must be present in the `assets/` folder; otherwise, the app may crash.
- The app utilizes a centralized, custom Light Theme defined in `theme_config.dart`, with specific text styles and colors based on the Avenir font family.
- All content Stories, Posts and Categories is currently loaded from the static mock data provider `data.dart` and must be integrated with a live API for production use.

---

## 💡 Future Improvements

The project's Clean Architecture makes it ready for these scaling and feature enhancements:

- Global State Management: Integrate a dedicated state management solution such as `Riverpod` or `Provider` to handle complex application data flow and manage state across larger projects.
- Real API Integration: Replace the static Mock Data Provider `data.dart` layer with live API calls to fetch and display dynamic content for a production environment.
- Form Validation: Implement full form validation for all input fields within the Login and Signup screens to improve data integrity and user experience.
- UI Feature Completion: Fully implement placeholder functionalities, such as the Search Screen logic and the ability to toggle the post view layout Grid/Table icons on the Profile Screen.
- Interactive Features: Implement the logic for core user interactions, such as bookmarking/liking articles (currently represented by static icons).
- Dark Mode Support: Expand `theme_config.dart` to include a complete Dark Theme definition and add the necessary toggle logic for dynamic theme switching.

---

## Contributing & Pull Requests

Contributions to BlogClub are highly welcome. To ensure a smooth review and integration process, please adhere to the following guidelines:

- Maintain consistent code style and formatting, particularly aligning with the existing Clean Architecture structure.
- Use clear and descriptive titles and detailed descriptions for your pull requests.
- Submit pull requests against the main branch.
- Check for existing issues before creating a new one to avoid duplication of effort.
- Ensure that any new assets are referenced using the flutter_gen (type-safe) standards.
- Follow the established project conventions to ensure consistency and maintainability.
- Contribute thoughtfully and professionally.

Typically, pull requests and issues are reviewed within 24-48 hours.

---

## Created & Maintained By

[Arian Delir G.]  

Connect with me professionally:  
- [GitHub](https://github.com/ariandelir)  

---

## License

Copyright 2025 Arian Delir G.

Licensed under the Apache License, Version 2.0 (the "License");  
you may not use this file except in compliance with the License.  
You may obtain a copy of the License at:

[http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software  
distributed under the License is distributed on an "AS IS" BASIS,  
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  
See the License for the specific language governing permissions and  
limitations under the License.


## 🚀 Getting Started
For help on editing plugin code, view the [documentation](https://docs.flutter.dev/packages-and-plugins/using-packages#edit-code).
To run BlogClub locally, an extra build step is required due to the use of `flutter_gen` for type-safe asset management.

Installation and Run:

```bash
# Clone the repository
git clone [YOUR_REPOSITORY_LINK_HERE]

# Navigate into the project directory
cd blogclub

# Install all dependencies
flutter pub get

# Generate type-safe asset code (REQUIRED for image/icon references)
flutter pub run build_runner build --delete-conflicting-outputs

# Run the application
flutter run
