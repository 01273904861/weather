import 'package:dio/dio.dart';
import 'package:weather/core/networking/api_constants.dart';
import 'package:weather/core/networking/api_error_model.dart';
import 'package:weather/core/networking/dio_factory.dart';
import 'package:weather/features/search/data/models/day_weather.dart';

class ApiService {
  Dio dio = DioFactory.getDio();
  String? cityName;
  String? language;
  int? numOfDays;
  Future<SevenDaysWeather> getSevenDayesWeather(
      {String? cityName, String? language, int? numOfDays}) async {
    this.cityName = cityName ?? 'cairo';
    this.language = language ?? 'en';
    this.numOfDays = numOfDays ?? 7;
    try {
      final res = await dio.get(
        '${ApiConstants.baseUrl}${ApiConstants.forecast}key=${ApiConstants.apiKey}&q=$cityName&days=7&lang=$language',
      );
      //http://api.weatherapi.com/v1/forecast.json?
//key=468ef9d014024a4fa0b224007240610&q=cairo&days=7&lang=ar

      Map<String, dynamic> weatherData = res.data;
      SevenDaysWeather w = SevenDaysWeather.fromJson(weatherData);
      return w;
    } on DioException catch (e) {
      throw (
        ServerException(
          errorModel: ErrorModel.fromJson(e.response?.data),
        ),
      );
    }
  }
}
