import 'package:hive/hive.dart';
import 'package:weather/features/search/data/models/day_weather_model.dart';
part 'seven_day_model.g.dart';

@HiveType(typeId: 0)
class SevenDaysWeatherModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
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
