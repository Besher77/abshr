import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import '../controllers/dashboard_controller.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_card.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_colors.dart';

/// Dashboard movement view - displays monthly movement chart
class DashboardMovementView extends StatelessWidget {
  const DashboardMovementView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DashboardController>();

    return Scaffold(
      appBar: const CustomAppBar(titleKey: 'movement_chart'),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.paddingM),
        child: Obx(() {
          final data = controller.monthlyMovement;
          if (data.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          final maxValue = data
              .map((e) => (e['in'] as int) > (e['out'] as int) ? e['in'] as int : e['out'] as int)
              .reduce((a, b) => a > b ? a : b)
              .toDouble();

          return CustomCard(
            child: Column(
              children: [
                Text(
                  'movement_chart'.tr,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                   color:  (Theme.of(context).brightness == Brightness.dark
                        ? AppColors.textOnDark
                        : AppColors.textOnLight),
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
                              if (value.toInt() >= 0 && value.toInt() < data.length) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    data[value.toInt()]['month'].toString().tr,
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: AppColors.textOnLight,
                                    ),
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
                      maxX: (data.length - 1).toDouble(),
                      minY: 0,
                      maxY: maxValue * 1.2,
                      lineBarsData: [
                        LineChartBarData(
                          spots: data.asMap().entries.map((e) {
                            return FlSpot(e.key.toDouble(), (e.value['in'] as int).toDouble());
                          }).toList(),
                          isCurved: true,
                          color: AppColors.success,
                          barWidth: 3,
                          dotData: const FlDotData(show: true),
                          belowBarData: BarAreaData(show: false),
                        ),
                        LineChartBarData(
                          spots: data.asMap().entries.map((e) {
                            return FlSpot(e.key.toDouble(), (e.value['out'] as int).toDouble());
                          }).toList(),
                          isCurved: true,
                          color: AppColors.error,
                          barWidth: 3,
                          dotData: const FlDotData(show: true),
                          belowBarData: BarAreaData(show: false),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.paddingL),
                // Legend
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildLegendItem(context,'in_movement'.tr, AppColors.success),
                    const SizedBox(width: AppSpacing.paddingL),
                    _buildLegendItem(context,'out_movement'.tr, AppColors.error),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildLegendItem(BuildContext context,String label, Color color) {
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
        Text(
          label,
          style:  TextStyle(color:  Theme.of(context).brightness == Brightness.dark
              ? AppColors.textOnDark
              : AppColors.textOnLight,),
        ),
      ],
    );
  }
}

