import 'package:get/get.dart';

/// Saudi districts with Arabic and English names
class Districts {
  Districts._();

  static const Map<String, Map<String, String>> allDistricts = {
    // Riyadh districts
    'al_malaz': {'en': 'Al Malaz', 'ar': 'الملز'},
    'al_olaya': {'en': 'Al Olaya', 'ar': 'العليا'},
    'al_naseem': {'en': 'Al Naseem', 'ar': 'النظيم'},
    'al_wurud': {'en': 'Al Wurud', 'ar': 'الورود'},
    'al_faisaliah': {'en': 'Al Faisaliah', 'ar': 'الفيصلية'},
    'al_shumaisi': {'en': 'Al Shumaisi', 'ar': 'الشُميسي'},
    'al_murabba': {'en': 'Al Murabba', 'ar': 'المربع'},
    
    // Jeddah districts
    'al_balad': {'en': 'Al Balad', 'ar': 'البلد'},
    'al_hamra': {'en': 'Al Hamra', 'ar': 'الحمراء'},
    'al_rawdah': {'en': 'Al Rawdah', 'ar': 'الروضة'},
    'al_shati': {'en': 'Al Shati', 'ar': 'الشاطئ'},
    'al_aziziyah_jeddah': {'en': 'Al Aziziyah', 'ar': 'العزيزية'},
    
    // Dammam districts
    'al_faisaliyah': {'en': 'Al Faisaliyah', 'ar': 'الفيصلية'},
    'al_corniche_dammam': {'en': 'Al Corniche', 'ar': 'الكورنيش'},
    'al_aziziyah_dammam': {'en': 'Al Aziziyah', 'ar': 'العزيزية'},
    'al_shatea': {'en': 'Al Shatea', 'ar': 'الشاطئ'},
    
    // Mecca districts
    'al_haram_mecca': {'en': 'Al Haram', 'ar': 'الحرم'},
    'al_aziziyah_mecca': {'en': 'Al Aziziyah', 'ar': 'العزيزية'},
    'al_shisha': {'en': 'Al Shisha', 'ar': 'الشيشة'},
    
    // Medina districts
    'al_haram_medina': {'en': 'Al Haram', 'ar': 'الحرم'},
    'al_qiblatain': {'en': 'Al Qiblatain', 'ar': 'القبلتين'},
    'al_anbariyah': {'en': 'Al Anbariyah', 'ar': 'العنبرية'},
    
    // Khobar districts
    'al_corniche_khobar': {'en': 'Al Corniche', 'ar': 'الكورنيش'},
    'al_izdihar': {'en': 'Al Izdihar', 'ar': 'الازدهار'},
    'al_hamra_khobar': {'en': 'Al Hamra', 'ar': 'الحمراء'},
    
    'other': {'en': 'Other', 'ar': 'أخرى'},
  };

  /// Get district name based on current locale
  static String getDistrictName(String districtKey) {
    final locale = Get.locale?.languageCode ?? 'en';
    // Try exact match first
    var district = allDistricts[districtKey.toLowerCase()];
    
    // If not found, try partial match (e.g., "Al Malaz" -> "al_malaz")
    if (district == null) {
      final normalizedKey = districtKey.toLowerCase().replaceAll(' ', '_');
      district = allDistricts[normalizedKey];
    }
    
    if (district == null) return districtKey;
    return locale == 'ar' ? district['ar']! : district['en']!;
  }

  /// Get all districts as localized map
  static Map<String, int> getLocalizedDistrictMap(Map<String, int> districtData) {
    final locale = Get.locale?.languageCode ?? 'en';
    final localizedMap = <String, int>{};
    
    for (var entry in districtData.entries) {
      final districtKey = entry.key.toLowerCase().replaceAll(' ', '_');
      final district = allDistricts[districtKey];
      if (district != null) {
        final name = locale == 'ar' ? district['ar']! : district['en']!;
        localizedMap[name] = entry.value;
      } else {
        localizedMap[entry.key] = entry.value;
      }
    }
    
    return localizedMap;
  }
}

