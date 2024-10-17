import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/theming/app_colors.dart';
import 'package:weather/core/theming/app_text_style.dart';
import 'package:weather/features/search/data/models/day_weather_model.dart';

class ForecastDayWeather extends StatelessWidget {
  const ForecastDayWeather({
    super.key,
    required this.dayWeatherModel,
  });
  final DayWeatherModel dayWeatherModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.darkGrey, borderRadius: BorderRadius.circular(16)),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dayWeatherModel.dayOfWeek,
                style: AppTextStyle.font15WhiteBold,
              ),
              Text(
                dayWeatherModel.monthDate,
                style: AppTextStyle.font15WhiteRegular,
              ),
            ],
          ),
          Text(
            '${dayWeatherModel.avgTemp.toString()}°c',
            style: AppTextStyle.font22WhiteRegular.copyWith(fontSize: 30.sp),
          ),
          Image.asset(
            dayWeatherModel.image,
            width: 50.w,
          ),
        ],
      ),
    );
  }
}
