import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/utils/theme_helper.dart';
import 'package:get/get.dart';

/// Custom button widget with primary, secondary, and full-width options
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isPrimary;
  final bool isFullWidth;
  final bool isLoading;
  final Color? customColor;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isPrimary = true,
    this.isFullWidth = true,
    this.isLoading = false,
    this.customColor,
  });

  @override
  Widget build(BuildContext context) {
    Color primaryColor;
    Color secondaryColor;
    
    if (customColor != null) {
      primaryColor = customColor!;
      secondaryColor = customColor!;
    } else {
      try {
        final args = Get.arguments;
        final role = args is Map<String, dynamic> ? args['role'] as String? : null;
        primaryColor = ThemeHelper.getPrimaryColor(role);
        secondaryColor = ThemeHelper.getSecondaryColor(role);
      } catch (e) {
        // Fallback to default green if arguments not available
        primaryColor = AppColors.primary;
        secondaryColor = AppColors.secondary;
      }
    }
    
    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      child: ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isPrimary ? primaryColor : secondaryColor,
          foregroundColor: AppColors.textOnPrimary,
          disabledBackgroundColor: AppColors.textSecondaryDark,
        ),
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.textOnPrimary),
                ),
              )
            : Text(text),
      ),
    );
  }
}

