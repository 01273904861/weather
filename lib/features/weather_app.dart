import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather/core/routing/app_router.dart';
import 'package:weather/core/routing/routes.dart';
import 'package:weather/core/theming/app_colors.dart';
import 'package:weather/features/home/data/cubit/weather_cubit.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key, required this.appRouter});
  final AppRouter appRouter;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ScreenUtilInit(
        child: BlocProvider(
          create: (context) => WeatherCubit(),
          child: MaterialApp(
            title: 'weater application',
            color: AppColors.mainDarkBlue,
            theme: ThemeData(
              brightness: Brightness.light,
              /* light theme settings */
            ),

            /* ThemeMode.system to follow system theme, 
                       ThemeMode.light for light theme, 
                       ThemeMode.dark for dark theme
                    */
            debugShowCheckedModeBanner: false,
            onGenerateRoute: appRouter.onGenerateRoute,
            initialRoute: Routes.homePage,
          ),
        ),
      ),
    );
  }
}
