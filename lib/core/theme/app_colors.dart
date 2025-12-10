import 'package:flutter/material.dart';

/// App color definitions
/// All colors used throughout the app should be defined here
/// Dark theme with light green accents (matching Abshr style)
class AppColors {
  AppColors._();

  // Primary Colors - Light Green (Accent)
  static const Color primary = Color(0xFF4CAF50); // Light green
  static const Color primaryDark = Color(0xFF388E3C);
  static const Color primaryLight = Color(0xFF81C784);

  // Secondary Colors
  static const Color secondary = Color(0xFF66BB6A);
  static const Color secondaryDark = Color(0xFF2E7D32);
  static const Color secondaryLight = Color(0xFFA5D6A7);

  // Background Colors - Dark Theme
  static const Color background = Color(0xFF1A1A1A); // Dark grey/black
  static const Color backgroundSecondary = Color(0xFF2C2C2C); // Slightly lighter dark grey
  static const Color surface = Color(0xFFFFFFFF); // White cards
  static const Color surfaceDark = Color(0xFFF5F5F5); // Light grey for cards on light backgrounds
  static const Color cardBackground = Color(0xFFF5F5F5); // Light grey card background (like in image)
  static const Color cardBackgroundWhite = Color(0xFFFFFFFF); // White card background (for forms)

  // Text Colors - Dark Theme
  static const Color textPrimaryDark = Color(0xFFFFFFFF); // White text on dark
  static const Color textSecondaryDark = Color(0xFFB0B0B0); // Light grey text
  static const Color textHintDark = Color(0xFF757575); // Grey hint text
  
  // Text Colors - Light Theme
  static const Color textPrimaryLight = Color(0xFF212121); // Dark text on light
  static const Color textSecondaryLight = Color(0xFF757575); // Grey text
  static const Color textHintLight = Color(0xFF9E9E9E); // Light grey hint text
  
  // Common text colors
  static const Color textOnPrimary = Color(0xFFFFFFFF); // White text on green buttons
  static const Color textOnDark = Color(0xFFFFFFFF); // White text on dark backgrounds
  static const Color textOnLight = Color(0xFF212121); // Dark text on light cards

  // Status Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFE53935);
  static const Color warning = Color(0xFFFF9800);
  static const Color info = Color(0xFF2196F3);

  // Border Colors - Dark Theme
  static const Color borderDark = Color(0xFF424242); // Dark border
  
  // Border Colors - Light Theme
  static const Color borderLight = Color(0xFFE0E0E0); // Light border for cards
  
  // Common border colors
  static const Color borderFocus = Color(0xFF4CAF50); // Green focus border

  // App Bar Colors
  static const Color appBarBackground = Color(0xFF2C2C2C); // Dark grey app bar (dark theme)
  static const Color appBarBackgroundDark = Color(0xFF2C2C2C); // Dark grey app bar
  static const Color appBarBackgroundLight = Color(0xFFF5F5F5); // Light grey app bar (light theme)

  // Background Colors - Light Theme
  static const Color backgroundLight = Color(0xFFFFFFFF); // White background (light theme)
  static const Color backgroundSecondaryLight = Color(0xFFF5F5F5); // Light grey (light theme)

  // Chart Colors
  static const List<Color> chartColors = [
    Color(0xFF4CAF50), // Green
    Color(0xFF66BB6A), // Light green
    Color(0xFFFF9800), // Orange
    Color(0xFFE53935), // Red
    Color(0xFF2196F3), // Blue
    Color(0xFF9C27B0), // Purple
  ];
}

