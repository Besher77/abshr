import 'dart:async';
import 'package:get/get.dart';
import '../models/census_data_model.dart';
import '../repositories/census_repository.dart';

/// Census controller - handles logic only
class CensusController extends GetxController {
  final CensusRepository _repository = CensusRepository();

  // Data
  final censusData = Rx<CensusDataModel?>(null);
  final heatmapData = <Map<String, dynamic>>[].obs;
  final isLoading = false.obs;
  final lastUpdated = Rx<DateTime?>(null);

  // Auto-refresh timer
  Timer? _refreshTimer;

  @override
  void onInit() {
    super.onInit();
    loadData();
    _startAutoRefresh();
  }

  @override
  void onClose() {
    _refreshTimer?.cancel();
    super.onClose();
  }

  /// Load census data
  void loadData() {
    isLoading.value = true;
    
    try {
      final data = _repository.getCensusData();
      censusData.value = data;
      heatmapData.value = _repository.getHeatmapData();
      lastUpdated.value = data.lastUpdated;
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load census data',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  /// Start auto-refresh every 15 minutes
  void _startAutoRefresh() {
    _refreshTimer = Timer.periodic(
      const Duration(seconds: 15),
      (_) => loadData(),
    );
  }

  /// Manual refresh
  @override
  void refresh() {
    loadData();
  }
}

