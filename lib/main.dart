import 'package:flutter/material.dart';
import 'core/network/dio_helper.dart';
import 'core/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Goldy App',
      initialRoute: AppRoutes.login,
      routes: AppRoutes.routes,
    );
  }
}
