import 'package:elementary/elementary.dart';
import 'package:elementary_weather_flutter/ui/error_screen/error_screen.dart';
import 'package:elementary_weather_flutter/ui/loading_screen/loading_page.dart';
import 'package:elementary_weather_flutter/ui/weather_details_screen/widgets/weather_details_page.dart';
import 'package:flutter/material.dart';

import '../../service/model/weather.dart';
import 'weather_screen_wm.dart';

class WeatherScreen extends ElementaryWidget<IWeatherWm> {
  const WeatherScreen({
    Key? key,
    WidgetModelFactory<WeatherScreenWM> wmFactory = createWeatherScreenWM,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IWeatherWm wm) => Scaffold(
        body: Center(
          child: EntityStateNotifierBuilder<List<Weather>?>(
            listenableEntityState: wm.currentWeather,
            errorBuilder: (_, __, ___) =>
                ErrorScreen(onRetryPressed: wm.onRetryPressed),
            loadingBuilder: (_, __) => const LoadingPage(),
            builder: (_, data) => WeatherDetailsPage(
              data: data ?? [],
              location: wm.locationTitle,
            ),
          ),
        ),
      );
}
