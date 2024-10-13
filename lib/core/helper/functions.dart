  import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/theming/app_assets.dart';

void scrollToCurrnetTime(int index , ScrollController _scrollController) {
    // Assuming each item has a height of 50.0
    double itemWidth = 130.w + 10; //10=> padding
    _scrollController.animateTo(
      itemWidth * index + 6, // Index starts from 0
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }


  String getWeatherIcon(String condition) {
  condition = condition.toLowerCase();

  if (condition.contains('clear')) {
    return AppAssets.assetsImagesClear;
  } else if (condition.contains('sunny')) {
    return AppAssets.assetsIconsSunny;
  } else if (condition.contains('cloudy')) {
    return AppAssets.assetsIconsCloudy;
  } else if (condition.contains('partly cloudy')) {
    return AppAssets.assetsImagesCloudy;
  } else if (condition.contains('overcast')) {
    return AppAssets.assetsImagesClear;
  } else if (condition.contains('thunderstorm')) {
    return AppAssets.assetsImagesThunderstorm;
  } else if (condition.contains('light rain')) {
    return AppAssets.assetsImagesRainy;
  } else if (condition.contains('heavy rain')) {
    return AppAssets.assetsIconsRainy3;
  } else if (condition.contains('moderate rain')) {
    return AppAssets.assetsIconsRainy2;
  } else if (condition.contains('snow')) {
    return AppAssets.assetsIconsSnowy;
  } else if (condition.contains('sleet')) {
    return AppAssets.assetsImagesThunderstorm;
  } else if (condition.contains('patchy rain')) {
    return AppAssets.assetsIconsRainyAndSunny;
  } else if (condition.contains('rain shower')) {
    return AppAssets.assetsIconsRainy3;
  } else if (condition.contains('hail')) {
    return AppAssets.assetsIconsStorm2;
  } else {
    // Default icon for unknown conditions
    return AppAssets.assetsImagesClear;
  }
}


String getDayOfWeek(String dateStr) {
  // Parse the string into a DateTime object
  DateTime parsedDate = DateFormat('yyyy-MM-dd').parse(dateStr);

  // Get the abbreviated day of the week (like 'Thu' for Thursday)
  return DateFormat('EEE')
      .format(parsedDate)
      .toString(); // 'EEE' gives day abbreviation
}

String getMonthDate(String dateStr) {
  DateTime parsedDate = DateFormat('yyyy-MM-dd').parse(dateStr);
  // Format the date as "Oct, 10"
  return DateFormat('MMM, dd').format(parsedDate).toString();
}
