import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import '../controllers/census_controller.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_card.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_colors.dart';

/// Census forecasts view - displays AI-powered population forecasts
class CensusForecastsView extends StatelessWidget {
  const CensusForecastsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CensusController>();

    return Scaffold(
      appBar: const CustomAppBar(titleKey: 'ai_forecasts'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSpacing.paddingM),
        child: Obx(() {
          final data = controller.censusData.value;
          if (data == null) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              // Forecast Chart
              CustomCard(
                child: Column(
                  children: [
                    Text(
                      'population_forecast'.tr,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: Theme.of(context).brightness == Brightness.dark
                                ? AppColors.textOnDark
                                : AppColors.textOnLight,
                          ),
                    ),
                    const SizedBox(height: AppSpacing.paddingXL),
                    SizedBox(
                      height: 300,
                      child: LineChart(
                        LineChartData(
                          gridData: FlGridData(show: true),
                          titlesData: FlTitlesData(
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: true),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                getTitlesWidget: (value, meta) {
                                  final forecasts = data.forecasts;
                                  if (value.toInt() >= 0 && value.toInt() < forecasts.length) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text(
                                        forecasts[value.toInt()]['period'].toString().tr,
                                        style: const TextStyle(fontSize: 10),
                                      ),
                                    );
                                  }
                                  return const Text('');
                                },
                              ),
                            ),
                            topTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            rightTitles: const AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                          ),
                          borderData: FlBorderData(show: true),
                          minX: 0,
                          maxX: (data.forecasts.length - 1).toDouble(),
                          minY: data.totalPopulation * 0.98,
                          maxY: data.forecasts.last['totalPopulation'] * 1.02,
                          lineBarsData: [
                            LineChartBarData(
                              spots: [
                                FlSpot(0, data.totalPopulation.toDouble()),
                                ...data.forecasts.asMap().entries.map((e) {
                                  return FlSpot(
                                    (e.key + 1).toDouble(),
                                    (e.value['totalPopulation'] as int).toDouble(),
                                  );
                                }).toList(),
                              ],
                              isCurved: true,
                              color: AppColors.primary,
                              barWidth: 3,
                              dotData: const FlDotData(show: true),
                              belowBarData: BarAreaData(show: false),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.paddingM),

              // Forecast Cards
              ...data.forecasts.map((forecast) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.paddingM),
                  child: CustomCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              forecast['period'].toString().tr,
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Theme.of(context).brightness == Brightness.dark
                                        ? AppColors.textOnDark
                                        : AppColors.textOnLight,
                                  ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppSpacing.paddingM,
                                vertical: AppSpacing.paddingS,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(AppSpacing.radiusM),
                              ),
                              child: Text(
                                '+${forecast['growthRate'].toStringAsFixed(2)}%',
                                style: const TextStyle(
                                  color: AppColors.textOnPrimary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.paddingM),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'total_population'.tr,
                                    style: Theme.of(context).textTheme.bodySmall,
                                  ),
                                  Text(
                                    _formatNumber(forecast['totalPopulation'] as int),
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                          color: AppColors.primary,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'citizens'.tr,
                                    style: Theme.of(context).textTheme.bodySmall,
                                  ),
                                  Text(
                                    _formatNumber(forecast['citizens'] as int),
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                          color: AppColors.primary,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'expats'.tr,
                                    style: Theme.of(context).textTheme.bodySmall,
                                  ),
                                  Text(
                                    _formatNumber(forecast['expats'] as int),
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                          color: AppColors.secondary,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.paddingM),
                        Text(
                          forecast['prediction'].toString().tr,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context).brightness == Brightness.dark
                                    ? AppColors.textOnDark
                                    : AppColors.textOnLight,
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

