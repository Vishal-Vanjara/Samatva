import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'routes/app_routes.dart';
import 'screens/splash/splash_screen.dart';

void main() {
  runApp(const SamatvaApp());
}

class SamatvaApp extends StatelessWidget {
  const SamatvaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Samatva',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialRoute: SplashScreen.routeName,
      routes: AppRoutes.routes,
    );
  }
}
