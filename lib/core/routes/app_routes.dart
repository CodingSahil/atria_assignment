import 'package:atria_assignment/core/routes/routes.dart';
import 'package:atria_assignment/modules/dashboard/dashboard_view.dart';
import 'package:atria_assignment/modules/splash/splash_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  return MaterialPageRoute(
    builder: (context) {
      switch (settings.name) {
        case Routes.home:
          return DashboardView();

        default:
          return SplashScreen();
      }
    },
  );
}
