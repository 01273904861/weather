import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/routing/routes.dart';
import 'package:weather/core/theming/app_colors.dart';
import 'package:weather/core/theming/app_text_style.dart';
import 'package:weather/features/home/ui/widgets/day_weather.dart';

class ForecastReportPage extends StatelessWidget {
  const ForecastReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainLightBlue,
        appBar: AppBar(
          centerTitle: true,
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
                )),
          ],
          title: Text(
            'forecast report',
            style: AppTextStyle.font22WhiteRegular,
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              ForecastDayWeather(),
            ],
          ),
        ));
  }
}
