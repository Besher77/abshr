import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_card.dart';
import '../../../core/widgets/heatmap_widget.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_colors.dart';

/// Dashboard heatmap view - displays heatmap visualization
class DashboardHeatmapView extends StatelessWidget {
  const DashboardHeatmapView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    return Scaffold(
      appBar: const CustomAppBar(titleKey: 'heatmap'),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.paddingM),
        child: Column(
          children: [
            CustomCard(
              child: Column(
                children: [
                  Text(
                    'heatmap'.tr,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppColors.textOnDark
                              : AppColors.textOnLight,
                        ),
                  ),
                  const SizedBox(height: AppSpacing.paddingL),
                  // Real heatmap visualization
                  Obx(() {
                    if (controller.heatmapData.isEmpty) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    return Container(
                      height: 400,
                      decoration: BoxDecoration(
                        color: Theme.of(context).brightness == Brightness.dark
                            ? AppColors.backgroundSecondary
                            : AppColors.background,
                        borderRadius: BorderRadius.circular(AppSpacing.radiusL),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(AppSpacing.radiusL),
                        child: HeatmapWidget(
                          data: controller.heatmapData,
                          gridWidth: 9,
                          gridHeight: 6,
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: AppSpacing.paddingL),
                  // Legend
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildLegendItem(context,'Low', AppColors.primaryLight),
                      const SizedBox(width: AppSpacing.paddingM),
                      _buildLegendItem(context,'Medium', AppColors.primary),
                      const SizedBox(width: AppSpacing.paddingM),
                      _buildLegendItem(context,'High', AppColors.primaryDark),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.paddingS),
                  Text(
                    'Tap on cells to see details',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegendItem(BuildContext context,String label, Color color) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(AppSpacing.radiusS),
          ),
        ),
        const SizedBox(width: AppSpacing.paddingS),
        Text(
          label,
          style: TextStyle(color: Theme.of(context).brightness == Brightness.dark
              ? AppColors.textOnDark
              : AppColors.textOnLight,),
        ),
      ],
    );
  }
}

