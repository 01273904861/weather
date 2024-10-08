import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/helper/spacing.dart';
import 'package:weather/core/routing/routes.dart';
import 'package:weather/core/theming/app_assets.dart';
import 'package:weather/core/theming/app_colors.dart';
import 'package:weather/core/theming/app_text_style.dart';

import 'package:weather/features/home/ui/widgets/name_and_number.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainLightBlue,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(20),
            Text(
              'Cairo',
              style: AppTextStyle.font25WhiteBold,
            ),
            verticalSpace(20),
            Text(
              'May 28 ,2024',
              style: AppTextStyle.font15WhiteBold,
            ),
            verticalSpace(20),
            Image.asset(AppAssets.assetsIconsRainyAndSunny,
                height: 230.h, width: 230.w),
            verticalSpace(20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NameAndNumberOfweather(name: 'temp', number: '32'),
                NameAndNumberOfweather(name: 'wind', number: '10km/h'),
                NameAndNumberOfweather(name: 'wind', number: '75%'),
              ],
            ),
            verticalSpace(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            verticalSpace(200),
          ],
        ),
      ),
    );
  }
}
