import '../../../utils/mock_data.dart';

/// Dashboard repository - provides mocked data only
class DashboardRepository {
  /// Get expats by nationality
  Map<String, int> getExpatsByNationality() {
    return MockData.expatsByNationality;
  }

  /// Get expats by city
  Map<String, int> getExpatsByCity() {
    return MockData.expatsByCity;
  }

  /// Get expats by district
  Map<String, int> getExpatsByDistrict() {
    return MockData.expatsByDistrict;
  }

  /// Get expats by gender
  Map<String, int> getExpatsByGender() {
    return MockData.expatsByGender;
  }

  /// Get expats by age
  Map<String, int> getExpatsByAge() {
    return MockData.expatsByAge;
  }

  /// Get expats by job type
  Map<String, int> getExpatsByJobType() {
    return MockData.expatsByJobType;
  }

  /// Get monthly movement data
  List<Map<String, dynamic>> getMonthlyMovement() {
    return MockData.monthlyMovement;
  }

  /// Get predictions
  List<String> getPredictions() {
    return MockData.predictions;
  }

  /// Get heatmap data
  List<Map<String, dynamic>> getHeatmapData() {
    return MockData.heatmapData;
  }

  /// Get total expats
  int getTotalExpats() {
    return MockData.totalExpats;
  }
}

