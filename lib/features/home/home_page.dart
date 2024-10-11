import 'package:flutter/material.dart';
import 'package:weather/features/home/data/cubit/weather_cubit.dart';
import 'package:weather/features/home/data/cubit/weather_states.dart';
import 'package:weather/features/home/ui/views/default_page.dart';
import 'package:weather/features/home/ui/views/weather_failure_page.dart';
import 'package:weather/features/home/ui/views/weather_view.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int onTapedIndex = 0;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<WeatherCubit>(context).getSevenDaysWeather();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is WeatherSucess) {
          return WeatherView(sevenDaysWeatherModel: state.sevenDaysWeather);
        } else if (state is WeatherFailure) {
          return WeatherFailurePage(
            errorModel: state.errorModel,
          );
        } else if (state is WeatherLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return const DefaultPage();
        }
      },
    );
  }
}
