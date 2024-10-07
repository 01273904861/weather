
import 'package:flutter/material.dart';
import 'package:weather/features/search/search.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'weater application',
      theme: ThemeData(
  
      
      ),
      home: SearchPage()
    );
  }
}
