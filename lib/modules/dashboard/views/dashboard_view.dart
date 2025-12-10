import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_card.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_colors.dart';
import '../../../routes/app_routes.dart';

/// Dashboard main view - UI only
class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());

    return Scaffold(
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
            Obx(() => CustomCard(
                  child: Column(
                    children: [
                      Text(
                        'total_expats'.tr,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Theme.of(context).brightness == Brightness.dark
                                  ? AppColors.textOnDark
                                  : AppColors.textOnLight,
                            ),
                      ),
                      const SizedBox(height: AppSpacing.paddingS),
                      Text(
                        '${controller.totalExpats.value}',
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(
                              color: AppColors.primary,
                            ),
                      ),
                    ],
                  ),
                )),
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
                ),
                _buildStatCard(
                  context,
                  'by_city'.tr,
                  Icons.location_city,
                  () => Get.toNamed(AppRoutes.dashboardStats, arguments: 'city'),
                ),
                _buildStatCard(
                  context,
                  'by_district'.tr,
                  Icons.map,
                  () => Get.toNamed(AppRoutes.dashboardStats, arguments: 'district'),
                ),
                _buildStatCard(
                  context,
                  'by_gender'.tr,
                  Icons.people,
                  () => Get.toNamed(AppRoutes.dashboardStats, arguments: 'gender'),
                ),
                _buildStatCard(
                  context,
                  'by_age'.tr,
                  Icons.calendar_today,
                  () => Get.toNamed(AppRoutes.dashboardStats, arguments: 'age'),
                ),
                _buildStatCard(
                  context,
                  'by_job_type'.tr,
                  Icons.work,
                  () => Get.toNamed(AppRoutes.dashboardStats, arguments: 'job_type'),
                ),
                  ],
                );
              },
            ),
            const SizedBox(height: AppSpacing.paddingM),

            // Charts and predictions
            CustomCard(
              onTap: () => Get.toNamed(AppRoutes.dashboardHeatmap),
              child: Row(
                children: [
                  const Icon(Icons.map, color: AppColors.primary),
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
                  const Icon(Icons.show_chart, color: AppColors.primary),
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
                  const Icon(Icons.psychology, color: AppColors.primary),
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
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
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
            child: Icon(icon, size: iconSize, color: AppColors.primary),
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

