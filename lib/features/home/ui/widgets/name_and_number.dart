
import 'package:flutter/material.dart';
import 'package:weather/core/theming/app_text_style.dart';

class NameAndNumberOfweather extends StatelessWidget {
  const NameAndNumberOfweather({
    super.key,
    required this.name,
    required this.number,
  });
  final String name;
  final String number;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style: AppTextStyle.font13WhiteLight,
        ),
        Text(
          number,
          style: AppTextStyle.font17WhiteBold,
        ),
      ],
    );
  }
}
