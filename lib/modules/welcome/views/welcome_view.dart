import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../routes/app_routes.dart';

/// Welcome view - First screen before login
/// Shows Absher platform categories
class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isRTL = Get.locale?.languageCode == 'ar';

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.paddingL),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: AppSpacing.paddingXL * 2),
                
                // Welcome Title
                Text(
                  'welcome_title'.tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                
                const SizedBox(height: AppSpacing.paddingL),
                
                // Description
                Text(
                  'welcome_description'.tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? AppColors.textSecondaryDark
                            : AppColors.textSecondaryLight,
                      ),
                ),
                
                const SizedBox(height: AppSpacing.paddingXL * 2),
                
                // Cards
                _buildCategoryCard(
                  context,
                  title: 'absher_individuals'.tr,
                  description: 'absher_individuals_desc'.tr,
                  iconPath: 'assets/icons/indvidual.svg',
                  iconColor: AppColors.primary,
                  onTap: () => Get.toNamed(
                    AppRoutes.login,
                    arguments: {
                      'redirect': AppRoutes.home,
                      'role': 'individual',
                    },
                  ),
                ),
                
                const SizedBox(height: AppSpacing.paddingL),
                
                _buildCategoryCard(
                  context,
                  title: 'absher_businesses'.tr,
                  description: 'absher_businesses_desc'.tr,
                  iconPath: 'assets/icons/business.svg',
                  iconColor: AppColors.info,
                  onTap: () => Get.toNamed(
                    AppRoutes.login,
                    arguments: {
                      'redirect': AppRoutes.home,
                      'role': 'business',
                    },
                  ),
                ),
                
                const SizedBox(height: AppSpacing.paddingL),
                
                _buildCategoryCard(
                  context,
                  title: 'absher_government'.tr,
                  description: 'absher_government_desc'.tr,
                  iconPath: 'assets/icons/government.svg',
                  iconColor: AppColors.governmentPrimary, // Brown color
                  onTap: () => Get.toNamed(
                    AppRoutes.login,
                    arguments: {
                      'redirect': AppRoutes.home,
                      'role': 'government',
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(
    BuildContext context, {
    required String title,
    required String description,
    required String iconPath,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isRTL = Get.locale?.languageCode == 'ar';
    final cardColor = isDark 
        ? AppColors.backgroundSecondary 
        : AppColors.cardBackgroundWhite;

    return Card(
      elevation: isDark ? 0 : 2,
      color: cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSpacing.radiusL),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppSpacing.radiusL),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.paddingL),
          child: Row(
            textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Theme.of(context).brightness == Brightness.dark
                                ? AppColors.textOnDark
                                : AppColors.textOnLight,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: AppSpacing.paddingS),
                    Text(
                      description,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).brightness == Brightness.dark
                                ? AppColors.textSecondaryDark
                                : AppColors.textSecondaryLight,
                          ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.paddingL),
              // Icon - SVG
              _buildSvgIcon(iconPath, iconColor),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSvgIcon(String iconPath, Color color) {
    return SizedBox(
      width: 60,
      height: 60,
      child: SvgPicture.asset(
        iconPath,
        colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
        fit: BoxFit.contain,
      ),
    );
  }
}

