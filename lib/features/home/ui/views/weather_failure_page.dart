

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/networking/api_error_model.dart';
import 'package:weather/core/routing/routes.dart';
import 'package:weather/core/theming/app_colors.dart';
import 'package:weather/core/theming/app_text_style.dart';

class WeatherFailurePage extends StatelessWidget {
  const WeatherFailurePage({
    super.key, required this.errorModel,
  });
  final ErrorModel errorModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainLightBlue,
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
        title: Text(
          'click to search',
          style: AppTextStyle.font22WhiteRegular,
        ),
      ),
      body: Center(
          child: Text(
        textAlign: TextAlign.center,
        ' ${errorModel.code.toString()} \n ${errorModel.message}',
        style: AppTextStyle.font22WhiteRegular,
      )),
    );
  }
}