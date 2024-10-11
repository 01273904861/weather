import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather/core/networking/api_constants.dart';
import 'package:weather/core/networking/api_error_model.dart';
import 'package:weather/core/networking/dio_factory.dart';
import 'package:weather/features/search/data/models/day_weather_model.dart';
import 'package:weather/features/search/data/models/seven_day_model.dart';

//http://api.weatherapi.com/v1/forecast.json?
//key=468ef9d014024a4fa0b224007240610&q=cairo&days=7&lang=ar
class ApiService {
  Dio dio = DioFactory.getDio();

  String? language;
  int? numOfDays;
  Future<SevenDaysWeatherModel> getSevenDayesWeather(
      {required String cityName, String? language, int? numOfDays}) async {
    this.language = language ?? 'en';
    this.numOfDays = numOfDays ?? 7;
    try {
      final res = await dio.get(
        '${ApiConstants.baseUrl}${ApiConstants.forecast}key=${ApiConstants.apiKey}&q=$cityName&days=${this.numOfDays.toString()}&lang=${this.language}',
      );

      Map<String, dynamic> weatherData = res.data;
      SevenDaysWeatherModel w = SevenDaysWeatherModel.fromJson(weatherData);
      print('\n\n\n\n\n\n${w.name}');
      return w;
    } on DioException catch (e) {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          throw (ServerException(
            errorModel: ErrorModel.fromJson(e.response!.data),
          ));
        case DioExceptionType.sendTimeout:
          throw (ServerException(
            errorModel: ErrorModel.fromJson(e.response!.data),
          ));
        case DioExceptionType.receiveTimeout:
          throw (ServerException(
            errorModel: ErrorModel.fromJson(e.response!.data),
          ));
        case DioExceptionType.badCertificate:
          throw (ServerException(
            errorModel: ErrorModel.fromJson(e.response!.data),
          ));
        case DioExceptionType.badResponse:
          throw (ServerException(
            errorModel: ErrorModel.fromJson(e.response!.data),
          ));
        case DioExceptionType.cancel:
          throw (ServerException(
            errorModel: ErrorModel.fromJson(e.response!.data),
          ));
        case DioExceptionType.connectionError:
          throw (ServerException(
            errorModel: ErrorModel.fromJson(e.response!.data),
          ));
        case DioExceptionType.unknown:
          throw (
            ServerException(
              errorModel: ErrorModel.fromJson(e.response!.data),
            ),
          );
      }
    } catch (e) {
      throw (const Text('there is something wrong please try again'));
    }
  }
}
