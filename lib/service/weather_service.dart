import 'dart:async';

import 'package:dio/dio.dart';

import 'model/weather.dart';
import 'model/weather_state.dart';

const baseUrl = 'https://www.metaweather.com';

class WeatherService {
  final dio = Dio(BaseOptions(baseUrl: baseUrl));

  Future<List<Weather>?> getWeather() async {
    return Future.delayed(const Duration(seconds: 2), () {
      return <Weather>[
        Weather(
          id: 1,
          weatherStateName: 'weatherStateName',
          weatherStateAbbr: WeatherState.clear,
          windDirectionCompass: WindDirectionCompass.northEast,
          created: DateTime.fromMicrosecondsSinceEpoch(0),
          applicableDate: DateTime.fromMicrosecondsSinceEpoch(0),
          minTemp: 1.0,
          maxTemp: 1.0,
          theTemp: 1.0,
          windSpeed: 1.1,
          windDirection: 1.0,
          airPressure: 1.0,
          humidity: 1,
          visibility: 1.0,
          predictability: 1,
        ),
        Weather(
          id: 1,
          weatherStateName: 'weatherStateName',
          weatherStateAbbr: WeatherState.clear,
          windDirectionCompass: WindDirectionCompass.northEast,
          created: DateTime.fromMicrosecondsSinceEpoch(0),
          applicableDate: DateTime.fromMicrosecondsSinceEpoch(0),
          minTemp: 1.0,
          maxTemp: 1.0,
          theTemp: 1.0,
          windSpeed: 1.1,
          windDirection: 1.0,
          airPressure: 1.0,
          humidity: 1,
          visibility: 1.0,
          predictability: 1,
        ),
      ];
    });
  }
}
