import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';

import '../service/model/location.dart';
import '../service/model/weather.dart';
import '../service/weather_service.dart';
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
        child: Column(
          children: [
            ValueListenableBuilder<Weather?>(
              valueListenable: wm.currentWeather,
              builder: (_, data, __) {
                return Column(
                  children: [
                    if (data != null)
                      Image.network(
                        '$baseUrl/static/img/weather/png/${data.weatherStateAbbr.abbr}.png',
                        height: 100,
                        width: 100,
                      ),
                    Text(data?.weatherStateName ?? 'Weather not found'),
                  ],
                );
              },
            ),
            ValueListenableBuilder<Location?>(
              valueListenable: wm.selectedLocation,
              builder: (_, data, __) {
                return Text(data?.title ?? 'Location not selected');
              },
            ),
            TextField(
              controller: wm.textController,
              onChanged: wm.onClickSearch,
            ),
            Expanded(
              child: ValueListenableBuilder<List<Location>?>(
                valueListenable: wm.locations,
                builder: (_, data, __) {
                  return data != null && data.isNotEmpty
                      ? ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(data[index].title),
                              subtitle:
                                  Text(data[index].locationType.toString()),
                              onTap: () => wm.onClickSelectLocation(index),
                            );
                          },
                        )
                      : const CircularProgressIndicator();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
