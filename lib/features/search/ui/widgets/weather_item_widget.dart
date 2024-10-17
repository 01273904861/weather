import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/helper/spacing.dart';

import 'package:weather/core/theming/app_text_style.dart';
import 'package:weather/core/theming/font_weigh_helper.dart';
import 'package:weather/features/home/ui/views/weather_view.dart';
import 'package:weather/features/search/data/models/day_weather_model.dart';
import 'package:weather/features/search/data/models/seven_day_model.dart';

class WeatherItemWidget extends StatelessWidget {
  const WeatherItemWidget({
    super.key,
    required this.sevenDaysWeatherModel,
  });
  final SevenDaysWeatherModel sevenDaysWeatherModel;
  @override
  Widget build(BuildContext context) {
    //i wil display only first day weather
    final DayWeatherModel dayWeatherModel =
        sevenDaysWeatherModel.forecastDays[0];

    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) {
            return WeatherView(sevenDaysWeatherModel: sevenDaysWeatherModel);
          },
        ),
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 60.w,
                  child: TempetatureAndConditionSearch(
                      dayWeatherModel: dayWeatherModel),
                ),
                horizontalSpace(25),
                Image.asset(
                  dayWeatherModel.image,
                  width: 45.w,
                ),
              ],
            ),
            verticalSpace(20),
            Text(
              sevenDaysWeatherModel.name,
              style: AppTextStyle.font18WhiteBold
                  .copyWith(fontWeight: AppFontWeightHelper.regular),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class TempetatureAndConditionSearch extends StatelessWidget {
  const TempetatureAndConditionSearch({
    super.key,
    required this.dayWeatherModel,
  });

  final DayWeatherModel dayWeatherModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${dayWeatherModel.avgTemp.toString()}°c',
          style: AppTextStyle.font22WhiteRegular.copyWith(
            fontSize: 20.sp,
          ),
        ),
        verticalSpace(5),
        Text(
          dayWeatherModel.condition,
          style: AppTextStyle.font15WhiteRegular
              .copyWith(fontWeight: AppFontWeightHelper.light),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
