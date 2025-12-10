import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/census_controller.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_card.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_colors.dart';

/// Census services view - displays service usage analytics
class CensusServicesView extends StatelessWidget {
  const CensusServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CensusController>();

    return Scaffold(
      appBar: const CustomAppBar(titleKey: 'service_analytics'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.paddingM),
        child: Obx(() {
          final data = controller.censusData.value;
          if (data == null) {
            return const Center(child: CircularProgressIndicator());
          }

          // Sort services by usage count
          final sortedServices = List<Map<String, dynamic>>.from(data.serviceUsage)
            ..sort((a, b) => (b['usageCount'] as int).compareTo(a['usageCount'] as int));

          final maxUsage = sortedServices.first['usageCount'] as int;

          return Column(
            children: [
              // Most Used Services Header
              CustomCard(
                child: Column(
                  children: [
                    Text(
                      'most_used_services'.tr,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: Theme.of(context).brightness == Brightness.dark
                                ? AppColors.textOnDark
                                : AppColors.textOnLight,
                          ),
                    ),
                    const SizedBox(height: AppSpacing.paddingS),
                    Text(
                      'auto_refresh'.tr,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.paddingM),

              // Service List
              ...sortedServices.map((service) {
                final isBottleneck = service['bottleneck'] as bool;
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
                                service['nameKey'].toString().tr,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                      color: Theme.of(context).brightness == Brightness.dark
                                          ? AppColors.textOnDark
                                          : AppColors.textOnLight,
                                    ),
                              ),
                            ),
                            if (isBottleneck)
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: AppSpacing.paddingS,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.warning,
                                  borderRadius: BorderRadius.circular(AppSpacing.radiusS),
                                ),
                                child: Text(
                                  'bottlenecks'.tr,
                                  style: const TextStyle(
                                    color: AppColors.textOnPrimary,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.paddingS),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${_formatNumber(service['usageCount'] as int)}',
                                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                        color: AppColors.primary,
                                      ),
                                ),
                                Text(
                                  'usage_count'.tr,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.access_time, size: 16, color: AppColors.info),
                                    const SizedBox(width: AppSpacing.paddingS),
                                    Text(
                                      service['peakTime'].toString(),
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                            color: AppColors.info,
                                          ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'peak_times'.tr,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  service['avgProcessingTime'].toString(),
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        color: AppColors.secondary,
                                      ),
                                ),
                                Text(
                                  'avg_processing_time'.tr,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.paddingS),
                        LinearProgressIndicator(
                          value: (service['usageCount'] as int) / maxUsage,
                          backgroundColor: AppColors.surfaceDark,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            isBottleneck ? AppColors.warning : AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ],
          );
        }),
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

