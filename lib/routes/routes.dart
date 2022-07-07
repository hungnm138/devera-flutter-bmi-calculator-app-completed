import 'package:flutter/material.dart';
import '../routes/fade_route.dart';
import '../models/result_bmi.dart';
import '../screens/input_page.dart';
import '../screens/results_page.dart';
import '../screens/splash_screen.dart';

/// Route management class
class RouteGenerator {
  const RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case home:
        return MaterialPageRoute<InputPage>(
          builder: (_) => const InputPage(),
        );
      case inputPage:
        return FadeRoute(
          builder: (_) => const InputPage(),
          settings: settings,
        );
      case splash:
        return MaterialPageRoute<SplashScreen>(
          builder: (_) => const SplashScreen(),
        );
      case resultPage:
        BMIResult result = args as BMIResult;
        return MaterialPageRoute<ResultsPage>(
          builder: (_) => ResultsPage(bmiResult: result),
        );
      default:
        throw const RouteException("Route not found");
    }
  }

  static const home = '/';
  static const splash = 'splash';
  static const inputPage = 'input';
  static const resultPage = 'result';
}

/// Exception thrown when a given route doesn't exist
class RouteException implements Exception {
  final String message;

  const RouteException(this.message);
}
