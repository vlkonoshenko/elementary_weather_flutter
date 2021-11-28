import 'package:elementary/elementary.dart';
import 'package:elementary_weather_flutter/ui/loading_page/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      body: Center(
        child: ValueListenableBuilder<List<Weather>?>(
          valueListenable: wm.currentWeather,
          builder: (_, data, __) {
            if (data == null) {
              return const LoadingPage();
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(24),
                    ),
                    gradient: LinearGradient(
                      stops: const [0.2, 1.2, 1],
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [
                        Colors.blue,
                        Colors.blue.shade100,
                        Colors.blueAccent,
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(wm.context).padding.top + 16,
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 25),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                DateFormat('EEEE, DD, MMMM')
                                    .format(DateTime.now()),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                wm.locationTitle,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Expanded(
                        child: Image.asset(
                          'assets/weather/${data.first.weatherStateAbbr.abbr}.png',
                          width: 140,
                          height: 100,
                          scale: 3,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Text(
                        '${data.first.theTemp.round().toString()}°',
                        style: const TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(data.first.weatherStateName),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    'This week',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    physics: ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          const SizedBox(width: 25),
                          Text(index == 0
                              ? 'Today'
                              : DateFormat('EEEE')
                                  .format(data[index].applicableDate),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),),
                          const Spacer(),
                          Image.asset(
                            'assets/weather/${data[index].weatherStateAbbr.abbr}.png',
                            height: 40,
                            width: 40,
                          ),
                          const SizedBox(width: 25),
                          Text(
                            '${data[index].maxTemp.round().toString()}°',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(width: 25),
                        ],
                      );
                    },
                    itemCount: data.length,
                    separatorBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Divider(thickness: 2,),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
