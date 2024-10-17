import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather/core/helper/constants.dart';
import 'package:weather/features/search/data/cubit/weather_states_local.dart';
import 'package:weather/features/search/data/models/seven_day_model.dart';

class WeatherCubitLocal extends Cubit<WeatherLocalStates> {
  WeatherCubitLocal() : super(WeatherInitialStateLocal());
  var weatherBox = Hive.box<SevenDaysWeatherModel>(AppContsnats.weatherBox);

 void  saveWeatherData(SevenDaysWeatherModel sevenDaysWeatherModel) async{
    weatherBox.put(sevenDaysWeatherModel.name, sevenDaysWeatherModel);
    emit(WeatherSavedStateLocal());
  }

  void fetchWeatherData()async {
    final sevenDaysWeatherModels = weatherBox.values.toList();
    if (sevenDaysWeatherModels.isNotEmpty) {
      emit(WeatherFetchedStateLocal(
          sevenDaysWeatherModels: sevenDaysWeatherModels));
    } else {
      emit(WeatherEmptyStateLocal());
    }
  }
  void loadCityWeather(String cityName) {
    final sevenDaysWeatherModel = weatherBox.get(AppContsnats.weatherBox);
    if (sevenDaysWeatherModel != null) {
      emit(WeatherLoadedCityWeatherStateLocal(
          sevenDaysWeatherModel: sevenDaysWeatherModel));
    } else {
      emit(WeatherFailureStateLocal(errorMessage: 'city does\'t founded'));
    }
  }
}
