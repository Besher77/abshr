import '../../../utils/census_mock_data.dart';
import '../models/census_data_model.dart';

/// Census repository - provides mocked census data only
class CensusRepository {
  /// Get current census data
  CensusDataModel getCensusData() {
    return CensusDataModel(
      totalPopulation: CensusMockData.totalPopulation,
      citizens: CensusMockData.citizens,
      expats: CensusMockData.expats,
      cityDistribution: CensusMockData.cityDistribution,
      districtDistribution: CensusMockData.districtDistribution,
      ageGroups: CensusMockData.ageGroups,
      genderDistribution: CensusMockData.genderDistribution,
      nationalityDistribution: CensusMockData.nationalityDistribution,
      forecasts: CensusMockData.forecasts,
      serviceUsage: CensusMockData.serviceUsage,
      lastUpdated: DateTime.now(),
    );
  }

  /// Get heatmap data for census
  List<Map<String, dynamic>> getHeatmapData() {
    return CensusMockData.censusHeatmapData;
  }
}

