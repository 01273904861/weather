import 'package:flutter/material.dart';
import 'package:weather/core/helper/constants.dart';
import 'package:weather/core/routing/app_router.dart';
import 'package:weather/features/search/data/models/day_weather_model.dart';
import 'package:weather/features/search/data/models/hour_model.dart';
import 'package:weather/features/search/data/models/seven_day_model.dart';
import 'package:weather/features/weather_app.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(SevenDaysWeatherModelAdapter());
  Hive.registerAdapter(DayWeatherModelAdapter());
  Hive.registerAdapter(HourModelAdapter());
  await Hive.openBox<SevenDaysWeatherModel>(AppContsnats.weatherBox);
  runApp(WeatherApp(
    appRouter: AppRouter(),
  ));
}
