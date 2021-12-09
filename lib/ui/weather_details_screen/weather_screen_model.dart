import 'package:elementary/elementary.dart';
import 'package:elementary_weather_flutter/service/model/location.dart';
import 'package:elementary_weather_flutter/service/model/weather.dart';
import 'package:elementary_weather_flutter/service/weather_service.dart';

class WeatherScreenModel extends ElementaryModel {
  final WeatherService weatherService;
  final Location? _location;

  Location? get location => _location;

  WeatherScreenModel(this.weatherService, this._location);

  Future<List<Weather>?> getWeather() async {
    return weatherService.getWeather(location?.woeid ?? 0);
  }
}
