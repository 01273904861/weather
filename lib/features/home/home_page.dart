import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/routing/routes.dart';
import 'package:weather/core/theming/app_colors.dart';
import 'package:weather/core/theming/app_text_style.dart';

import 'package:weather/features/home/data/cubit/weather_cubit.dart';
import 'package:weather/features/home/data/cubit/weather_states.dart';
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
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is WeatherSucess) {
          return WeatherView(sevenDaysWeather: state.sevenDaysWeather);
        } else if (state is WeatherFailure) {
          return Scaffold(
            body: Center(
                child: Text(
              textAlign: TextAlign.center,
              ' ${state.errorModel.code.toString()} \n ${state.errorModel.message} . ',
              style:
                  AppTextStyle.font22WhiteRegular.copyWith(color: Colors.black),
            )),
          );
        } else if (state is WeatherLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.mainLightBlue,
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(Routes.searchPage);
                    },
                    icon: Icon(
                      Icons.search,
                      size: 25.sp,
                      color: Colors.white,
                    ))
              ],
              title: Text('error page'),
            ),
            body: Text('please search'),
          );
        }
      },
    );
  }
}
