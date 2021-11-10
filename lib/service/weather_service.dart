import 'dart:convert';

import 'package:dio/dio.dart';

import 'model/location.dart';
import 'model/weather.dart';

const _baseUrl = 'https://www.metaweather.com';

class WeatherService {
  final dio = Dio(BaseOptions(baseUrl: _baseUrl));

  // ignore:avoid_annotating_with_dynamic
  Future<List<Location>> locationSearch(String query) async {
    final locationResponse = await dio.get<String>(
      '/api/location/search',
      queryParameters: <String, String>{'query': query},
    );

    final locationJson = jsonDecode(locationResponse.data ?? '') as List;

    final result = <Location>[];
    for (final location in locationJson) {
      result.add(Location.fromJson(location as Map<String, dynamic>));
    }

    return result;
  }

  Future<Weather?> getWeather(int locationId) async {
    final weatherResponse = await dio.get<String>('/api/location/$locationId');

    final bodyJson =
        jsonDecode(weatherResponse.data ?? '') as Map<String, dynamic>;

    final weatherJson = bodyJson['consolidated_weather'] as List;

    return Weather.fromJson(weatherJson.first as Map<String, dynamic>);
  }
}
