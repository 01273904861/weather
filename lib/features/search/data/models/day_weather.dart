class SevenDaysWeather {
  final String name;
  final List<DayWeather> days;

  SevenDaysWeather({required this.days, required this.name});
  factory SevenDaysWeather.fromJson(Map<String, dynamic> json) {
    return SevenDaysWeather(days: [
      DayWeather.fromJson(json['forecast']['forecastday'][0]),
      DayWeather.fromJson(json['forecast']['forecastday'][1]),
      DayWeather.fromJson(json['forecast']['forecastday'][2]),
      DayWeather.fromJson(json['forecast']['forecastday'][3]),
      DayWeather.fromJson(json['forecast']['forecastday'][4]),
      DayWeather.fromJson(json['forecast']['forecastday'][5]),
      DayWeather.fromJson(json['forecast']['forecastday'][6]),
    ], name: json['location']['name'],);
  }
}

class DayWeather {
  final String date;
  final double avgTemp;
  final double maxTemp;
  final double minTemp;
  final int humidity;
  final double wind;
  final String image;

  DayWeather({
    required this.date,
    required this.avgTemp,
    required this.maxTemp,
    required this.minTemp,
    required this.humidity,
    required this.wind,
    required this.image,
  });
  factory DayWeather.fromJson(Map<String, dynamic> json) {
    Map day = json['day'];
    return DayWeather(
      date: json['date'],
      avgTemp: day['avgtemp_c'],
      minTemp: day['mintemp_c'],
      humidity: day['avghumidity'],
      wind: day['maxwind_kph'],
      image: day['condition']['icon'],
      maxTemp: day['maxtemp_c'],
    );
  }
}
