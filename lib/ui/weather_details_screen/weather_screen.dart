import 'package:elementary/elementary.dart';
import 'package:elementary_weather_flutter/theme/app_typography.dart';
import 'package:elementary_weather_flutter/ui/loading_screen/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../service/model/weather.dart';
import 'weather_screen_wm.dart';
import 'widgets/weather_forecast_tile.dart';

class WeatherScreen extends ElementaryWidget<WeatherScreenWM> {
  const WeatherScreen({
    Key? key,
    WidgetModelFactory<WeatherScreenWM> wmFactory = createWeatherScreenWM,
  }) : super(wmFactory, key: key);

  @override
  Widget build(WeatherScreenWM wm) {
    return Scaffold(
      body: Center(
        child: EntityStateNotifierBuilder<List<Weather>?>(
          listenableEntityState: wm.currentWeather,
          errorBuilder: (_, __, ___) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/image/error.svg',
                  width: 140,
                  height: 220,
                  fit: BoxFit.cover,
                ),
                Text(
                  'Ooops!',
                  style: AppTypography.header,
                ),
                const SizedBox(height: 24),
                Text(
                  "Sorry, we didn't find anything. Please\n try again later.",
                  style: AppTypography.body,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  height: 56,
                  width: 176,
                  child: TextButton(
                    onPressed: wm.onRetryPressed,
                    child: Text(
                      'Try again',
                      style: AppTypography.title,
                    ),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: const Color(0xff49A5C1),
                      onSurface: Colors.grey,
                      elevation: 10,
                      shadowColor: const Color(0xff49A5C1),
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(18)), // <-- Radius
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
          loadingBuilder: (_, __) {
            return const LoadingPage();
          },
          builder: (_, data) {
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
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/image/bg.png',
                      ),
                      colorFilter:
                          ColorFilter.mode(Colors.black12, BlendMode.color),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: wm.topPadding),
                      Row(
                        children: [
                          const SizedBox(width: 25),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                DateFormat('EEEE, DD, MMMM')
                                    .format(DateTime.now()),
                                style: AppTypography.body
                                    .copyWith(color: Colors.white),
                              ),
                              Text(
                                wm.locationTitle,
                                style: AppTypography.title
                                    .copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/weather/${data.first.weatherStateAbbr.abbr}.svg',
                              height: 80,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          '${data.first.theTemp.round().toString()}°',
                          style: const TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Text(
                        '${data.first.weatherStateName} • Humidity ${data.first.humidity}%',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text('This week', style: AppTypography.title),
                ),
                Expanded(
                  child: ListView.separated(
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return WeatherForecastTile(
                        position: index,
                        weather: data[index],
                      );
                    },
                    itemCount: data.length,
                    separatorBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Divider(thickness: 1),
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
