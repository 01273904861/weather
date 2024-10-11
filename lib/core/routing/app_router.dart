import 'package:flutter/material.dart';
import 'package:weather/core/routing/routes.dart';
import 'package:weather/features/home/home_page.dart';
import 'package:weather/features/home/ui/views/forecast_report_view.dart';
import 'package:weather/features/onboarding/onboarding.dart';
import 'package:weather/features/search/data/models/day_weather_model.dart';
import 'package:weather/features/search/search_page.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoarding());
      case Routes.searchPage:
        return MaterialPageRoute(builder: (_) => const SearchPage());
      case Routes.forecastPage:
        final sevenDaysWeatherModel =
            settings.arguments as SevenDaysWeatherModel; // Get the argument
        return MaterialPageRoute(
            builder: (_) => ForecastReportPage(
                sevenDaysWeatherModel: sevenDaysWeatherModel));

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Text('the ${settings.name} doesn\'t exist '),
          ),
        );
    }
  }
}
