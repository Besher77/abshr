import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/residency_controller.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_textfield.dart';
import '../../../core/widgets/custom_dropdown.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_card.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_colors.dart';
import '../../../utils/validators.dart';
import '../../../utils/countries.dart';
import '../../../utils/education_levels.dart';

/// Residency form view - UI only
class ResidencyFormView extends StatelessWidget {
  const ResidencyFormView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ResidencyController());

    return Scaffold(
      appBar: const CustomAppBar(titleKey: 'residency_title'),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.paddingM),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
              // Last update banner
              Obx(() {
                final lastUpdate = controller.lastUpdateDate.value;
                if (lastUpdate != null) {
                  return CustomCard(
                    child: Row(
                      children: [
                        const Icon(Icons.info_outline, color: AppColors.info),
                        const SizedBox(width: AppSpacing.paddingS),
                        Expanded(
                          child: Text(
                            '${'last_update'.tr}: ${_formatDate(lastUpdate)}',
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: AppColors.textOnLight,
                                ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return const SizedBox.shrink();
              }),
              const SizedBox(height: AppSpacing.paddingM),

              // Form fields
              CustomTextField(
                labelKey: 'current_city',
                controller: controller.currentCityController,
                validator: Validators.required,
              ),
              const SizedBox(height: AppSpacing.paddingM),
              CustomTextField(
                labelKey: 'district',
                controller: controller.districtController,
                validator: Validators.required,
              ),
              const SizedBox(height: AppSpacing.paddingM),
              CustomTextField(
                labelKey: 'workplace',
                controller: controller.workplaceController,
                validator: Validators.required,
              ),
              const SizedBox(height: AppSpacing.paddingM),
              // Country dropdown
              Obx(() {
                final locale = Get.locale?.languageCode ?? 'en';
                return CustomDropdown<String>(
                  labelKey: 'country',
                  hintKey: 'select_country',
                  value: controller.selectedCountry.value.isEmpty 
                      ? null 
                      : controller.selectedCountry.value,
                  items: Countries.getDropdownItems(locale),
                  onChanged: (value) {
                    if (value != null) {
                      controller.selectedCountry.value = value;
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'validation_required'.tr;
                    }
                    return null;
                  },
                );
              }),
              const SizedBox(height: AppSpacing.paddingM),
              CustomTextField(
                labelKey: 'residents_inside_ksa',
                controller: controller.residentsInsideKSAController,
                validator: Validators.number,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: AppSpacing.paddingM),
              CustomTextField(
                labelKey: 'residents_outside_ksa',
                controller: controller.residentsOutsideKSAController,
                validator: Validators.number,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: AppSpacing.paddingM),
              CustomTextField(
                labelKey: 'average_income',
                controller: controller.averageIncomeController,
                validator: Validators.number,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                hintKey: 'average_income_hint',
              ),
              const SizedBox(height: AppSpacing.paddingM),
              CustomTextField(
                labelKey: 'dependents_count',
                controller: controller.dependentsCountController,
                validator: Validators.number,
                keyboardType: TextInputType.number,
                hintKey: 'dependents_count_hint',
              ),
              const SizedBox(height: AppSpacing.paddingM),
              // Education level dropdown
              Obx(() {
                final locale = Get.locale?.languageCode ?? 'en';
                return CustomDropdown<String>(
                  labelKey: 'education_level',
                  hintKey: 'select_education_level',
                  value: controller.selectedEducationLevel.value.isEmpty 
                      ? null 
                      : controller.selectedEducationLevel.value,
                  items: EducationLevels.getDropdownItems(locale),
                  onChanged: (value) {
                    if (value != null) {
                      controller.selectedEducationLevel.value = value;
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'validation_required'.tr;
                    }
                    return null;
                  },
                );
              }),
              const SizedBox(height: AppSpacing.paddingXL),

              // Submit button
              Obx(() => CustomButton(
                    text: 'submit'.tr,
                    onPressed: controller.submitForm,
                    isLoading: controller.isLoading.value,
                  )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}

