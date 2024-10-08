import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/theming/font_weigh_helper.dart';

abstract class AppTextStyle {
  //city name
  static TextStyle font25WhiteBold = TextStyle(
    fontSize: 25.sp,
    color: Colors.white,
    fontWeight: AppFontWeightHelper.bold,
  );
  static TextStyle font22WhiteRegular = TextStyle(
    fontSize: 22.sp,
    color: Colors.white,
    fontWeight: AppFontWeightHelper.regular,
  );
  //date
  static TextStyle font15WhiteBold = TextStyle(
    fontSize: 15.sp,
    color: Colors.white,
    fontWeight: AppFontWeightHelper.bold,
  );
//weather states
  static TextStyle font13WhiteLight = TextStyle(
    fontSize: 13.sp,
    color: Colors.white,
    fontWeight: AppFontWeightHelper.light,
  );
//weather number
  static TextStyle font17WhiteBold = TextStyle(
    fontSize: 15.sp,
    color: Colors.white,
    fontWeight: AppFontWeightHelper.bold,
  );
  //view full
  static TextStyle font16BlueRegular = TextStyle(
    fontSize: 16.sp,
    color: Colors.blue,
    fontWeight: AppFontWeightHelper.regular,
  );
  //temp in container
  static TextStyle font18WhiteBold = TextStyle(
    fontSize: 18.sp,
    color: Colors.white,
    fontWeight: AppFontWeightHelper.bold,
  );
  //min temp in container
  static TextStyle font15WhiteRegular = TextStyle(
    fontSize: 15.sp,
    color: Colors.white,
    fontWeight: AppFontWeightHelper.regular,
  );
  //temp
  static TextStyle font50WhiteRegular = TextStyle(
    fontSize: 50.sp,
    color: Colors.white,
    fontWeight: AppFontWeightHelper.regular,
  );
}
