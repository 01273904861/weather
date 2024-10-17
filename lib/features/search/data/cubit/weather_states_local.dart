import 'package:weather/core/networking/api_error_model.dart';
import 'package:weather/features/search/data/models/seven_day_model.dart';

abstract class WeatherLocalStates {}

class WeatherInitialStateLocal extends WeatherLocalStates {}

class WeatherLoadingStateLocal extends WeatherLocalStates {}


class WeatherFailureStateLocal extends WeatherLocalStates {
  final String errorMessage;

  WeatherFailureStateLocal({required this.errorMessage});
}

class WeatherSavedStateLocal extends WeatherLocalStates {}

class WeatherFetchedStateLocal extends WeatherLocalStates {
  final List<SevenDaysWeatherModel> sevenDaysWeatherModels;

  WeatherFetchedStateLocal({required this.sevenDaysWeatherModels});
}

class WeatherLoadedCityWeatherStateLocal extends WeatherLocalStates {
  final SevenDaysWeatherModel sevenDaysWeatherModel;

  WeatherLoadedCityWeatherStateLocal({required this.sevenDaysWeatherModel});
}

class WeatherEmptyStateLocal extends WeatherLocalStates{}