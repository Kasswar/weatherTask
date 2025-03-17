import 'package:flutter/material.dart';
import 'package:weather_task/core/constant/app_routes_path.dart';
import 'package:weather_task/features/weather/presentation/screen/weather_screen.dart';

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case AppRoutesPath.weather:
        return MaterialPageRoute(
          builder: (_) => const WeatherScreen(),
        );
    }
    return null;
  }
}
