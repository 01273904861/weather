import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/helper/spacing.dart';
import 'package:weather/core/routing/routes.dart';
import 'package:weather/core/theming/app_assets.dart';
import 'package:weather/core/theming/app_colors.dart';
import 'package:weather/core/theming/app_text_style.dart';
import 'package:weather/features/home/ui/widgets/daily_weather.dart';
import 'package:weather/features/home/ui/widgets/name_and_number.dart';
import 'package:weather/features/search/data/models/day_weather_model.dart';

class WeatherView extends StatefulWidget {
  WeatherView({super.key, required this.sevenDaysWeather});
  int onTapedIndex = 0;
  final SevenDaysWeatherModel sevenDaysWeather;

  @override
  State<WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<WeatherView> {
  @override
  Widget build(BuildContext context) {
    final DayWeatherModel todayWeather =
        widget.sevenDaysWeather.forecastDays[0];

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
                widget.sevenDaysWeather.name,
                style: AppTextStyle.font25WhiteBold,
              ),
              verticalSpace(25),
              Text(
                todayWeather.date,
                style: AppTextStyle.font15WhiteBold,
              ),
              verticalSpace(25),
              Image.asset(AppAssets.assetsIconsRainyAndSunny,
                  height: 230.h, width: 230.w),
              verticalSpace(25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NameAndNumberOfweather(
                      name: 'temp', number: todayWeather.avgTemp.toString()),
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
                      Navigator.of(context).pushNamed(Routes.forecastPage);
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
                    itemCount: widget.sevenDaysWeather.forecastDays.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, i) {
                      List<DayWeatherModel> sevenDays =
                          widget.sevenDaysWeather.forecastDays;

                      return GestureDetector(
                        onTap: () {
                          widget.onTapedIndex = i;
                          setState(() {});
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6.0),
                          child: DailyWeather(
                            isActive: i == widget.onTapedIndex,
                            dayWeather: sevenDays[i],
                          ),
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
    ;
  }
}
