import 'package:elementary/elementary.dart';

import '../service/model/location.dart';
import '../service/model/weather.dart';
import '../service/weather_service.dart';

class WeatherScreenModel extends ElementaryModel {
  final WeatherService weatherService;

  WeatherScreenModel(this.weatherService);

  Future<List<Location>> getLocations(String text) {
    return weatherService.locationSearch(text);
  }

  Future<Weather?> getWeather(int locationId) {
    return weatherService.getWeather(locationId);
  }
}
