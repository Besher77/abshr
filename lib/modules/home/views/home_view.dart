import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/utils/theme_helper.dart';
import '../../../routes/app_routes.dart';

/// Home view - Main entry point
/// UI only - no business logic
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isRTL = Get.locale?.languageCode == 'ar';
    final args = Get.arguments;
    final role = args is Map<String, dynamic> ? args['role'] as String? : null;
    final primaryColor = ThemeHelper.getPrimaryColor(role);

    return Scaffold(
      appBar: CustomAppBar(
        titleKey: 'app_title',
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'settings_title'.tr,
            onPressed: () => Get.toNamed(AppRoutes.settings),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.paddingM),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: AppSpacing.paddingM),

                // Search Bar
                _buildSearchBar(context, isDark, isRTL),

                const SizedBox(height: AppSpacing.paddingL),

                // Cards Grid
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: AppSpacing.paddingM,
                  mainAxisSpacing: AppSpacing.paddingM,
                  childAspectRatio: 1.4,
                  children: _buildCards(context, primaryColor, args, role),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildCards(
    BuildContext context,
    Color primaryColor,
    dynamic args,
    String? role,
  ) {
    final cards = <Widget>[
      _buildServiceCard(
        context,
        Icons.directions_car_outlined,
        'vehicles'.tr,
        primaryColor,
        () {
          // Navigate to vehicles
        },
      ),
      _buildServiceCard(
        context,
        Icons.laptop_outlined,
        'my_services'.tr,
        primaryColor,
        () {
          // Navigate to my services
        },
      ),
      _buildServiceCard(
        context,
        Icons.construction_outlined,
        'labor'.tr,
        primaryColor,
        () {
          // Navigate to labor
        },
      ),
      _buildServiceCard(
        context,
        Icons.family_restroom,
        'family_members'.tr,
        primaryColor,
        () {
          // Navigate to family members
        },
      ),
    ];

    // Role-specific cards
    if (role == 'business') {
      cards.add(
        _buildServiceCard(
          context,
          Icons.bar_chart,
          'business_stats_title'.tr,
          primaryColor,
          () => Get.toNamed(AppRoutes.businessStats, arguments: args),
        ),
      );
    }

    if (role == 'individual') {
      cards.add(
        _buildServiceCard(
          context,
          Icons.home_work_outlined,
          'interactive_residency'.tr,
          primaryColor,
          () => Get.toNamed(AppRoutes.censusHub),
        ),
      );
    }

    if (role == 'government') {
      cards.addAll([
        _buildServiceCard(
          context,
          Icons.dashboard,
          'appointments'.tr,
          primaryColor,
          () => Get.toNamed(AppRoutes.dashboard, arguments: args),
        ),
        _buildServiceCard(
          context,
          Icons.analytics_outlined,
          'business_statistics_and_forecasts'.tr,
          primaryColor,
          () => Get.toNamed(AppRoutes.businessForecasts, arguments: args),
        ),
      ]);
    }











    return cards;
  }

  Widget _buildSearchBar(BuildContext context, bool isDark, bool isRTL) {
    final searchBarColor = isDark
        ? AppColors.backgroundSecondary
        : AppColors.backgroundSecondaryLight;
    final iconColor = isDark
        ? AppColors.textPrimaryDark
        : AppColors.textPrimaryLight;
    final hintColor = isDark
        ? AppColors.textHintDark
        : AppColors.textHintLight;

    return Container(
      decoration: BoxDecoration(
        color: searchBarColor,
        borderRadius: BorderRadius.circular(AppSpacing.radiusM),
      ),
      child: TextField(
        textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
        style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color),
        decoration: InputDecoration(
          hintText: 'search_placeholder'.tr,
          hintStyle: TextStyle(
            color: hintColor,
            fontSize: 14,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: iconColor,
            size: 20,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.paddingM,
            vertical: AppSpacing.paddingM,
          ),
        ),
      ),
    );
  }

  Widget _buildServiceCard(
    BuildContext context,
    IconData icon,
    String title,
    Color iconColor,
    VoidCallback onTap,
  ) {
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
          padding: const EdgeInsets.symmetric(
            vertical: AppSpacing.paddingM,
            horizontal: AppSpacing.paddingS,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 36,
                color: iconColor,
              ),
              const SizedBox(height: AppSpacing.paddingS),
              Text(
                title,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppColors.textOnDark
                          : AppColors.textOnLight,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
