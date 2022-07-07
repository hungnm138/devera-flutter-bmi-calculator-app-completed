import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../localization/app_localization.dart';
import '../constants/app_colors.dart';
import 'localization/localization_delegate.dart';
import 'routes/routes.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: AppColors.appPrimaryColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.appPrimaryColor,
        ),
        scaffoldBackgroundColor: AppColors.appPrimaryColor,
      ),
      initialRoute: RouteGenerator.splash,
      onGenerateRoute: RouteGenerator.generateRoute,
      locale: const Locale("vi", "VN"),
      // locale: const Locale("en", "EN"),
      localizationsDelegates: const [
        AppLocalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale.fromSubtags(languageCode: "en"),
        Locale.fromSubtags(languageCode: "vi"),
      ],
      onGenerateTitle: (context) => context.localize("title"),
    );
  }
}
