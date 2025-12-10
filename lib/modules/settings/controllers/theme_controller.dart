import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/local_storage_service.dart';

/// Theme controller - handles theme mode switching
class ThemeController extends GetxController {
  final LocalStorageService _storage = Get.find();
  static const String _themeKey = 'app_theme_mode';

  // Current theme mode
  final isDarkMode = true.obs;

  @override
  void onInit() {
    super.onInit();
    _loadTheme();
  }

  /// Load saved theme preference
  void _loadTheme() {
    final savedTheme = _storage.getString(_themeKey);
    if (savedTheme != null) {
      isDarkMode.value = savedTheme == 'dark';
    }
  }

  /// Toggle theme mode
  Future<void> toggleTheme() async {
    isDarkMode.value = !isDarkMode.value;
    await _storage.setString(_themeKey, isDarkMode.value ? 'dark' : 'light');
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }


  /// Set theme mode
  Future<void> setThemeMode(bool isDark) async {
    isDarkMode.value = isDark;
    await _storage.setString(_themeKey, isDark ? 'dark' : 'light');
    Get.changeThemeMode(isDark ? ThemeMode.dark : ThemeMode.light);
  }
}

