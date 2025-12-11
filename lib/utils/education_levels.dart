import 'package:flutter/material.dart';

/// List of all education levels
/// Used for education level dropdown selection
class EducationLevels {
  EducationLevels._();

  static const List<Map<String, String>> allLevels = [
    {'code': 'none', 'en': 'No formal education', 'ar': 'بدون تعليم رسمي'},
    {'code': 'primary', 'en': 'Primary school', 'ar': 'ابتدائي'},
    {'code': 'intermediate', 'en': 'Intermediate school', 'ar': 'متوسط'},
    {'code': 'secondary', 'en': 'Secondary school', 'ar': 'ثانوي'},
    {'code': 'diploma', 'en': 'Diploma', 'ar': 'دبلوم'},
    {'code': 'bachelor', 'en': "Bachelor's degree", 'ar': 'بكالوريوس'},
    {'code': 'master', 'en': "Master's degree", 'ar': 'ماجستير'},
    {'code': 'phd', 'en': 'PhD', 'ar': 'دكتوراه'},
  ];

  /// Get education level name based on current locale
  static String getLevelName(Map<String, String> level, String locale) {
    return locale == 'ar' ? level['ar']! : level['en']!;
  }

  /// Get all education levels as dropdown items
  static List<DropdownMenuItem<String>> getDropdownItems(String locale) {
    return allLevels.map((level) {
      final name = getLevelName(level, locale);
      return DropdownMenuItem<String>(
        value: level['code'],
        child: Text(name),
      );
    }).toList();
  }
}

