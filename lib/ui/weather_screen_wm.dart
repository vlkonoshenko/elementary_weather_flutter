import 'package:elementary/elementary.dart';
import 'package:flutter/widgets.dart';

import 'weather_screen.dart';
import 'weather_screen_model.dart';

class WeatherScreenWM extends WidgetModel<WeatherScreen, WeatherScreenModel> {
  WeatherScreenWM(WeatherScreenModel model) : super(model);
}

WeatherScreenWM createWeatherScreenWM(BuildContext _) => WeatherScreenWM(
      WeatherScreenModel(),
    );
