// Define your custom color palette
import 'package:flutter/material.dart';

class MyThem {
// Define your custom color palette
  static Color primaryColor = const Color(0xffCBE4DE); // Light blue-gray
  static Color secondaryColor = const Color(0xff0E8388); // Dark teal
  static Color tertiaryColor = const Color(0xff2E4F4F); // Dark grayish-teal
  static Color accentColor = const Color(0xff2C3333); // Dark gray
  static Color white = Colors.white;
  static Color black = Colors.black;
  static Color grey = Colors.grey;

// **Here are some suggestions on how to use these colors in your Flutter app:**

// - **PrimaryColor (CBE4DE):** Use it for primary elements like app bars, buttons, and important text. It provides a calm and neutral base for your app's UI.
// - **SecondaryColor (0E8388):** Use it to highlight specific elements or sections, such as headlines, links, or interactive components. It adds a touch of vibrancy and visual interest.
// - **TertiaryColor (2E4F4F):** Use it as a background color for screens or containers to create a subtle contrast and depth. It sets a refined and elegant tone.
// - **AccentColor (2C3333):** Use it for text and icons to ensure readability and visual clarity. It complements the other colors while maintaining a clean and professional look.

// *|*Remember to adjust the colors and their usage based on your app's specific design and branding requirements.**

// Create a ThemeData object using colorScheme
  static ThemeData lightThem = ThemeData.light().copyWith();

//Normal text style
  static TextStyle nfontStyle = const TextStyle(fontSize: 16);
//title text style
  static TextStyle tfontStyle =
      const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
}
