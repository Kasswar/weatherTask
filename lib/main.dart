import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_task/core/constant/app_routes_path.dart';
import 'package:weather_task/features/weather/data/data_source/remote_get_weather_data_source.dart';
import 'package:weather_task/features/weather/data/models/weather_model.dart';
import 'app_routes.dart';
import 'core/constant/app_boxs_name.dart';

void main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.openBox<String>(AppBox.localBox);
  await Hive.openBox(AppBox.configBox);
  runApp(const MyApp());
  RemoteGetWeatherDataSource remoteGetWeatherDataSource =
      RemoteGetWeatherDataSource();
  WeatherModel weatherModel =
      await remoteGetWeatherDataSource.remoteGetWeather({
    "key": "eb0315b46a6f4e00af9152404242407",
    "q": "damascus",
    "days": "1",
    "aqi": "no",
    "alerts": "no"
  });
  print("=========================");
  print(weatherModel.location!.name);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Weather App',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: ThemeData(
          brightness: Brightness.light,
          scaffoldBackgroundColor: Colors.yellow,
          appBarTheme: AppBarTheme(
            color: Colors.yellow,
            titleTextStyle: TextStyle(color: Colors.white),
          ),
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Colors.grey[300],
          appBarTheme: AppBarTheme(
            color: Colors.grey[300],
            titleTextStyle: TextStyle(color: Colors.white),
          ),
        ),
        builder: BotToastInit(),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: AppRoutesPath.weather,
      ),
    );
  }
}
