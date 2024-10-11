import 'package:easy_localization/easy_localization.dart';
import 'package:weather/core/theming/app_assets.dart';

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


String getWeatherIcon(String condition) {
  condition = condition.toLowerCase();

  if (condition.contains('clear')) {
    return AppAssets.assetsImagesClear;
  } else if (condition.contains('sunny')) {
    return AppAssets.assetsIconsSunny;
  } else if (condition.contains('cloudy')) {
    return AppAssets.assetsIconsCloudy;
  } else if (condition.contains('partly cloudy')) {
    return AppAssets.assetsImagesCloudy;
  } else if (condition.contains('overcast')) {
    return AppAssets.assetsImagesClear;
  } else if (condition.contains('thunderstorm')) {
    return AppAssets.assetsImagesThunderstorm;
  } else if (condition.contains('light rain')) {
    return AppAssets.assetsImagesRainy;
  } else if (condition.contains('heavy rain')) {
    return AppAssets.assetsIconsRainy3;
  } else if (condition.contains('moderate rain')) {
    return AppAssets.assetsIconsRainy2;
  } else if (condition.contains('snow')) {
    return AppAssets.assetsIconsSnowy;
  } else if (condition.contains('sleet')) {
    return AppAssets.assetsImagesThunderstorm;
  } else if (condition.contains('patchy rain')) {
    return AppAssets.assetsIconsRainyAndSunny;
  } else if (condition.contains('rain shower')) {
    return AppAssets.assetsIconsRainy3;
  } else if (condition.contains('hail')) {
    return AppAssets.assetsIconsStorm2;
  } else {
    // Default icon for unknown conditions
    return AppAssets.assetsImagesClear;
  }
}

