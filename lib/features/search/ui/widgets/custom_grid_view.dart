import 'package:flutter/material.dart';
import 'package:weather/features/search/data/models/seven_day_model.dart';
import 'package:weather/features/search/ui/widgets/weather_item_widget.dart';



class CustomGridViewBuilder extends StatelessWidget {
  const CustomGridViewBuilder({
    super.key,
    required this.sevenDaysWeatherModels,
  });

  final List<SevenDaysWeatherModel> sevenDaysWeatherModels;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8),
        itemCount: sevenDaysWeatherModels.length,
        itemBuilder: (context, i) {
          return WeatherItemWidget(
            sevenDaysWeatherModel: sevenDaysWeatherModels[i],
          );
        });
  }
}
