import 'package:flutter/material.dart';
import 'package:weather/core/routing/routes.dart';
import 'package:weather/features/home/home_page.dart';
import 'package:weather/features/onboarding/onboarding.dart';
import 'package:weather/features/search/search.dart';

class AppRouter {
  Route onGenerate(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoarding());
      case Routes.searchPage:
        return MaterialPageRoute(builder: (_) => const SearchPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Text('the ${settings.name} doesn\'t exist '),
          ),
        );
    }
  }
}
