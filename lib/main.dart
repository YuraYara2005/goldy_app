import 'package:flutter/material.dart';
import 'core/network/dio_helper.dart';
import 'core/routes/app_router.dart';
import 'core/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Goldy App',
      initialRoute: Routes.login,
      onGenerateRoute: AppRouter.generateRoute, // Using your new router here!
    );
  }
}
