import 'package:easy_localization/easy_localization.dart';
import 'package:weather/core/helper/functions.dart';
import 'package:weather/core/theming/app_assets.dart';
import 'package:weather/features/search/data/models/hour_model.dart';

class DayWeatherModel {
  final List<HourModel> hourModels;
  final double avgTemp;
  final double maxTemp;
  final double minTemp;
  final int humidity;
  final double wind;
  final String image;
  final String dayOfWeek;
  final String monthDate;
  final String date;
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


