import 'package:elementary/elementary.dart';
import 'package:elementary_weather_flutter/app_model.dart';
import 'package:elementary_weather_flutter/service/model/location.dart';
import 'package:elementary_weather_flutter/service/model/weather.dart';
import 'package:elementary_weather_flutter/service/weather_service.dart';
import 'package:flutter/foundation.dart';

class WeatherScreenModel extends ElementaryModel {
  final WeatherService weatherService;
  final AppModel appModel;

  final ValueNotifier<List<Weather>?> _currentWeather = ValueNotifier(null);

  Location? get location => appModel.selectedLocation;

  ValueListenable<List<Weather>?> get weather => _currentWeather;

  WeatherScreenModel(this.weatherService, this.appModel);

  @override
  void init() {
    super.init();

    getWeather().then((value) => _currentWeather.value = value);
  }



  Future<List<Weather>?> getWeather() {
    return weatherService.getWeather(location?.woeid ?? 0);
  }
}
