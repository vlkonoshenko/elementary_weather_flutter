import 'package:elementary/elementary.dart';
import 'package:elementary_weather_flutter/ui/loading_page/loading_page.dart';
import 'package:flutter/material.dart';

import '../../service/model/weather.dart';
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
          child: ValueListenableBuilder<List<Weather>?>(
            valueListenable: wm.currentWeather,
            builder: (_, data, __) {
              if (data == null) {
                return const LoadingPage();
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.blue,
                        Colors.green,
                        Colors.red,
                      ],
                    )),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/weather/${data.first.weatherStateAbbr.abbr}.png',
                          height: 100,
                          width: 100,
                        ),
                        Text(wm.locationTitle),
                        Text(data.first.weatherStateName),
                      ],
                    ),
                  ),
                  Text('This week'),
                  Expanded(
                    child: ListView(
                      children:
                          data.map((e) => Text(e.maxTemp.toString())).toList(),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
