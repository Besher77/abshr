import 'package:get/get.dart';

/// Validation utility functions
/// All form validators should be defined here
class Validators {
  Validators._();

  /// Required field validator
  static String? required(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'validation_required'.tr;
    }
    return null;
  }

  /// Number validator
  static String? number(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'validation_required'.tr;
    }
    final num = int.tryParse(value);
    if (num == null || num < 0) {
      return 'validation_number'.tr;
    }
    return null;
  }

  /// Optional number validator
  static String? optionalNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return null;
    }
    final num = int.tryParse(value);
    if (num == null || num < 0) {
      return 'validation_number'.tr;
    }
    return null;
  }
}

