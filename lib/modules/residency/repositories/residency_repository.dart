import 'dart:convert';
import 'package:get/get.dart';
import '../models/residency_model.dart';
import '../../../services/local_storage_service.dart';

/// Residency repository - provides data only
/// Handles local storage operations for residency data
class ResidencyRepository {
  final LocalStorageService _storage = Get.find();
  static const String _storageKey = 'residency_data';

  /// Save residency data
  Future<bool> saveResidency(ResidencyModel model) async {
    try {
      final json = model.toJson();
      final jsonString = jsonEncode(json);
      return await _storage.setString(_storageKey, jsonString);
    } catch (e) {
      return false;
    }
  }

  /// Get residency data
  ResidencyModel? getResidency() {
    try {
      final jsonString = _storage.getString(_storageKey);
      if (jsonString == null) return null;
      final json = jsonDecode(jsonString) as Map<String, dynamic>;
      return ResidencyModel.fromJson(json);
    } catch (e) {
      return null;
    }
  }

  /// Get last update date
  DateTime? getLastUpdateDate() {
    final model = getResidency();
    return model?.updatedAt;
  }
}
