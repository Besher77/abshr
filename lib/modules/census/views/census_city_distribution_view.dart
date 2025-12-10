import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/census_controller.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_card.dart';
import '../../../core/widgets/heatmap_widget.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_colors.dart';
import '../../../utils/cities.dart';

/// Census city distribution view - displays heatmap and city stats
class CensusCityDistributionView extends StatelessWidget {
  const CensusCityDistributionView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CensusController>();

    return Scaffold(
      appBar: const CustomAppBar(titleKey: 'city_distribution'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.paddingM),
        child: Column(
          children: [
            // Heatmap

            CustomCard(
              child: Column(
                children: [
                  Text(
                    'city_distribution'.tr,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? AppColors.textOnDark
                              : AppColors.textOnLight,
                        ),
                  ),
                  const SizedBox(height: AppSpacing.paddingL),
                  Obx(() {
                    if (controller.heatmapData.isEmpty) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    return Container(
                      height: 400,
                      decoration: BoxDecoration(
                        color: AppColors.backgroundSecondary,
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
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.paddingM),

            // City list
            Obx(() {
              final data = controller.censusData.value;
              if (data == null) {
                return const SizedBox.shrink();
              }

              final cities = data.cityDistribution.entries.toList()
                ..sort((a, b) => b.value.compareTo(a.value));

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: cities.take(10).map((entry) {
                  final percentage = (entry.value / data.totalPopulation * 100).toStringAsFixed(1);
                  final cityName = Cities.getCityName(entry.key);
                  return Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.paddingM),
                    child: CustomCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  cityName,
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        color: Theme.of(context).brightness == Brightness.dark
                                            ? AppColors.textOnDark
                                            : AppColors.textOnLight,
                                      ),
                                ),
                              ),
                              Text(
                                '${_formatNumber(entry.value)} ($percentage%)',
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      color: AppColors.primary,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: AppSpacing.paddingS),
                          LinearProgressIndicator(
                            value: entry.value / data.totalPopulation,
                            backgroundColor: AppColors.surfaceDark,
                            valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              );
            }),
          ],
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
}

