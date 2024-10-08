
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/theming/app_text_style.dart';
import 'package:weather/features/search/data/models/day_weather.dart';

class DailyWeather extends StatelessWidget {
  const DailyWeather({
    super.key,
    required this.dayWeather,
  });
  final DayWeather dayWeather;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(16),
      ),
      width: 130.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            dayWeather.image,
            width: 50.w,
          ),
          Column(
            children: [
              Text(
                dayWeather.minTemp.toString(),
                style: AppTextStyle.font15WhiteRegular,
              ),
              Text(
                dayWeather.maxTemp.toString(),
                style: AppTextStyle.font18WhiteBold,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
