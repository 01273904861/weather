import 'package:easy_localization/easy_localization.dart';
import 'package:weather/core/helper/functions.dart';

class HourModel {
  final String image;
  final String time;
  final double temp;
  final String condition;

  HourModel(
      {required this.image,
      required this.time,
      required this.temp,
      required this.condition});
  factory HourModel.fromJson(Map<String, dynamic> hourJson) {
    return HourModel(
        time: getHour(hourJson['time']),
        temp: hourJson['temp_c'],
        image: getWeatherIcon(hourJson['condition']['text']),
        condition: hourJson['condition']['text']);

    //condition "
  }
}

String getHour(String time) {
  DateTime parseTime = DateTime.parse(time);

  // Format the time to 12-hour with AM/PM
  return DateFormat('h a').format(parseTime); // 12 AM
}



