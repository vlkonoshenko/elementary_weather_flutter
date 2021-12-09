import 'dart:convert';

import 'package:dio/dio.dart';

import 'model/location.dart';

const baseUrl = 'https://www.metaweather.com';

class AddressService {
  final dio = Dio(BaseOptions(baseUrl: baseUrl));

  // ignore:avoid_annotating_with_dynamic
  Future<List<Location>> getCityPredictions(String query) async {
    final locationResponse = await dio.get<String>(
      '/api/location/search/?query=$query',
    );

    final locationJson = jsonDecode(locationResponse.data ?? '') as List;

    final result = <Location>[];
    for (final location in locationJson) {
      result.add(Location.fromJson(location as Map<String, dynamic>));
    }

    return result;
  }
}
