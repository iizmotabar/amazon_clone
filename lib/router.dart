import 'package:amazon_clone_app/screens/auth_screen.dart';
import 'package:amazon_clone_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const AuthScreen(),
        settings: settings,
      );
    case HomeScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const HomeScreen(),
        settings: settings,
      );
    default:
      return MaterialPageRoute(
          settings: settings,
          builder: (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ));
  }
}
