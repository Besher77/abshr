import 'dart:ui';

import 'package:get/get.dart';
import '../../../services/local_storage_service.dart';
import 'theme_controller.dart';

/// Settings controller - handles logic only
class SettingsController extends GetxController {
  final LocalStorageService _storage = Get.find();
  final ThemeController themeController = Get.find<ThemeController>();
  static const String _languageKey = 'app_language';

  // Current language
  final currentLanguage = 'ar'.obs;

  @override
  void onInit() {
    super.onInit();
    _loadLanguage();
  }

  /// Load saved language preference
  void _loadLanguage() {
    final savedLanguage = _storage.getString(_languageKey);
    if (savedLanguage != null) {
      currentLanguage.value = savedLanguage;
      Get.updateLocale(Locale(savedLanguage));
    }
  }

  /// Change language
  Future<void> changeLanguage(String languageCode) async {
    currentLanguage.value = languageCode;
    Get.updateLocale(Locale(languageCode));
    await _storage.setString(_languageKey, languageCode);
  }
}

