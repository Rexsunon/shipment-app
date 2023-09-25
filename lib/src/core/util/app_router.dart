import 'package:flutter/material.dart';
import 'package:shipment_app/src/features/calculate/calculate_view.dart';
import 'package:shipment_app/src/features/dashboard/dashboard_view.dart';
import 'package:shipment_app/src/features/search/search_shipment_view.dart';
import 'package:shipment_app/src/features/settings/settings_controller.dart';
import 'package:shipment_app/src/features/settings/settings_view.dart';
import 'package:shipment_app/src/features/shipment_tracking/shipment_view.dart';

class AppRouter {
  final SettingsController settingsController;

  AppRouter(this.settingsController);

  Route<void>? generateRoute(RouteSettings routeSettings) {
    final transitionType = routeSettings.arguments as String?; // Read transition type from arguments

    switch (routeSettings.name) {
      case SettingsView.routeName:
        return _buildRoute(
          routeSettings,
          SettingsView(controller: settingsController),
          transitionType,
        );
      case SearchShipmentView.routeName:
        return _buildRoute(
          routeSettings,
          const SearchShipmentView(),
          transitionType,
        );
      case ShipmentView.routeName:
        return _buildRoute(
          routeSettings,
          const ShipmentView(),
          transitionType,
        );
      case CalculateView.routeName:
        return _buildRoute(
          routeSettings,
          const CalculateView(),
          transitionType,
        );
      case DashboardView.routeName:
      default:
        return _buildRoute(routeSettings, const DashboardView(), transitionType);
    }
  }

  Route<void> _buildRoute(RouteSettings routeSettings, Widget page, String? transitionType) {
    if (transitionType == 'fade') {
      return _fadeTransition(routeSettings, page);
    }
    // Add more transition types here
    return MaterialPageRoute<void>(
      settings: routeSettings,
      builder: (BuildContext context) => page,
    );
  }

  Route<void> _fadeTransition(RouteSettings routeSettings, Widget page) {
    return PageRouteBuilder<void>(
      settings: routeSettings,
      pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
        return FadeTransition(
          opacity: animation,
          child: page,
        );
      },
    );
  }
}
