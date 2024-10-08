import 'package:flutter/material.dart';
import 'package:weather/core/theming/app_colors.dart';
import 'package:weather/core/theming/app_text_style.dart';
import 'package:weather/core/theming/font_weigh_helper.dart';
import 'package:weather/core/widgets/text_field.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainLightBlue,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.mainDarkBlue,
        title: Text(
          'Pick location',
          style: AppTextStyle.font25WhiteBold
              .copyWith(fontWeight: AppFontWeightHelper.regular),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            CustomTextField(
              hintText: 'search',
              hintTextStyle:
                  AppTextStyle.font13WhiteLight.copyWith(fontSize: 20),
              backgroundColor: AppColors.darkGrey,
              suffixIcon: Icon(
                Icons.location_on,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
