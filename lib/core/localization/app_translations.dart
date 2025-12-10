import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:convert';

/// App translations class for GetX localization
/// Supports Arabic (RTL) and English (LTR)
class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': _enTranslations,
        'ar': _arTranslations,
      };

  static Map<String, String> _enTranslations = {};
  static Map<String, String> _arTranslations = {};

  /// Load translations from JSON files
  static Future<void> loadTranslations() async {
    try {
      final enString = await rootBundle.loadString('assets/lang/en.json');
      final arString = await rootBundle.loadString('assets/lang/ar.json');
      _enTranslations = Map<String, String>.from(json.decode(enString));
      _arTranslations = Map<String, String>.from(json.decode(arString));
    } catch (e) {
      // Fallback to hardcoded translations if JSON loading fails
      _enTranslations = _getFallbackEn();
      _arTranslations = _getFallbackAr();
    }
  }

  static Map<String, String> _getFallbackEn() {
    return {
      'app_title': 'Interactive Residency & Smart Expat Insights',
      'residency_title': 'Residency Update',
      'dashboard_title': 'Government Dashboard',
      'settings_title': 'Settings',
      'current_city': 'Current City',
      'district': 'District / Neighborhood',
      'workplace': 'Current Workplace',
      'residents_inside_ksa': 'Number of residents living with you (inside KSA)',
      'residents_outside_ksa': 'Number of residents living with you (outside KSA)',
      'submit': 'Submit',
      'cancel': 'Cancel',
      'save': 'Save',
      'language': 'Language',
      'arabic': 'Arabic',
      'english': 'English',
      'last_update': 'Last Update',
      'update_success': 'Update submitted successfully',
      'validation_required': 'This field is required',
      'validation_invalid': 'Invalid value',
      'validation_number': 'Please enter a valid number',
      'total_expats': 'Total Expats',
      'by_nationality': 'By Nationality',
      'by_city': 'By City',
      'by_district': 'By District',
      'by_gender': 'By Gender',
      'by_age': 'By Age Range',
      'by_job_type': 'By Job Type',
      'heatmap': 'Heatmap',
      'movement_chart': 'Monthly Movement',
      'predictions': 'AI Predictions',
      'in_movement': 'In',
      'out_movement': 'Out',
      'prediction_1': 'Expected increase of Filipino workforce by 12% in the next 6 months.',
      'prediction_2': 'Riyadh – Al Malaz shows higher-than-average housing density.',
      'prediction_3': 'Shortage expected in construction sector workers.',
      'january': 'January',
      'february': 'February',
      'march': 'March',
      'april': 'April',
      'may': 'May',
      'june': 'June',
      'july': 'July',
      'august': 'August',
      'september': 'September',
      'october': 'October',
      'november': 'November',
      'december': 'December',
      'search_placeholder': 'Type here to search',
      'vehicles': 'Vehicles',
      'my_services': 'My Services',
      'labor': 'Labor',
      'family_members': 'Family Members',
      'interactive_residency': 'Interactive Residency',
      'appointments': 'Appointments',
      'login_title': 'Login',
      'login_username_label': 'Username or ID Number',
      'login_password_label': 'Password',
      'login_forgot_password': 'Forgot password?',
      'login_new_user': 'New user?',
      'heatmap_details': 'Area Details',
      'density': 'Density',
      'close': 'Close',
      'city': 'City',
    };
  }

  static Map<String, String> _getFallbackAr() {
    return {
      'app_title': 'تحديث الإقامة والرؤى الذكية للمقيمين',
      'residency_title': 'تحديث الإقامة',
      'dashboard_title': 'لوحة تحكم الحكومية',
      'settings_title': 'الإعدادات',
      'current_city': 'المدينة الحالية',
      'district': 'الحي / المنطقة',
      'workplace': 'مكان العمل الحالي',
      'residents_inside_ksa': 'عدد المقيمين معك في السكن (داخل المملكة)',
      'residents_outside_ksa': 'عدد المقيمين معك في السكن (خارج المملكة)',
      'submit': 'إرسال',
      'cancel': 'إلغاء',
      'save': 'حفظ',
      'language': 'اللغة',
      'arabic': 'العربية',
      'english': 'الإنجليزية',
      'last_update': 'آخر تحديث',
      'update_success': 'تم إرسال التحديث بنجاح',
      'validation_required': 'هذا الحقل مطلوب',
      'validation_invalid': 'قيمة غير صحيحة',
      'validation_number': 'يرجى إدخال رقم صحيح',
      'total_expats': 'إجمالي المقيمين',
      'by_nationality': 'حسب الجنسية',
      'by_city': 'حسب المدينة',
      'by_district': 'حسب الحي',
      'by_gender': 'حسب الجنس',
      'by_age': 'حسب الفئة العمرية',
      'by_job_type': 'حسب نوع العمل',
      'heatmap': 'خريطة الحرارة',
      'movement_chart': 'الحركة الشهرية',
      'predictions': 'التنبؤات الذكية',
      'in_movement': 'وافد',
      'out_movement': 'مغادر',
      'prediction_1': 'متوقع زيادة نسبة العمالة الفلبينية بنسبة ١٢٪ خلال الأشهر الستة القادمة.',
      'prediction_2': 'الرياض - الملز يظهر كثافة سكنية أعلى من المتوسط.',
      'prediction_3': 'متوقع وجود نقص في عمالة قطاع الإنشاءات.',
      'january': 'يناير',
      'february': 'فبراير',
      'march': 'مارس',
      'april': 'أبريل',
      'may': 'مايو',
      'june': 'يونيو',
      'july': 'يوليو',
      'august': 'أغسطس',
      'september': 'سبتمبر',
      'october': 'أكتوبر',
      'november': 'نوفمبر',
      'december': 'ديسمبر',
      'search_placeholder': 'اكتب هنا للبحث',
      'vehicles': 'المركبات',
      'my_services': 'خدماتي',
      'labor': 'العمالة',
      'family_members': 'أفراد الأسرة',
      'interactive_residency': 'الإقامة التفاعلية',
      'appointments': 'مواعيد',
      'login_title': 'تسجيل الدخول',
      'login_username_label': 'اسم المستخدم أو رقم الهوية',
      'login_password_label': 'كلمة المرور',
      'login_forgot_password': 'نسيت كلمة المرور؟',
      'login_new_user': 'مستخدم جديد؟',
      'heatmap_details': 'تفاصيل المنطقة',
      'density': 'الكثافة',
      'close': 'إغلاق',
      'city': 'المدينة',
    };
  }
}

