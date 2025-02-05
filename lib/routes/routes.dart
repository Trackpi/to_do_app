import 'package:flutter/material.dart';

class AppRoutes {
  static const String splashScreen = "/";

  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
      // return MaterialPageRoute(builder: (_) => SplashScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}'))));
    }
  }
}
