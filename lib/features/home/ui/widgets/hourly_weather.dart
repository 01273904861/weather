import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/theming/app_colors.dart';
import 'package:weather/core/theming/app_text_style.dart';
import 'package:weather/features/search/data/models/day_weather_model.dart';

class HourlyWeatherWidget extends StatefulWidget {
   HourlyWeatherWidget({
    super.key,
    this.isActive = false,
    required this.dayWeather,
  });
  final DayWeatherModel dayWeather;
  bool isActive = false;

  @override
  State<HourlyWeatherWidget> createState() => _HourlyWeatherWidgetState();
}

class _HourlyWeatherWidgetState extends State<HourlyWeatherWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: widget.isActive ? Colors.blue : AppColors.darkGrey,
        borderRadius: BorderRadius.circular(16),
      ),
      width: 130.w,
      height: 100.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            widget.dayWeather.image,
            width: 50.w,
          ),
          Column(
            children: [
              Text(
                widget.dayWeather.minTemp.toString(),
                style: AppTextStyle.font15WhiteRegular,
              ),
              Text(
                widget.dayWeather.maxTemp.toString(),
                style: AppTextStyle.font18WhiteBold,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
