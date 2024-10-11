
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/routing/routes.dart';
import 'package:weather/core/theming/app_colors.dart';
import 'package:weather/core/theming/app_text_style.dart';

class DefaultPage extends StatelessWidget {
  const DefaultPage({
    super.key,
  });

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
          ' there is an error click to search',
          style: AppTextStyle.font22WhiteRegular,
        ),
      ),
    );
  }
}
