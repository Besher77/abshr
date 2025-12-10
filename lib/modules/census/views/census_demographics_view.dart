import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import '../controllers/census_controller.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_card.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_colors.dart';

/// Census demographics view - displays age groups, gender, nationality charts
class CensusDemographicsView extends StatelessWidget {
  const CensusDemographicsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CensusController>();

    return Scaffold(
      appBar: const CustomAppBar(titleKey: 'demographics'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.paddingM),
        child: Obx(() {
          final data = controller.censusData.value;
          if (data == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              // Age Groups Chart
              CustomCard(
                child: Column(
                  children: [
                    Text(
                      'age_groups'.tr,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Theme.of(context).brightness == Brightness.dark
                                ? AppColors.textOnDark
                                : AppColors.textOnLight,
                          ),
                    ),
                    const SizedBox(height: AppSpacing.paddingL),
                    SizedBox(
                      height: 300,
                      child: BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.spaceAround,
                          maxY: data.ageGroups.values.reduce((a, b) => a > b ? a : b).toDouble() * 1.2,
                          barTouchData: BarTouchData(enabled: true),
                          titlesData: FlTitlesData(
                            show: true,
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  final index = value.toInt();
                                  if (index >= 0 && index < data.ageGroups.length) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        data.ageGroups.keys.elementAt(index),
                                        style: const TextStyle(fontSize: 10),
                                      ),
                                    );
                                  }
                                  return const Text('');
                                },
                              ),
                            ),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: true),
                            ),
                            topTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            rightTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                          ),
                          borderData: FlBorderData(show: true),
                          barGroups: data.ageGroups.entries.map((entry) {
                            final index = data.ageGroups.keys.toList().indexOf(entry.key);
                            return BarChartGroupData(
                              x: index,
                              barRods: [
                                BarChartRodData(
                                  toY: entry.value.toDouble(),
                                  color: AppColors.chartColors[index % AppColors.chartColors.length],
                                  width: 20,
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.paddingM),

              // Gender Distribution
              CustomCard(
                child: Column(
                  children: [
                    Text(
                      'gender_distribution'.tr,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Theme.of(context).brightness == Brightness.dark
                                ? AppColors.textOnDark
                                : AppColors.textOnLight,
                          ),
                    ),
                    const SizedBox(height: AppSpacing.paddingL),
                    SizedBox(
                      height: 200,
                      child: PieChart(
                        PieChartData(
                          sectionsSpace: 2,
                          centerSpaceRadius: 40,
                          sections: [
                            PieChartSectionData(
                              value: data.genderDistribution['Male']!.toDouble(),
                              title: 'Male',
                              color: AppColors.primary,
                              radius: 80,
                            ),
                            PieChartSectionData(
                              value: data.genderDistribution['Female']!.toDouble(),
                              title: 'Female',
                              color: AppColors.secondary,
                              radius: 80,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.paddingM),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildLegendItem('Male', AppColors.primary),
                        const SizedBox(width: AppSpacing.paddingL),
                        _buildLegendItem('Female', AppColors.secondary),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.paddingM),

              // Nationality Distribution
              CustomCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'nationality_distribution'.tr,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Theme.of(context).brightness == Brightness.dark
                                ? AppColors.textOnDark
                                : AppColors.textOnLight,
                          ),
                    ),
                    const SizedBox(height: AppSpacing.paddingM),
                    ...data.nationalityDistribution.entries.take(8).map((entry) {
                      final percentage = (entry.value / data.totalPopulation * 100).toStringAsFixed(1);
                      return Padding(
                        padding: const EdgeInsets.only(bottom: AppSpacing.paddingS),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                entry.key,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      color: Theme.of(context).brightness == Brightness.dark
                                          ? AppColors.textOnDark
                                          : AppColors.textOnLight,
                                    ),
                              ),
                            ),
                            Text(
                              '${_formatNumber(entry.value)} ($percentage%)',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: AppColors.primary,
                                  ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: AppSpacing.paddingS),
        Text(label),
      ],
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

