import 'dart:convert';

import 'package:get/get.dart';
import '../models/business_question.dart';
import '../repositories/business_stats_repository.dart';
import '../../../services/local_storage_service.dart';

/// Controller for business stats form (read-only data rendering)
class BusinessStatsController extends GetxController {
  final BusinessStatsRepository _repository = BusinessStatsRepository();
  final sections = <BusinessSection>[].obs;
  final selections = <String, String>{}.obs;

  static const _storageKey = 'business_stats_answers';

  @override
  void onInit() {
    sections.assignAll(_repository.getSections());
    _loadSelections();
    super.onInit();
  }

  void selectOption(String questionKey, String optionKey) {
    selections[questionKey] = optionKey;
    selections.refresh(); // Force update for RxMap
    _persistSelections();
  }

  void _loadSelections() {
    try {
      final storage = Get.find<LocalStorageService>();
      final saved = storage.getString(_storageKey);
      if (saved != null && saved.isNotEmpty) {
        final decoded = json.decode(saved) as Map<String, dynamic>;
        selections.assignAll(decoded.map((k, v) => MapEntry(k, v.toString())));
      }
    } catch (_) {
      // ignore load errors
    }
  }

  void _persistSelections() {
    try {
      final storage = Get.find<LocalStorageService>();
      storage.setString(_storageKey, json.encode(selections));
    } catch (_) {
      // ignore save errors
    }
  }
}

