import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_card.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_colors.dart';
import '../../../routes/app_routes.dart';

/// Residency confirmation view - UI only
class ResidencyConfirmationView extends StatelessWidget {
  const ResidencyConfirmationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(titleKey: 'residency_title'),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.paddingM),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCard(
              child: Column(
                children: [
                  const Icon(
                    Icons.check_circle,
                    size: 80,
                    color: AppColors.success,
                  ),
                  const SizedBox(height: AppSpacing.paddingL),
                  Text(
                    'update_success'.tr,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: AppColors.textOnLight,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: AppSpacing.paddingXL),
                  CustomButton(
                    text: 'dashboard_title'.tr,
                    onPressed: () => Get.offAllNamed(AppRoutes.dashboard),
                  ),
                  const SizedBox(height: AppSpacing.paddingM),
                  CustomButton(
                    text: 'residency_title'.tr,
                    onPressed: () => Get.back(),
                    isPrimary: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

