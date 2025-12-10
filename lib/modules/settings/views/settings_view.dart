import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/settings_controller.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_card.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_colors.dart';

/// Settings view - UI only
class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingsController());

    return Scaffold(
      appBar: const CustomAppBar(titleKey: 'settings_title'),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.paddingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'language'.tr,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                        ),
                  ),
                  const SizedBox(height: AppSpacing.paddingM),
                  Obx(() => Column(
                        children: [
                          RadioListTile<String>(
                            title: Text(
                              'arabic'.tr,
                              style: TextStyle(
                                color: Theme.of(context).textTheme.bodyLarge?.color,
                              ),
                            ),
                            value: 'ar',
                            groupValue: controller.currentLanguage.value,
                            activeColor: AppColors.primary,
                            onChanged: (value) {
                              if (value != null) {
                                controller.changeLanguage(value);
                              }
                            },
                          ),
                          RadioListTile<String>(
                            title: Text(
                              'english'.tr,
                              style: TextStyle(
                                color: Theme.of(context).textTheme.bodyLarge?.color,
                              ),
                            ),
                            value: 'en',
                            groupValue: controller.currentLanguage.value,
                            activeColor: AppColors.primary,
                            onChanged: (value) {
                              if (value != null) {
                                controller.changeLanguage(value);
                              }
                            },
                          ),
                        ],
                      )),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.paddingM),
            // Theme mode card
            CustomCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'theme_mode'.tr,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                        ),
                  ),
                  const SizedBox(height: AppSpacing.paddingM),
                  Obx(() => Column(
                        children: [
                          RadioListTile<bool>(
                            title: Text(
                              'dark_mode'.tr,
                              style: TextStyle(
                                color: Theme.of(context).textTheme.bodyLarge?.color,
                              ),
                            ),
                            value: true,
                            groupValue: controller.themeController.isDarkMode.value,
                            activeColor: AppColors.primary,
                            onChanged: (value) {
                              if (value != null) {
                                controller.themeController.setThemeMode(value);
                              }
                            },
                          ),
                          RadioListTile<bool>(
                            title: Text(
                              'light_mode'.tr,
                              style: TextStyle(
                                color: Theme.of(context).textTheme.bodyLarge?.color,
                              ),
                            ),
                            value: false,
                            groupValue: controller.themeController.isDarkMode.value,
                            activeColor: AppColors.primary,
                            onChanged: (value) {
                              if (value != null) {
                                controller.themeController.setThemeMode(value);
                              }
                            },
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

