import 'package:abshr/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/localization/app_translations.dart';
import 'core/theme/app_theme.dart';
import 'services/local_storage_service.dart';
import 'modules/residency/repositories/residency_repository.dart';
import 'modules/settings/controllers/theme_controller.dart';
import 'routes/app_pages.dart';

/// Main entry point
/// Initializes GetX, localization, services, and routing
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load translations
  await AppTranslations.loadTranslations();

  // Initialize services
  await Get.putAsync(() => LocalStorageService().init());

  // Initialize repositories
  Get.put(ResidencyRepository());

  // Initialize theme controller
  Get.put(ThemeController());

  // Get saved language or default to Arabic
  final storage = Get.find<LocalStorageService>();
  final savedLanguage = storage.getString('app_language') ?? 'ar';
  final locale = Locale(savedLanguage);

  runApp(MyApp(locale: locale));
}

class MyApp extends StatelessWidget {
  final Locale locale;

  const MyApp({super.key, required this.locale});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    
    return Obx(() => GetMaterialApp(
      title: 'Interactive Residency & Smart Expat Insights',
      debugShowCheckedModeBanner: false,
      
      // Theme
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeController.isDarkMode.value 
          ? ThemeMode.dark 
          : ThemeMode.light,
      
      // Localization
      translations: AppTranslations(),
      locale: locale,
      fallbackLocale: const Locale('en'),
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      
      // Routing
      initialRoute: AppRoutes.login,
      getPages: AppPages.pages,
      
      // RTL support
      builder: (context, child) {
        return Directionality(
          textDirection: Get.locale?.languageCode == 'ar' 
              ? TextDirection.rtl 
              : TextDirection.ltr,
          child: child!,
        );
      },
    ));
  }
}
