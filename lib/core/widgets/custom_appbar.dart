import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Custom app bar with optional language switcher
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleKey;
  final bool showLanguageSwitcher;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    required this.titleKey,
    this.showLanguageSwitcher = false,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(titleKey.tr),
      actions: [
        if (showLanguageSwitcher) _buildLanguageSwitcher(),
        ...?actions,
      ],
    );
  }

  Widget _buildLanguageSwitcher() {
    final currentLocale = Get.locale?.languageCode ?? 'ar';
    return IconButton(
      icon: const Icon(Icons.language),
      tooltip: 'language'.tr,
      onPressed: () {
        final newLocale = currentLocale == 'ar' ? const Locale('en') : const Locale('ar');
        Get.updateLocale(newLocale);
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

