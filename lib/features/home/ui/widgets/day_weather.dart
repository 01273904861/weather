import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/theming/app_assets.dart';
import 'package:weather/core/theming/app_colors.dart';
import 'package:weather/core/theming/app_text_style.dart';

class ForecastDayWeather extends StatelessWidget {
  const ForecastDayWeather({
    super.key,
  });

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
                'Friday',
                style: AppTextStyle.font15WhiteBold,
              ),
              Text(
                'may,28',
                style: AppTextStyle.font15WhiteRegular,
              ),
            ],
          ),
          Text('32', style: AppTextStyle.font50WhiteRegular),
          Image.asset(
            AppAssets.assetsImagesClear,
            width: 50.w,
          ),
        ],
      ),
    );
  }
}
