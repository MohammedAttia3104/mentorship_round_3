import 'package:anime_app_challenge/core/routing/routes.dart';
import 'package:anime_app_challenge/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => HomeScreen(),
        );
      default:
        return null;
    }
  }
}
