import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather/core/networking/api_error_model.dart';
import 'package:weather/core/networking/api_service.dart';
import 'package:weather/features/home/data/cubit/weather_states.dart';
import 'package:weather/features/search/data/models/seven_day_model.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  TextEditingController searchController = TextEditingController();

  WeatherCubit() : super(WeatherInitial());
  SevenDaysWeatherModel? sevenDaysWeather;
  getSevenDaysWeather() async {
    try {
      String cityName =
          searchController.text.isEmpty ? 'cairo' : searchController.text;
      emit(WeatherLoading());
      sevenDaysWeather =
          await ApiService().getSevenDayesWeather(cityName: cityName);
      emit(WeatherSucess(sevenDaysWeather: sevenDaysWeather!));
    } on ServerException catch (e) {
      emit(WeatherFailure(errorModel: e.errorModel));
    } catch (e) {
      emit(WeatherFailure(
          errorModel: ErrorModel(
              message:
                  'there is an error please try again or check your connection',
              code: 404)));
    }
  }
}
