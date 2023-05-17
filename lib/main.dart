import 'package:elementary_weather_flutter/app_model.dart';
import 'package:elementary_weather_flutter/weather_app.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void main() {
  getIt.registerSingleton<AppModel>(AppModel(), signalsReady: true);

  runApp(const WeatherApp());
}
