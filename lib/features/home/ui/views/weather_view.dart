import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/helper/functions.dart';
import 'package:weather/core/helper/spacing.dart';
import 'package:weather/core/routing/routes.dart';
import 'package:weather/core/theming/app_colors.dart';
import 'package:weather/core/theming/app_text_style.dart';
import 'package:weather/features/home/ui/widgets/hourly_weather.dart';
import 'package:weather/features/home/ui/widgets/name_and_number.dart';
import 'package:weather/features/search/data/models/day_weather_model.dart';
import 'package:weather/features/search/data/models/hour_model.dart';
import 'package:weather/features/search/data/models/seven_day_model.dart';

class WeatherView extends StatefulWidget {
  const WeatherView(
      {super.key, required this.sevenDaysWeatherModel, this.index});
  final SevenDaysWeatherModel sevenDaysWeatherModel;
  final int? index;

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

final ScrollController _scrollController = ScrollController();

class _WeatherViewState extends State<WeatherView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final List<HourModel> hours =
          widget.sevenDaysWeatherModel.forecastDays[0].hourModels;

      for (int i = 0; i < hours.length; i++) {
        if (hours[i].time == DateFormat('h a').format(DateTime.now())) {
          scrollToCurrnetTime(i, _scrollController);
          break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int i = widget.index ?? 0;
    final DayWeatherModel todayWeather =
        widget.sevenDaysWeatherModel.forecastDays[i];

    return Scaffold(
      backgroundColor: AppColors.mainLightBlue,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              verticalSpace(25),
              Text(
                widget.sevenDaysWeatherModel.name,
                style: AppTextStyle.font25WhiteBold,
              ),
              verticalSpace(25),
              Text(
                ' ${todayWeather.dayOfWeek}, ${todayWeather.monthDate}',
                style: AppTextStyle.font15WhiteBold,
              ),
              verticalSpace(25),
              Image.asset(todayWeather.image, height: 230.h, width: 230.w),
              verticalSpace(25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NameAndNumberOfweather(
                      name: 'temp', number:'${ todayWeather.avgTemp.toString()}°C'),
                  NameAndNumberOfweather(
                      name: 'wind',
                      number: '${todayWeather.wind.toString()}km/h'),
                  NameAndNumberOfweather(
                      name: 'humidity',
                      number: '${todayWeather.humidity.toString()}%'),
                ],
              ),
              verticalSpace(25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Today',
                    style: AppTextStyle.font25WhiteBold.copyWith(fontSize: 23),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(Routes.forecastPage,
                          arguments: widget.sevenDaysWeatherModel);
                    },
                    child: Text(
                      'view full report',
                      style: AppTextStyle.font16BlueRegular,
                    ),
                  )
                ],
              ),
              verticalSpace(25),
              SizedBox(
                height: 100.h,
                child: ListView.builder(
                    controller: _scrollController,
                    itemCount: todayWeather.hourModels.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i) {
                      List<HourModel> hours = todayWeather.hourModels;

                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: HourlyWeatherWidget(
                          isActive: hours[i].time ==
                              DateFormat('h a').format(DateTime.now()),
                          hourModel: hours[i],
                        ),
                      );
                    }),
              ),
              verticalSpace(20),
            ],
          ),
        ),
      ),
    );
  }
}
