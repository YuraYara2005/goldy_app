import 'package:flutter/material.dart';
import 'routes.dart';
import '../../features/auth/login_screen.dart';
import '../../features/auth/register_screen.dart';
import '../../features/home/home_screen.dart';
import '../../features/home/silver_details_screen.dart';
import '../../features/home/gold_details_screen.dart'; // <-- NEW IMPORT

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.silverDetails:
        return MaterialPageRoute(builder: (_) => const SilverDetailsScreen());
      case Routes.goldDetails: // <-- NEW ROUTE LOGIC
        return MaterialPageRoute(builder: (_) => const GoldDetailsScreen());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              Scaffold(body: Center(child: Text('No route defined'))),
        );
    }
  }
}
