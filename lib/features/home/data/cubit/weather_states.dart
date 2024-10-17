import 'package:weather/core/networking/api_error_model.dart';
import 'package:weather/features/search/data/models/seven_day_model.dart';

abstract class WeatherStates {}

class WeatherInitial extends WeatherStates {}

class WeatherLoading extends WeatherStates {}

class WeatherFailure extends WeatherStates {
  final ErrorModel errorModel;

  WeatherFailure({required this.errorModel});
}

class WeatherSucess extends WeatherStates {
  final SevenDaysWeatherModel sevenDaysWeather;

  WeatherSucess({required this.sevenDaysWeather});
}
