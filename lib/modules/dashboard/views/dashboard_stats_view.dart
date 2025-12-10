import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_card.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_colors.dart';
import '../../../utils/cities.dart';
import '../../../utils/districts.dart';

/// Dashboard stats view - displays statistics by category
class DashboardStatsView extends StatelessWidget {
  const DashboardStatsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();
    final category = Get.arguments as String? ?? 'nationality';

    Map<String, int> data = {};
    String titleKey = '';

    switch (category) {
      case 'nationality':
        data = controller.expatsByNationality;
        titleKey = 'by_nationality';
        break;
      case 'city':
        data = controller.expatsByCity;
        titleKey = 'by_city';
        break;
      case 'district':
        data = controller.expatsByDistrict;
        titleKey = 'by_district';
        break;
      case 'gender':
        data = controller.expatsByGender;
        titleKey = 'by_gender';
        break;
      case 'age':
        data = controller.expatsByAge;
        titleKey = 'by_age';
        break;
      case 'job_type':
        data = controller.expatsByJobType;
        titleKey = 'by_job_type';
        break;
    }

    final total = data.values.reduce((a, b) => a + b);

    return Scaffold(
      appBar: CustomAppBar(titleKey: titleKey),
      body: ListView.builder(
        padding: const EdgeInsets.all(AppSpacing.paddingM),
        itemCount: data.length,
        itemBuilder: (context, index) {
          final entry = data.entries.elementAt(index);
          final percentage = (entry.value / total * 100).toStringAsFixed(1);
          
          // Get localized name based on category
          String displayName = entry.key;
          if (category == 'city') {
            displayName = Cities.getCityName(entry.key);
          } else if (category == 'district') {
            displayName = Districts.getDistrictName(entry.key);
          }

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
                          displayName,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color:  Theme.of(context).brightness == Brightness.dark
                                  ? AppColors.textOnDark
                                  : AppColors.textOnLight
                              ),
                        ),
                      ),
                      Text(
                        '${entry.value} ($percentage%)',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color:  Theme.of(context).brightness == Brightness.dark
                                ? AppColors.textOnDark
                                : AppColors.textOnLight
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.paddingS),
                  LinearProgressIndicator(
                    value: entry.value / total,
                    backgroundColor: AppColors.surfaceDark,
                    valueColor:  AlwaysStoppedAnimation<Color>(  Theme.of(context).brightness == Brightness.dark
                        ? AppColors.textOnDark
                        : AppColors.textOnLight),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

