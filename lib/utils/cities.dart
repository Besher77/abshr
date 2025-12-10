import 'package:get/get.dart';

/// Saudi cities with Arabic and English names
class Cities {
  Cities._();

  static const Map<String, Map<String, String>> allCities = {
    'riyadh': {'en': 'Riyadh', 'ar': 'الرياض'},
    'jeddah': {'en': 'Jeddah', 'ar': 'جدة'},
    'mecca': {'en': 'Mecca', 'ar': 'مكة المكرمة'},
    'medina': {'en': 'Medina', 'ar': 'المدينة المنورة'},
    'dammam': {'en': 'Dammam', 'ar': 'الدمام'},
    'khobar': {'en': 'Khobar', 'ar': 'الخبر'},
    'taif': {'en': 'Taif', 'ar': 'الطائف'},
    'abha': {'en': 'Abha', 'ar': 'أبها'},
    'tabuk': {'en': 'Tabuk', 'ar': 'تبوك'},
    'other': {'en': 'Other', 'ar': 'أخرى'},
  };

  /// Get city name based on current locale
  static String getCityName(String cityKey) {
    final locale = Get.locale?.languageCode ?? 'en';
    final city = allCities[cityKey.toLowerCase()];
    if (city == null) return cityKey;
    return locale == 'ar' ? city['ar']! : city['en']!;
  }

  /// Get all cities as localized map
  static Map<String, int> getLocalizedCityMap(Map<String, int> cityData) {
    final locale = Get.locale?.languageCode ?? 'en';
    final localizedMap = <String, int>{};
    
    for (var entry in cityData.entries) {
      final cityKey = entry.key.toLowerCase();
      final city = allCities[cityKey];
      if (city != null) {
        final name = locale == 'ar' ? city['ar']! : city['en']!;
        localizedMap[name] = entry.value;
      } else {
        localizedMap[entry.key] = entry.value;
      }
    }
    
    return localizedMap;
  }
}

