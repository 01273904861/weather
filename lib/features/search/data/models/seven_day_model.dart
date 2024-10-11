
import 'package:weather/features/search/data/models/day_weather_model.dart';

class SevenDaysWeatherModel {
  final String name;
  final List<DayWeatherModel> forecastDays;

  factory SevenDaysWeatherModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> forecastDays = json['forecast']['forecastday'];
    List<DayWeatherModel> forecastDaysList = [];
    for (var element in forecastDays) {
      forecastDaysList.add(DayWeatherModel.fromJson(element));
    }

    return SevenDaysWeatherModel(
      forecastDays: forecastDaysList,
      name: json['location']['country'],
    );
  }

  SevenDaysWeatherModel({
    required this.name,
    required this.forecastDays,
  });
}
