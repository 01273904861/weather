import 'package:easy_localization/easy_localization.dart';
import 'package:weather/core/theming/app_assets.dart';

class SevenDaysWeatherModel {
  final String name;
  final List<DayWeatherModel> forecastDays;

  SevenDaysWeatherModel({required this.forecastDays, required this.name});
  factory SevenDaysWeatherModel.fromJson(Map<String, dynamic> json) {
     List<dynamic>forecastDays = json['forecast']['forecastday'];
   List<DayWeatherModel> forecastDaysList = [];
   for (var element in forecastDays) {
     forecastDaysList.add(DayWeatherModel.fromJson(element));
   }

    return SevenDaysWeatherModel(
      forecastDays: forecastDaysList,
      name: json['location']['country'],
    );
  }
}

class DayWeatherModel {
  final double avgTemp;
  final double maxTemp;
  final double minTemp;
  final int humidity;
  final double wind;
  final String image;
  final String dayOfWeek;
  final String monthDate;
  final String date;
  DayWeatherModel({
    required this.avgTemp,
    required this.maxTemp,
    required this.minTemp,
    required this.humidity,
    required this.wind,
    required this.image,
    required this.dayOfWeek,
    required this.monthDate,
    required this.date
  });
  factory DayWeatherModel.fromJson(Map<String, dynamic> json) {
    Map day = json['day'];
    String date = json['date'];
    return DayWeatherModel(
      date: date,
      dayOfWeek: getDayOfWeek(date),
      monthDate: getMonthDate(date),
      avgTemp: day['avgtemp_c'],
      minTemp: day['mintemp_c'],
      humidity: day['avghumidity'],
      wind: day['maxwind_kph'],
      image: AppAssets.assetsIconsRainy2,
      maxTemp: day['maxtemp_c'],
    );
  }
}

String getImage(double temp) {
  if (temp <= 5) {
    return AppAssets.assetsImagesSnow;
  } else if (temp <= 10) {
    return AppAssets.assetsIconsSnowy;
  }
  if (temp <= 15) {
    return AppAssets.assetsIconsRainy3;
  }
  if (temp <= 20) {
    return AppAssets.assetsIconsRainy2;
  }
  if (temp <= 25) {
    return AppAssets.assetsImagesRainy;
  }
  if (temp <= 25) {
    return AppAssets.assetsImagesRainy;
  }
  return AppAssets.assetsImagesSnow;
}

String getDayOfWeek(String dateStr) {
  // Parse the string into a DateTime object
  DateTime parsedDate = DateFormat('yyyy-MM-dd').parse(dateStr);

  // Get the abbreviated day of the week (like 'Thu' for Thursday)
  return DateFormat('EEE')
      .format(parsedDate)
      .toString(); // 'EEE' gives day abbreviation
}

String getMonthDate(String dateStr) {
  DateTime parsedDate = DateFormat('yyyy-MM-dd').parse(dateStr);
  // Format the date as "Oct, 10"
  return DateFormat('MMM, dd').format(parsedDate).toString();
}
