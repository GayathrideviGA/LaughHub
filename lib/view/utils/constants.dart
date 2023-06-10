import 'package:flutter/material.dart';

// Color Constants
class AppColors {
  static Color primaryColor =
      Colors.blue[900]!; // Primary color for the main screen
  static Color fabColor = Colors.blue[500]!
      .withOpacity(0.6); // Color for the FAB (Floating Action Button)
  static Color textMainShade = Colors.white; // Color for main text
  static Color searchIcon =
      Colors.white.withOpacity(0.6); // Color for search icon
}

// Gradient Constants
class AppGradients {
  static Gradient backgroundGradient = LinearGradient(
    colors: [
      Colors.blue[900]!,
      Colors.blue[500]!,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ); // Background gradient for the app
  static Gradient randomCircleGradient = RadialGradient(
    colors: [
      Colors.blue[300]!.withOpacity(0),
      Colors.blue[300]!.withOpacity(0.5),
      Colors.blue[300]!.withOpacity(0),
    ],
  ); // Gradient for random circles
}

// String Constants
class AppStrings {
  static const String appName = 'Dad Jokes'; // Name of the app
  static const String errorTitle = 'Error'; // Title for error messages
  static const String errorMessage =
      'Failed to fetch joke.'; // Error message for failed joke fetching
  static const String searchJokes =
      'Search Jokes'; // Placeholder text for search field
  static const String ok = 'Ok'; // Text for the 'Ok' button
}

// Textstyles
class AppTextStyles {
  static TextStyle jokeTextStyle = TextStyle(
    height: 1.5,
    color: AppColors.textMainShade,
    fontSize: 20,
    fontWeight: FontWeight.w400,
  ); // Text style for jokes
  static TextStyle searchTextStyle = TextStyle(
    color: AppColors.textMainShade.withOpacity(0.6),
    fontSize: 14,
    fontWeight: FontWeight.w500,
  ); // Text style for search text
}
