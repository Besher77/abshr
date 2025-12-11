import 'dart:ui';

import '../theme/app_colors.dart';

/// Theme helper to get colors based on user role
class ThemeHelper {
  ThemeHelper._();

  /// Get primary color based on user role
  static Color getPrimaryColor(String? role) {
    if (role == 'business') return AppColors.businessPrimary;
    if (role == 'government') return AppColors.governmentPrimary;
    return AppColors.primary; // Default: individual (green)
  }

  /// Get primary dark color based on user role
  static Color getPrimaryDarkColor(String? role) {
    if (role == 'business') return AppColors.businessPrimaryDark;
    if (role == 'government') return AppColors.governmentPrimaryDark;
    return AppColors.primaryDark; // Default: individual (green)
  }

  /// Get primary light color based on user role
  static Color getPrimaryLightColor(String? role) {
    if (role == 'business') return AppColors.businessPrimaryLight;
    if (role == 'government') return AppColors.governmentPrimaryLight;
    return AppColors.primaryLight; // Default: individual (green)
  }

  /// Get border focus color based on user role
  static Color getBorderFocusColor(String? role) {
    if (role == 'business') return AppColors.businessBorderFocus;
    if (role == 'government') return AppColors.governmentBorderFocus;
    return AppColors.borderFocus; // Default: individual (green)
  }

  /// Get secondary color based on user role
  static Color getSecondaryColor(String? role) {
    if (role == 'business') return AppColors.businessSecondary;
    if (role == 'government') return AppColors.governmentSecondary;
    return AppColors.secondary; // Default: individual (green)
  }
}

