import 'package:abshr/core/widgets/custom_button.dart';
import 'package:abshr/modules/census/controllers/census_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_card.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/theme_helper.dart';
import '../../../routes/app_routes.dart';

/// Dashboard main view - UI only
class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());
    final args = Get.arguments;
    final role = args is Map<String, dynamic> ? args['role'] as String? : null;
    final causes = Get.put(CensusController());
    final primaryColor = ThemeHelper.getPrimaryColor(role);
    final secondaryColor = ThemeHelper.getSecondaryColor(role);

    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(
          titleKey: 'dashboard_title',
          showLanguageSwitcher: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.paddingM),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Total expats card
              // Citizens and Expats row
              Obx(() {
                final data = causes.censusData.value;
return              Row(
  children: [
    Expanded(
      child: CustomCard(
        child: Column(
          children: [
            Text(
              'citizens'.tr,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.textOnDark
                    : AppColors.textOnLight,
              ),
            ),
            const SizedBox(height: AppSpacing.paddingS),
            Text(
              _formatNumber(data!.citizens),
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: primaryColor,
              ),
            ),
          ],
        ),
      ),
    ),

    const SizedBox(width: AppSpacing.paddingM),
    Expanded(
      child: CustomCard(
        child: Column(
          children: [
            Text(
              'total_population'.tr,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.textOnDark
                    : AppColors.textOnLight,
              ),
            ),
            const SizedBox(height: AppSpacing.paddingS),
            Text(
              _formatNumber(data.totalPopulation),
              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: primaryColor,
              ),
            ),
          ],
        ),
      ),
    ),

    const SizedBox(width: AppSpacing.paddingM),
    Expanded(
      child: CustomCard(
        child: Column(
          children: [
            Text(
              'expats'.tr,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.textOnDark
                    : AppColors.textOnLight,
              ),
            ),
            const SizedBox(height: AppSpacing.paddingS),
            Text(
              _formatNumber(data.expats),
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: secondaryColor,
              ),
            ),
          ],
        ),
      ),
    ),
  ],
);
              },),


              const SizedBox(height: AppSpacing.paddingM),
      
              // Stats grid
              LayoutBuilder(
                builder: (context, constraints) {
                  // Responsive grid based on screen size
                  final screenWidth = constraints.maxWidth;
                  final crossAxisCount = screenWidth > 600 ? 3 : 2;
                  final childAspectRatio = screenWidth > 600 ? 1.3 : 1.4;
                  
                  return GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: AppSpacing.paddingM,
                    mainAxisSpacing: AppSpacing.paddingM,
                    childAspectRatio: childAspectRatio,
                    children: [
                  _buildStatCard(
                    context,
                    'by_nationality'.tr,
                    Icons.flag,
                    () => Get.toNamed(AppRoutes.dashboardStats, arguments: 'nationality'),
                    primaryColor,
                  ),
                  _buildStatCard(
                    context,
                    'by_city'.tr,
                    Icons.location_city,
                    () => Get.toNamed(AppRoutes.dashboardStats, arguments: 'city'),
                    primaryColor,
                  ),
      
                  _buildStatCard(
                    context,
                    'by_district'.tr,
                    Icons.map,
                    () => Get.toNamed(AppRoutes.dashboardStats, arguments: 'district'),
                    primaryColor,
                  ),
                  _buildStatCard(
                    context,
                    'by_gender'.tr,
                    Icons.people,
                    () => Get.toNamed(AppRoutes.dashboardStats, arguments: 'gender'),
                    primaryColor,
                  ),
                  _buildStatCard(
                    context,
                    'by_age'.tr,
                    Icons.calendar_today,
                    () => Get.toNamed(AppRoutes.dashboardStats, arguments: 'age'),
                    primaryColor,
                  ),
                  _buildStatCard(
                    context,
                    'by_job_type'.tr,
                    Icons.work,
                    () => Get.toNamed(AppRoutes.dashboardStats, arguments: 'job_type'),
                    primaryColor,
                  ),
                    ],
                  );
                },
              ),
              const SizedBox(height: AppSpacing.paddingM),
      
              // Charts and predictions
              const SizedBox(height: AppSpacing.paddingM),
      
              CustomButton(
                text: 'city_distribution'.tr,
                onPressed: () => Get.toNamed(AppRoutes.censusCityDistribution),
              ),
              const SizedBox(height: AppSpacing.paddingM),
              CustomButton(
                text: 'demographics'.tr,
                onPressed: () => Get.toNamed(AppRoutes.censusDemographics),
                isPrimary: false,
              ),
              const SizedBox(height: AppSpacing.paddingM),
              CustomButton(
                text: 'ai_forecasts'.tr,
                onPressed: () => Get.toNamed(AppRoutes.censusForecasts),
                isPrimary: false,
              ),
              const SizedBox(height: AppSpacing.paddingM),
              CustomButton(
                text: 'service_analytics'.tr,
                onPressed: () => Get.toNamed(AppRoutes.censusServices),
                isPrimary: false,
              ),
              const SizedBox(height: AppSpacing.paddingM),
              if (role == 'business')
                CustomButton(
                  text: 'business_stats_title'.tr,
                  onPressed: () => Get.toNamed(
                    AppRoutes.businessStats,
                    arguments: args,
                  ),
                  isPrimary: false,
                ),
              const SizedBox(height: AppSpacing.paddingM),
      
              CustomCard(
                onTap: () => Get.toNamed(AppRoutes.dashboardHeatmap),
                child: Row(
                  children: [
                    Icon(Icons.map, color: primaryColor),
                    const SizedBox(width: AppSpacing.paddingM),
                        Expanded(
                      child: Text(
                        'heatmap'.tr,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Theme.of(context).brightness == Brightness.dark
                                  ? AppColors.textOnDark
                                  : AppColors.textOnLight,
                            ),
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios, size: 16),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.paddingM),
              CustomCard(
                onTap: () => Get.toNamed(AppRoutes.dashboardMovement),
                child: Row(
                  children: [
                    Icon(Icons.show_chart, color: primaryColor),
                    const SizedBox(width: AppSpacing.paddingM),
                        Expanded(
                      child: Text(
                        'movement_chart'.tr,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Theme.of(context).brightness == Brightness.dark
                                  ? AppColors.textOnDark
                                  : AppColors.textOnLight,
                            ),
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios, size: 16),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.paddingM),
              CustomCard(
                onTap: () => Get.toNamed(AppRoutes.dashboardPredictions),
                child: Row(
                  children: [
                    Icon(Icons.psychology, color: primaryColor),
                    const SizedBox(width: AppSpacing.paddingM),
                        Expanded(
                      child: Text(
                        'predictions'.tr,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Theme.of(context).brightness == Brightness.dark
                                  ? AppColors.textOnDark
                                  : AppColors.textOnLight,
                            ),
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios, size: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatNumber(int number) {
    if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)}M';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}K';
    }
    return number.toString();
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
  Widget _buildStatCard(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
    Color iconColor,
  ) {
    // Responsive icon size based on screen width
    final screenWidth = MediaQuery.of(context).size.width;
    final iconSize = screenWidth > 600 ? 40.0 : 36.0;
    final fontSize = screenWidth > 600 ? 14.0 : 12.0;
    
    return CustomCard(
      onTap: onTap,
      padding: EdgeInsets.symmetric(
        vertical: AppSpacing.paddingM,
        horizontal: AppSpacing.paddingS,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Icon(icon, size: iconSize, color: iconColor),
          ),
          SizedBox(height: AppSpacing.paddingS),
          Flexible(
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).brightness == Brightness.dark
                        ? AppColors.textOnDark
                        : AppColors.textOnLight,
                    fontWeight: FontWeight.w500,
                    fontSize: fontSize,
                  ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

