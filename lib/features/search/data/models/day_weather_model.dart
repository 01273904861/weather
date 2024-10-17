import 'package:hive/hive.dart';
import 'package:weather/core/helper/functions.dart';
import 'package:weather/features/search/data/models/hour_model.dart';
part 'day_weather_model.g.dart';
@HiveType(typeId: 1)
class DayWeatherModel {
  @HiveField(0)
  final List<HourModel> hourModels;
  @HiveField(1)
  final double avgTemp;
  @HiveField(2)
  final double maxTemp;
  @HiveField(3)
  final double minTemp;
  @HiveField(4)
  final int humidity;
  @HiveField(5)
  final double wind;
  @HiveField(6)
  final String image;
  @HiveField(7)
  final String dayOfWeek;
  @HiveField(8)
  final String monthDate;
  @HiveField(9)
  final String date;
  @HiveField(10)
  final String condition;
  DayWeatherModel(
      {required this.avgTemp,
      required this.maxTemp,
      required this.minTemp,
      required this.humidity,
      required this.wind,
      required this.image,
      required this.dayOfWeek,
      required this.monthDate,
      required this.hourModels,
      required this.condition,
      required this.date});
  factory DayWeatherModel.fromJson(Map<String, dynamic> forecastdayJson) {
    Map day = forecastdayJson['day'];

    String date = forecastdayJson['date'];

    List<dynamic> hours = forecastdayJson['hour'];
    List<HourModel> hoursList = [];
    for (var hour in hours) {
      hoursList.add(HourModel.fromJson(hour));
    }
    return DayWeatherModel(
      condition: day['condition']['text'],
      date: date,
      dayOfWeek: getDayOfWeek(date),
      monthDate: getMonthDate(date),
      avgTemp: day['avgtemp_c'],
      minTemp: day['mintemp_c'],
      humidity: day['avghumidity'],
      wind: day['maxwind_kph'],
      image: getWeatherIcon(day['condition']['text']),
      maxTemp: day['maxtemp_c'],
      hourModels: hoursList,
    );
  }
}
