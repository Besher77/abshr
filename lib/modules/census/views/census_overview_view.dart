import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/census_controller.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_card.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_colors.dart';
import '../../../routes/app_routes.dart';

/// Census overview view - displays population overview cards
class CensusOverviewView extends StatelessWidget {
  const CensusOverviewView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CensusController());

    return Scaffold(
      appBar: const CustomAppBar(titleKey: 'census_hub'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.paddingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Last update banner
            Obx(() {
              final lastUpdate = controller.lastUpdated.value;
              if (lastUpdate != null) {
                  return CustomCard(
                    child: Row(
                    children: [
                      const Icon(Icons.info_outline, color: AppColors.info),
                      const SizedBox(width: AppSpacing.paddingS),
                      Expanded(
                        child: Text(
                          '${'last_update'.tr}: ${_formatDateTime(lastUpdate)}',
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context).brightness == Brightness.dark
                                    ? AppColors.textOnDark
                                    : AppColors.textOnLight,
                              ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.refresh),
                        onPressed: controller.refresh,
                        tooltip: 'refresh'.tr,
                      ),
                    ],
                  ),
                );
              }
              return const SizedBox.shrink();
            }),
            const SizedBox(height: AppSpacing.paddingM),

            // Population cards
            Obx(() {
              final data = controller.censusData.value;
              if (data == null) {
                return const Center(child: CircularProgressIndicator());
              }

              return Column(
                children: [
                  // Total Population
                  CustomCard(
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
                                color: AppColors.primary,
                              ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.paddingM),

                  // Citizens and Expats row
                  Row(
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
                                _formatNumber(data.citizens),
                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                      color: AppColors.primary,
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
                                      color: AppColors.secondary,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.paddingM),

                  // Navigation buttons
                  CustomButton(
                    text: 'residency_title'.tr,
                    onPressed: () => Get.toNamed(AppRoutes.residency),
                  ),
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
                ],
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

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}

