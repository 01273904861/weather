import 'package:flutter/material.dart';
import 'package:weather/core/networking/api_service.dart';
import 'package:weather/weather_app.dart';

void main() {
  ApiService().getSevenDayesWeather();
  runApp(const WeatherApp());
}
