import 'package:dio/dio.dart';
import 'package:elementary_weather_flutter/service/model/location_type.dart';

import 'model/location.dart';

const baseUrl = 'https://www.metaweather.com';

class AddressService {
  final dio = Dio(BaseOptions(baseUrl: baseUrl));

  Future<List<Location>> getCityPredictions() async {
    return const [
      Location(
        title: 'Moscow',
        locationType: LocationType.city,
        latLng: LatLng(latitude: 1, longitude: 1),
        woeid: 1,
      ),
      Location(
        title: 'London',
        locationType: LocationType.city,
        latLng: LatLng(latitude: 1, longitude: 1),
        woeid: 1,
      ),
    ];
  }
}
