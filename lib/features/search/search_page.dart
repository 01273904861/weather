import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/core/helper/spacing.dart';
import 'package:weather/core/routing/routes.dart';
import 'package:weather/core/theming/app_colors.dart';
import 'package:weather/core/theming/app_text_style.dart';
import 'package:weather/core/theming/font_weigh_helper.dart';
import 'package:weather/core/widgets/text_field.dart';
import 'package:weather/features/home/data/cubit/weather_cubit.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherCubit =
        BlocProvider.of<WeatherCubit>(context); // Reuse weatherCubit
    return Scaffold(
      backgroundColor: AppColors.mainLightBlue,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.mainLightBlue,
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
              hintText: 'Search for a city',
              controller: weatherCubit.searchController,
              hintTextStyle:
                  AppTextStyle.font13WhiteLight.copyWith(fontSize: 20),
              backgroundColor: AppColors.darkGrey,
              suffixIcon: const Icon(
                Icons.location_on,
                color: Colors.white,
              ),
            ),
            verticalSpace(20),
            ElevatedButton(
              onPressed: () {
                if (weatherCubit.searchController.text.isNotEmpty) {
                  weatherCubit.getSevenDaysWeather();
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil(Routes.homePage, (_) => false);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Please enter a city name to search.')));
                }
              },
              child: const Text('Search'),
            )
          ],
        ),
      ),
    );
  }
}
