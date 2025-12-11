import 'package:abshr/modules/business_forecasts/models/business_forecast_question.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/widgets/custom_card.dart';
import '../../../core/utils/theme_helper.dart';
import '../controllers/business_forecasts_controller.dart';

/// Business forecasts view - displays business statistics and forecasts questions
class BusinessForecastsView extends StatelessWidget {
  const BusinessForecastsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BusinessForecastsController());
    final args = Get.arguments;
    final role = args is Map<String, dynamic> ? args['role'] as String? : 'government';
    final primaryColor = ThemeHelper.getPrimaryColor(role);

    return Scaffold(
      appBar: AppBar(
        title: Text('business_statistics_and_forecasts'.tr),
      ),
      body: Obx(() {
        return ListView.separated(
          padding: const EdgeInsets.all(AppSpacing.paddingM),
          itemCount: controller.sections.length,
          separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.paddingM),
          itemBuilder: (context, index) {
            final section = controller.sections[index];
            return CustomCard(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.paddingM),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 28,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(AppSpacing.radiusS),
                          ),
                        ),
                        const SizedBox(width: AppSpacing.paddingS),
                        Expanded(
                          child: Text(
                            section.titleKey.tr,
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: Theme.of(context).textTheme.bodyLarge?.color,
                                ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.paddingM),
                    ...section.questions.map(
                      (q) => _buildQuestion(
                        context,
                        controller,
                        q as BusinessForecastQuestion,
                        primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }

  Widget _buildQuestion(
    BuildContext context,
    BusinessForecastsController controller,
    BusinessForecastQuestion question,
    Color primaryColor,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.paddingM),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question.titleKey.tr,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
          ),
          const SizedBox(height: AppSpacing.paddingS),
          Obx(() {
            final selected = controller.selections[question.titleKey];
            if (question.isDate) {
              return _buildDatePicker(
                context,
                controller,
                question,
                primaryColor,
                selected,
                isDark,
              );
            } else {
              return Wrap(
                spacing: AppSpacing.paddingS,
                runSpacing: AppSpacing.paddingS,
                children: question.optionKeys.map((opt) {
                  final isSelected = selected == opt;
                  return ChoiceChip(
                    label: Text(
                      opt.tr,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: isSelected
                                ? AppColors.textOnPrimary
                                : Theme.of(context).textTheme.bodySmall?.color,
                          ),
                    ),
                    selected: isSelected,
                    onSelected: (_) => controller.selectOption(question.titleKey, opt),
                    selectedColor: primaryColor,
                    backgroundColor: isDark
                        ? AppColors.backgroundSecondary
                        : AppColors.backgroundSecondaryLight,
                    shape: StadiumBorder(
                      side: BorderSide(
                        color: isSelected
                            ? primaryColor
                            : (isDark ? AppColors.borderDark : AppColors.borderLight),
                      ),
                    ),
                  );
                }).toList(),
              );
            }
          }),
        ],
      ),
    );
  }

  Widget _buildDatePicker(
    BuildContext context,
    BusinessForecastsController controller,
    BusinessForecastQuestion question,
    Color primaryColor,
    String? selectedDate,
    bool isDark,
  ) {
    DateTime? parsedDate;
    if (selectedDate != null && selectedDate.isNotEmpty) {
      try {
        final parts = selectedDate.split('/');
        if (parts.length == 3) {
          parsedDate = DateTime(
            int.parse(parts[0]),
            int.parse(parts[1]),
            int.parse(parts[2]),
          );
        }
      } catch (_) {
        // ignore parse errors
      }
    }

    return InkWell(
      onTap: () async {
        final picked = await showDatePicker(
          context: context,
          initialDate: parsedDate ?? DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: primaryColor,
                  onPrimary: AppColors.textOnPrimary,
                ),
              ),
              child: child!,
            );
          },
        );
        if (picked != null) {
          final formatted = '${picked.year}/${picked.month.toString().padLeft(2, '0')}/${picked.day.toString().padLeft(2, '0')}';
          controller.selectOption(question.titleKey, formatted);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.paddingM,
          vertical: AppSpacing.paddingM,
        ),
        decoration: BoxDecoration(
          color: isDark
              ? AppColors.backgroundSecondary
              : AppColors.backgroundSecondaryLight,
          borderRadius: BorderRadius.circular(AppSpacing.radiusM),
          border: Border.all(
            color: selectedDate != null
                ? primaryColor
                : (isDark ? AppColors.borderDark : AppColors.borderLight),
            width: selectedDate != null ? 2 : 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedDate ?? question.optionKeys.first.tr,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: selectedDate != null
                        ? primaryColor
                        : (isDark ? AppColors.textHintDark : AppColors.textHintLight),
                    fontWeight: selectedDate != null ? FontWeight.w600 : FontWeight.normal,
                  ),
            ),
            Icon(
              Icons.calendar_today,
              color: selectedDate != null
                  ? primaryColor
                  : (isDark ? AppColors.textHintDark : AppColors.textHintLight),
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

