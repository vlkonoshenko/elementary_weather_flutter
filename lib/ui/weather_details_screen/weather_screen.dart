import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

import '../../service/model/weather.dart';
import '../../service/weather_service.dart';
import 'weather_screen_wm.dart';

class WeatherScreen extends ElementaryWidget<WeatherScreenWM> {
  const WeatherScreen({
    Key? key,
    WidgetModelFactory<WeatherScreenWM> wmFactory = createWeatherScreenWM,
  }) : super(wmFactory, key: key);

  @override
  Widget build(WeatherScreenWM wm) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ValueListenableBuilder<Weather?>(
            valueListenable: wm.currentWeather,
            builder: (_, data, __) {
              if (data == null) {
                return const CircularProgressIndicator();
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    '$baseUrl/static/img/weather/png/${data.weatherStateAbbr.abbr}.png',
                    height: 100,
                    width: 100,
                  ),
                  Text(wm.locationTitle),
                  Text(data.weatherStateName),
                  Text(data.theTemp.toString()),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
