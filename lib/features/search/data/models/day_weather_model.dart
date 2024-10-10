import 'package:weather/core/theming/app_assets.dart';

class SevenDaysWeatherModel {
  final String name;
  final List<DayWeatherModel> forecastDays;

  SevenDaysWeatherModel({required this.forecastDays, required this.name});
  factory SevenDaysWeatherModel.fromJson(Map<String, dynamic> json) {
    return SevenDaysWeatherModel(
      forecastDays: [
        DayWeatherModel.fromJson(json['forecast']['forecastday'][0]),
        DayWeatherModel.fromJson(json['forecast']['forecastday'][1]),
        DayWeatherModel.fromJson(json['forecast']['forecastday'][2]),
        DayWeatherModel.fromJson(json['forecast']['forecastday'][3]),
        DayWeatherModel.fromJson(json['forecast']['forecastday'][4]),
        DayWeatherModel.fromJson(json['forecast']['forecastday'][5]),
        DayWeatherModel.fromJson(json['forecast']['forecastday'][6]),
      ],
      name: json['location']['country'],
    );
  }
}

class DayWeatherModel {
  final String date;
  final double avgTemp;
  final double maxTemp;
  final double minTemp;
  final int humidity;
  final double wind;
  final String image;

  DayWeatherModel({
    required this.date,
    required this.avgTemp,
    required this.maxTemp,
    required this.minTemp,
    required this.humidity,
    required this.wind,
    required this.image,
  });
  factory DayWeatherModel.fromJson(Map<String, dynamic> json) {
    Map day = json['day'];
    return DayWeatherModel(
      date: json['date'],
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
