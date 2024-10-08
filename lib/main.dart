import 'package:flutter/material.dart';
import 'package:weather/core/routing/app_router.dart';
import 'package:weather/features/weather_app.dart';

void main() {

  runApp( WeatherApp(appRouter: AppRouter(),));
}
