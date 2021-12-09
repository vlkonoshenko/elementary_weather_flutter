import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';
import 'package:elementary_weather_flutter/service/model/weather.dart';
import 'package:flutter/widgets.dart';

import '../../app_model.dart';
import '../../main.dart';
import '../../service/weather_service.dart';
import 'weather_screen.dart';
import 'weather_screen_model.dart';

class WeatherScreenWM extends WidgetModel<WeatherScreen, WeatherScreenModel>
    implements IWeatherWm {
  final EntityStateNotifier<List<Weather>?> _currentWeather =
      EntityStateNotifier(null);

  @override
  ListenableState<EntityState<List<Weather>?>> get currentWeather =>
      _currentWeather;

  @override
  String get locationTitle => model.location?.title ?? '';

  @override
  double get topPadding => MediaQuery.of(context).padding.top + 16;

  WeatherScreenWM(WeatherScreenModel model) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _loadWeather();
  }

  void onRetryPressed() => _loadWeather();

  Future<void> _loadWeather() async {
    try {
      _currentWeather.loading();
      final weather = await model.getWeather();
      _currentWeather.content(weather);
    } on DioError catch (err) {
      _currentWeather.error(err);
    }
  }
}

WeatherScreenWM createWeatherScreenWM(BuildContext _) => WeatherScreenWM(
      WeatherScreenModel(
        WeatherService(),
        getIt<AppModel>().selectedLocation,
      ),
    );

abstract class IWeatherWm extends IWidgetModel {
  ListenableState<EntityState<List<Weather>?>> get currentWeather;

  double get topPadding;

  String get locationTitle;
}
