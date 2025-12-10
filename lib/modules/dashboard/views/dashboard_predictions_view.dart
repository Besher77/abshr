import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_card.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_colors.dart';

/// Dashboard predictions view - displays AI-style predictions
class DashboardPredictionsView extends StatelessWidget {
  const DashboardPredictionsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    return Scaffold(
      appBar: const CustomAppBar(titleKey: 'predictions'),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.paddingM),
        child: Obx(() {
          final predictions = controller.predictions;

          return ListView.builder(
            itemCount: predictions.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.paddingM),
            child: CustomCard(
              child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(AppSpacing.paddingS),
                        decoration: BoxDecoration(
                            color:  Theme.of(context).brightness == Brightness.dark
                                ? AppColors.textOnDark
                                : AppColors.textOnLight,
                            borderRadius: BorderRadius.circular(AppSpacing.radiusM),
                        ),
                        child: const Icon(
                          Icons.psychology,
                          color: AppColors.primary,
                          size: 24,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.paddingM),
                      Expanded(
                        child: Text(
                          predictions[index].tr,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color:  Theme.of(context).brightness == Brightness.dark
                                  ? AppColors.textOnDark
                                  : AppColors.textOnLight
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}

