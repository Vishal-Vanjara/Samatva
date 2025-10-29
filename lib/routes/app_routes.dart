import 'package:flutter/material.dart';
import '../screens/splash/splash_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/quiz/quiz_screen.dart';
import '../screens/result/result_screen.dart';


class AppRoutes {
  static final routes = <String, WidgetBuilder>{
    SplashScreen.routeName: (context) => const SplashScreen(),
    HomeScreen.routeName: (context) => const HomeScreen(),
    QuizScreen.routeName: (context) => const QuizScreen(),
    ResultScreen.routeName: (context) => const ResultScreen(doshaScores: {},),
  };
}
