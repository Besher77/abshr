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
                  const SizedBox(height: AppSpacing.paddingM),


                  // Navigation buttons
                  CustomButton(
                    text: 'residency_title'.tr,
                    onPressed: () => Get.toNamed(AppRoutes.residency),
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

