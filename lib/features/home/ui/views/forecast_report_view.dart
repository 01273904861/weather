import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/routing/routes.dart';
import 'package:weather/core/theming/app_colors.dart';
import 'package:weather/core/theming/app_text_style.dart';
import 'package:weather/features/home/ui/views/weather_view.dart';
import 'package:weather/features/home/ui/widgets/forecast_day_weather.dart';
import 'package:weather/features/search/data/models/day_weather_model.dart';

class ForecastReportPage extends StatelessWidget {
  const ForecastReportPage({
    super.key,
    required this.sevenDaysWeatherModel,
  });
  final SevenDaysWeatherModel sevenDaysWeatherModel;

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
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ListView.builder(
              itemCount: sevenDaysWeatherModel.forecastDays.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical:  8.0),
                  child: GestureDetector(
                    onTap:() {
                       Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_){
                        return WeatherView(sevenDaysWeatherModel: sevenDaysWeatherModel , index: i,);
                       }), (_)=>false);
                    },
                    child: ForecastDayWeather(
                      dayWeatherModel: sevenDaysWeatherModel.forecastDays[i],
                    ),
                  ),
                );
              },
            )));
  }
}
