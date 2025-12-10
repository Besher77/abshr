import 'package:flutter/material.dart';

/// List of all countries
/// Used for country dropdown selection
class Countries {
  Countries._();

  static const List<Map<String, String>> allCountries = [
    {'code': 'SA', 'en': 'Saudi Arabia', 'ar': 'المملكة العربية السعودية'},
    {'code': 'US', 'en': 'United States', 'ar': 'الولايات المتحدة'},
    {'code': 'GB', 'en': 'United Kingdom', 'ar': 'المملكة المتحدة'},
    {'code': 'CA', 'en': 'Canada', 'ar': 'كندا'},
    {'code': 'AU', 'en': 'Australia', 'ar': 'أستراليا'},
    {'code': 'DE', 'en': 'Germany', 'ar': 'ألمانيا'},
    {'code': 'FR', 'en': 'France', 'ar': 'فرنسا'},
    {'code': 'IT', 'en': 'Italy', 'ar': 'إيطاليا'},
    {'code': 'ES', 'en': 'Spain', 'ar': 'إسبانيا'},
    {'code': 'NL', 'en': 'Netherlands', 'ar': 'هولندا'},
    {'code': 'BE', 'en': 'Belgium', 'ar': 'بلجيكا'},
    {'code': 'CH', 'en': 'Switzerland', 'ar': 'سويسرا'},
    {'code': 'AT', 'en': 'Austria', 'ar': 'النمسا'},
    {'code': 'SE', 'en': 'Sweden', 'ar': 'السويد'},
    {'code': 'NO', 'en': 'Norway', 'ar': 'النرويج'},
    {'code': 'DK', 'en': 'Denmark', 'ar': 'الدنمارك'},
    {'code': 'FI', 'en': 'Finland', 'ar': 'فنلندا'},
    {'code': 'IE', 'en': 'Ireland', 'ar': 'أيرلندا'},
    {'code': 'PT', 'en': 'Portugal', 'ar': 'البرتغال'},
    {'code': 'GR', 'en': 'Greece', 'ar': 'اليونان'},
    {'code': 'PL', 'en': 'Poland', 'ar': 'بولندا'},
    {'code': 'CZ', 'en': 'Czech Republic', 'ar': 'جمهورية التشيك'},
    {'code': 'HU', 'en': 'Hungary', 'ar': 'المجر'},
    {'code': 'RO', 'en': 'Romania', 'ar': 'رومانيا'},
    {'code': 'BG', 'en': 'Bulgaria', 'ar': 'بلغاريا'},
    {'code': 'HR', 'en': 'Croatia', 'ar': 'كرواتيا'},
    {'code': 'SK', 'en': 'Slovakia', 'ar': 'سلوفاكيا'},
    {'code': 'SI', 'en': 'Slovenia', 'ar': 'سلوفينيا'},
    {'code': 'EE', 'en': 'Estonia', 'ar': 'إستونيا'},
    {'code': 'LV', 'en': 'Latvia', 'ar': 'لاتفيا'},
    {'code': 'LT', 'en': 'Lithuania', 'ar': 'ليتوانيا'},
    {'code': 'JP', 'en': 'Japan', 'ar': 'اليابان'},
    {'code': 'CN', 'en': 'China', 'ar': 'الصين'},
    {'code': 'KR', 'en': 'South Korea', 'ar': 'كوريا الجنوبية'},
    {'code': 'IN', 'en': 'India', 'ar': 'الهند'},
    {'code': 'PK', 'en': 'Pakistan', 'ar': 'باكستان'},
    {'code': 'BD', 'en': 'Bangladesh', 'ar': 'بنغلاديش'},
    {'code': 'PH', 'en': 'Philippines', 'ar': 'الفلبين'},
    {'code': 'ID', 'en': 'Indonesia', 'ar': 'إندونيسيا'},
    {'code': 'MY', 'en': 'Malaysia', 'ar': 'ماليزيا'},
    {'code': 'SG', 'en': 'Singapore', 'ar': 'سنغافورة'},
    {'code': 'TH', 'en': 'Thailand', 'ar': 'تايلاند'},
    {'code': 'VN', 'en': 'Vietnam', 'ar': 'فيتنام'},
    {'code': 'AE', 'en': 'United Arab Emirates', 'ar': 'الإمارات العربية المتحدة'},
    {'code': 'KW', 'en': 'Kuwait', 'ar': 'الكويت'},
    {'code': 'QA', 'en': 'Qatar', 'ar': 'قطر'},
    {'code': 'BH', 'en': 'Bahrain', 'ar': 'البحرين'},
    {'code': 'OM', 'en': 'Oman', 'ar': 'عُمان'},
    {'code': 'JO', 'en': 'Jordan', 'ar': 'الأردن'},
    {'code': 'LB', 'en': 'Lebanon', 'ar': 'لبنان'},
    {'code': 'SY', 'en': 'Syria', 'ar': 'سوريا'},
    {'code': 'IQ', 'en': 'Iraq', 'ar': 'العراق'},
    {'code': 'YE', 'en': 'Yemen', 'ar': 'اليمن'},
    {'code': 'EG', 'en': 'Egypt', 'ar': 'مصر'},
    {'code': 'LY', 'en': 'Libya', 'ar': 'ليبيا'},
    {'code': 'TN', 'en': 'Tunisia', 'ar': 'تونس'},
    {'code': 'DZ', 'en': 'Algeria', 'ar': 'الجزائر'},
    {'code': 'MA', 'en': 'Morocco', 'ar': 'المغرب'},
    {'code': 'SD', 'en': 'Sudan', 'ar': 'السودان'},
    {'code': 'ET', 'en': 'Ethiopia', 'ar': 'إثيوبيا'},
    {'code': 'KE', 'en': 'Kenya', 'ar': 'كينيا'},
    {'code': 'ZA', 'en': 'South Africa', 'ar': 'جنوب أفريقيا'},
    {'code': 'NG', 'en': 'Nigeria', 'ar': 'نيجيريا'},
    {'code': 'GH', 'en': 'Ghana', 'ar': 'غانا'},
    {'code': 'BR', 'en': 'Brazil', 'ar': 'البرازيل'},
    {'code': 'AR', 'en': 'Argentina', 'ar': 'الأرجنتين'},
    {'code': 'MX', 'en': 'Mexico', 'ar': 'المكسيك'},
    {'code': 'CL', 'en': 'Chile', 'ar': 'تشيلي'},
    {'code': 'CO', 'en': 'Colombia', 'ar': 'كولومبيا'},
    {'code': 'PE', 'en': 'Peru', 'ar': 'بيرو'},
    {'code': 'VE', 'en': 'Venezuela', 'ar': 'فنزويلا'},
    {'code': 'NZ', 'en': 'New Zealand', 'ar': 'نيوزيلندا'},
    {'code': 'RU', 'en': 'Russia', 'ar': 'روسيا'},
    {'code': 'TR', 'en': 'Turkey', 'ar': 'تركيا'},
    {'code': 'IL', 'en': 'Israel', 'ar': 'إسرائيل'},
    {'code': 'IR', 'en': 'Iran', 'ar': 'إيران'},
    {'code': 'AF', 'en': 'Afghanistan', 'ar': 'أفغانستان'},
    {'code': 'NP', 'en': 'Nepal', 'ar': 'نيبال'},
    {'code': 'LK', 'en': 'Sri Lanka', 'ar': 'سريلانكا'},
    {'code': 'MM', 'en': 'Myanmar', 'ar': 'ميانمار'},
    {'code': 'KH', 'en': 'Cambodia', 'ar': 'كمبوديا'},
    {'code': 'LA', 'en': 'Laos', 'ar': 'لاوس'},
  ];

  /// Get country name based on current locale
  static String getCountryName(Map<String, String> country, String locale) {
    return locale == 'ar' ? country['ar']! : country['en']!;
  }

  /// Get all countries as dropdown items
  static List<DropdownMenuItem<String>> getDropdownItems(String locale) {
    return allCountries.map((country) {
      final name = getCountryName(country, locale);
      return DropdownMenuItem<String>(
        value: country['code'],
        child: Text(name),
      );
    }).toList();
  }
}

