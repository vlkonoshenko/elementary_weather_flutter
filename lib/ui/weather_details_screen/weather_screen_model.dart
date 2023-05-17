import 'package:elementary/elementary.dart';
import 'package:elementary_weather_flutter/service/model/location.dart';
import 'package:elementary_weather_flutter/service/model/weather.dart';
import 'package:elementary_weather_flutter/service/weather_service.dart';

class WeatherScreenModel extends ElementaryModel {
  final WeatherService _weatherService;
  final Location? _location;

  Location? get location => _location;

  WeatherScreenModel(this._weatherService, this._location);

  Future<List<Weather>?> getWeather() async {
    return _weatherService.getWeather();
  }
}
