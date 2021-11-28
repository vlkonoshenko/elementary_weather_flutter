import 'dart:convert';

import 'package:dio/dio.dart';

import 'model/weather.dart';

const baseUrl = 'https://www.metaweather.com';

class WeatherService {
  final dio = Dio(BaseOptions(baseUrl: baseUrl));

  Future<List<Weather>?> getWeather(int locationId) async {
    final weatherResponse = await dio.get<String>('/api/location/$locationId');

    final bodyJson =
        jsonDecode(weatherResponse.data ?? '') as Map<String, dynamic>;

    final weatherJson = bodyJson['consolidated_weather'] as List;

    return weatherJson
        .map((dynamic e) => Weather.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
