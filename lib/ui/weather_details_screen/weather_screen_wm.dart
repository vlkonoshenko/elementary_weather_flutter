import 'package:elementary/elementary.dart';
import 'package:elementary_weather_flutter/service/model/weather.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../../app_model.dart';
import '../../main.dart';
import '../../service/weather_service.dart';
import 'weather_screen.dart';
import 'weather_screen_model.dart';

class WeatherScreenWM extends WidgetModel<WeatherScreen, WeatherScreenModel> {
  ValueListenable<Weather?> get currentWeather => model.weather;

  String get locationTitle => model.location?.title ?? '';

  WeatherScreenWM(WeatherScreenModel model) : super(model);
}

WeatherScreenWM createWeatherScreenWM(BuildContext _) => WeatherScreenWM(
      WeatherScreenModel(
        WeatherService(),
        getIt<AppModel>(),
      ),
    );
