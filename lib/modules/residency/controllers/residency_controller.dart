import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../models/residency_model.dart';
import '../repositories/residency_repository.dart';
import '../../../routes/app_routes.dart';

/// Residency controller - handles logic and validation only
class ResidencyController extends GetxController {
  final ResidencyRepository _repository = Get.find();
  
  // Form controllers
  final currentCityController = TextEditingController();
  final districtController = TextEditingController();
  final workplaceController = TextEditingController();
  final residentsInsideKSAController = TextEditingController();
  final residentsOutsideKSAController = TextEditingController();
  final averageIncomeController = TextEditingController();
  final dependentsCountController = TextEditingController();

  // Form key
  final formKey = GlobalKey<FormState>();

  // Loading state
  final isLoading = false.obs;

  // Last update date
  final lastUpdateDate = Rx<DateTime?>(null);

  // Selected country
  final selectedCountry = RxString('');

  // Selected education level
  final selectedEducationLevel = RxString('');

  @override
  void onInit() {
    super.onInit();
    _loadLastUpdate();
  }

  @override
  void onClose() {
    currentCityController.dispose();
    districtController.dispose();
    workplaceController.dispose();
    residentsInsideKSAController.dispose();
    residentsOutsideKSAController.dispose();
    averageIncomeController.dispose();
    dependentsCountController.dispose();
    super.onClose();
  }

  /// Load last update date
  void _loadLastUpdate() {
    lastUpdateDate.value = _repository.getLastUpdateDate();
    // Load saved data if exists
    final savedData = _repository.getResidency();
    if (savedData != null) {
      currentCityController.text = savedData.currentCity;
      districtController.text = savedData.district;
      workplaceController.text = savedData.workplace;
      selectedCountry.value = savedData.country;
      residentsInsideKSAController.text = savedData.residentsInsideKSA.toString();
      residentsOutsideKSAController.text = savedData.residentsOutsideKSA.toString();
      averageIncomeController.text = savedData.averageIncome.toString();
      dependentsCountController.text = savedData.dependentsCount.toString();
      selectedEducationLevel.value = savedData.educationLevel;
    }
  }

  /// Submit form
  Future<void> submitForm() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    isLoading.value = true;

    try {
      final model = ResidencyModel(
        currentCity: currentCityController.text.trim(),
        district: districtController.text.trim(),
        workplace: workplaceController.text.trim(),
        country: selectedCountry.value,
        residentsInsideKSA: int.parse(residentsInsideKSAController.text.trim()),
        residentsOutsideKSA: int.parse(residentsOutsideKSAController.text.trim()),
        averageIncome: double.tryParse(averageIncomeController.text.trim()) ?? 0.0,
        dependentsCount: int.tryParse(dependentsCountController.text.trim()) ?? 0,
        educationLevel: selectedEducationLevel.value,
        updatedAt: DateTime.now(),
      );

      final success = await _repository.saveResidency(model);
      
      if (success) {
        Get.toNamed(AppRoutes.residencyConfirmation);
      } else {
        Get.snackbar(
          'Error',
          'Failed to save data',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'An error occurred',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
}

