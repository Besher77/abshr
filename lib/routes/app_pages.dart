import 'package:get/get.dart';
import '../modules/home/views/home_view.dart';
import '../modules/residency/views/residency_form_view.dart';
import '../modules/residency/views/residency_confirmation_view.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/dashboard/views/dashboard_stats_view.dart';
import '../modules/dashboard/views/dashboard_heatmap_view.dart';
import '../modules/dashboard/views/dashboard_movement_view.dart';
import '../modules/dashboard/views/dashboard_predictions_view.dart';
import '../modules/census/views/census_overview_view.dart';
import '../modules/census/views/census_city_distribution_view.dart';
import '../modules/census/views/census_demographics_view.dart';
import '../modules/census/views/census_forecasts_view.dart';
import '../modules/census/views/census_services_view.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/login/views/login_view.dart';
import 'app_routes.dart';

/// App pages configuration for GetX routing
class AppPages {
  AppPages._();

  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
    ),
    GetPage(
      name: AppRoutes.residency,
      page: () => const ResidencyFormView(),
    ),
    GetPage(
      name: AppRoutes.residencyConfirmation,
      page: () => const ResidencyConfirmationView(),
    ),
    GetPage(
      name: AppRoutes.dashboard,
      page: () => const DashboardView(),
    ),
    GetPage(
      name: AppRoutes.dashboardStats,
      page: () => const DashboardStatsView(),
    ),
    GetPage(
      name: AppRoutes.dashboardHeatmap,
      page: () => const DashboardHeatmapView(),
    ),
    GetPage(
      name: AppRoutes.dashboardMovement,
      page: () => const DashboardMovementView(),
    ),
    GetPage(
      name: AppRoutes.dashboardPredictions,
      page: () => const DashboardPredictionsView(),
    ),
    GetPage(
      name: AppRoutes.censusHub,
      page: () => const CensusOverviewView(),
    ),
    GetPage(
      name: AppRoutes.censusCityDistribution,
      page: () => const CensusCityDistributionView(),
    ),
    GetPage(
      name: AppRoutes.censusDemographics,
      page: () => const CensusDemographicsView(),
    ),
    GetPage(
      name: AppRoutes.censusForecasts,
      page: () => const CensusForecastsView(),
    ),
    GetPage(
      name: AppRoutes.censusServices,
      page: () => const CensusServicesView(),
    ),
    GetPage(
      name: AppRoutes.settings,
      page: () => const SettingsView(),
    ),
  ];
}

