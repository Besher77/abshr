import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../../utils/cities.dart';
import '../../utils/districts.dart';

/// Heatmap widget for visualizing expat density
class HeatmapWidget extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  final int gridWidth;
  final int gridHeight;

  const HeatmapWidget({
    super.key,
    required this.data,
    this.gridWidth = 9,
    this.gridHeight = 6,
  });

  @override
  Widget build(BuildContext context) {
    // Find max density for normalization
    final maxDensity = data.isEmpty
        ? 100
        : data.map((e) => e['density'] as int).reduce((a, b) => a > b ? a : b);

    // Create grid
    final grid = List.generate(
      gridHeight,
      (y) => List.generate(
        gridWidth,
        (x) => _getDensityAt(x, y),
      ),
    );

    return Container(
      padding: const EdgeInsets.all(AppSpacing.paddingM),

      child: Column(
        children: [
          // Heatmap grid
          Expanded(
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: gridWidth,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              itemCount: gridWidth * gridHeight,
              itemBuilder: (context, index) {
                final y = index ~/ gridWidth;
                final x = index % gridWidth;
                final density = grid[y][x];
                final intensity = density / maxDensity;

                return _buildHeatmapCell(intensity, x, y, context);
              },
            ),
          ),
          const SizedBox(height: AppSpacing.paddingM),
          // City labels
          _buildCityLabels(),
        ],
      ),
    );
  }

  int _getDensityAt(int x, int y) {
    final point = data.firstWhere(
      (e) => e['x'] == x && e['y'] == y,
      orElse: () => {'density': 0},
    );
    return point['density'] as int;
  }

  Widget _buildHeatmapCell(double intensity, int x, int y, BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    Color color;
    if (intensity == 0) {
      color = isDark
          ? AppColors.backgroundSecondary
          : AppColors.backgroundSecondaryLight;
    } else if (intensity < 0.3) {
      color = AppColors.primaryLight;
    } else if (intensity < 0.6) {
      color = AppColors.primary;
    } else {
      color = AppColors.primaryDark;
    }

    // Check if there's data at this point
    final pointData = data.firstWhere(
      (e) => e['x'] == x && e['y'] == y,
      orElse: () => {},
    );

    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
        border: pointData.isNotEmpty
            ? Border.all(
                color: isDark
                    ? AppColors.textPrimaryDark
                    : AppColors.textPrimaryLight,
                width: 1,
              )
            : null,
      ),
      child: pointData.isNotEmpty
          ? Tooltip(
              message: '${_getLocalizedCity(pointData)} - ${_getLocalizedDistrict(pointData)}\n'
                  '${pointData['expats'] ?? pointData['population'] ?? 0} ${pointData['expats'] != null ? 'expats' : 'population'}',
              child: Center(
                child: Text(
                  '${pointData['density']}',
                  style: const TextStyle(
                    color: AppColors.textOnPrimary,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          : null,
    );
  }

  Widget _buildCityLabels() {
    final cities = <String>{};
    for (var point in data) {
      final cityKey = point['cityKey'] ?? point['city'];
      if (cityKey != null) {
        cities.add(cityKey.toString());
      }
    }

    return Wrap(
      spacing: AppSpacing.paddingM,
      runSpacing: AppSpacing.paddingS,
      alignment: WrapAlignment.center,
      children: cities.map((cityKey) {
        final cityData = data.where((e) => (e['cityKey'] ?? e['city']) == cityKey).toList();
        final totalExpats = cityData.fold<int>(
          0,
          (sum, e) => sum + ((e['expats'] ?? e['population'] ?? 0) as int),
        );
        final avgDensity = cityData.fold<int>(
              0,
              (sum, e) => sum + (e['density'] as int),
            ) /
            cityData.length;

        Color color;
        if (avgDensity < 50) {
          color = AppColors.primaryLight;
        } else if (avgDensity < 75) {
          color = AppColors.primary;
        } else {
          color = AppColors.primaryDark;
        }

        final cityName = Cities.getCityName(cityKey);

        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.paddingM,
            vertical: AppSpacing.paddingS,
          ),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(AppSpacing.radiusM),
          ),
          child: Text(
            '$cityName ($totalExpats)',
            style: const TextStyle(
              color: AppColors.textOnPrimary,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      }).toList(),
    );
  }

  String _getLocalizedCity(Map<String, dynamic> pointData) {
    final cityKey = pointData['cityKey'] ?? pointData['city'];
    if (cityKey == null) return '';
    return Cities.getCityName(cityKey.toString());
  }

  String _getLocalizedDistrict(Map<String, dynamic> pointData) {
    final districtKey = pointData['districtKey'] ?? pointData['district'];
    if (districtKey == null) return '';
    return Districts.getDistrictName(districtKey.toString());
  }
}

