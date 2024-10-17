import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/features/search/data/cubit/weather_cubit_local.dart';
import 'package:weather/features/search/data/cubit/weather_states_local.dart';
import 'package:weather/features/search/data/models/seven_day_model.dart';
import 'package:weather/features/search/ui/widgets/custom_grid_view.dart';

class RecentSearchedWeather extends StatelessWidget {
  const RecentSearchedWeather({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<WeatherCubitLocal, WeatherLocalStates>(
        builder: (context, state) {
          if (state is WeatherFetchedStateLocal) {
            List<SevenDaysWeatherModel> sevenDaysWeatherModels =
                state.sevenDaysWeatherModels;
            return CustomGridViewBuilder(
                sevenDaysWeatherModels: sevenDaysWeatherModels);
          } else if (state is WeatherLoadingStateLocal) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherEmptyStateLocal) {
            return const Center(
                child: Text('no saved weather start to search'));
          } else {
            return Container(
              alignment: Alignment.center,
            );
          }
        },
      ),
    );
  }
}
