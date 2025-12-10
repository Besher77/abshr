import 'package:get/get.dart';
import '../repositories/dashboard_repository.dart';

/// Dashboard controller - handles logic only
class DashboardController extends GetxController {
  final DashboardRepository _repository = DashboardRepository();

  // Data
  final totalExpats = 0.obs;
  final expatsByNationality = <String, int>{}.obs;
  final expatsByCity = <String, int>{}.obs;
  final expatsByDistrict = <String, int>{}.obs;
  final expatsByGender = <String, int>{}.obs;
  final expatsByAge = <String, int>{}.obs;
  final expatsByJobType = <String, int>{}.obs;
  final monthlyMovement = <Map<String, dynamic>>[].obs;
  final predictions = <String>[].obs;
  final heatmapData = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  /// Load all dashboard data
  void loadData() {
    totalExpats.value = _repository.getTotalExpats();
    expatsByNationality.value = _repository.getExpatsByNationality();
    expatsByCity.value = _repository.getExpatsByCity();
    expatsByDistrict.value = _repository.getExpatsByDistrict();
    expatsByGender.value = _repository.getExpatsByGender();
    expatsByAge.value = _repository.getExpatsByAge();
    expatsByJobType.value = _repository.getExpatsByJobType();
    monthlyMovement.value = _repository.getMonthlyMovement();
    predictions.value = _repository.getPredictions();
    heatmapData.value = _repository.getHeatmapData();
  }
}

