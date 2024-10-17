import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/theming/app_text_style.dart';

import 'package:weather/features/home/data/cubit/weather_cubit.dart';
import 'package:weather/features/home/data/cubit/weather_states.dart';
import 'package:weather/features/home/ui/views/weather_view.dart';

class DefaultPage extends StatefulWidget {
  const DefaultPage({
    super.key,
  });

  @override
  State<DefaultPage> createState() => _DefaultPageState();
}

class _DefaultPageState extends State<DefaultPage> {
  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<WeatherCubit>().getSevenDaysWeather();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherStates>(
      builder: (context, state) {
        if (state is WeatherSucess) {
          return WeatherView(sevenDaysWeatherModel: state.sevenDaysWeather);
        } else {
          return Scaffold(
            body: Center(
              child: Text(
                'check your connection',
                style: AppTextStyle.font22WhiteRegular,
              ),
            ),
          );
        }
      },
    );
  }
}
