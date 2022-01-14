import 'package:elementary_weather_flutter/service/model/location.dart';
import 'package:elementary_weather_flutter/service/model/location_type.dart';
import 'package:elementary_weather_flutter/service/model/weather.dart';
import 'package:elementary_weather_flutter/service/model/weather_state.dart';
import 'package:elementary_weather_flutter/ui/weather_details_screen/weather_screen.dart';
import 'package:elementary_weather_flutter/ui/weather_details_screen/weather_screen_model.dart';
import 'package:elementary_weather_flutter/ui/weather_details_screen/weather_screen_wm.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';

class WeatherScreenModelMock extends Mock implements WeatherScreenModel {}

final weather = Weather(
  id: 0,
  weatherStateName: 'weatherStateName',
  weatherStateAbbr: WeatherState.hail,
  windDirectionCompass: WindDirectionCompass.east,
  created: DateTime.fromMicrosecondsSinceEpoch(1000),
  applicableDate: DateTime.fromMicrosecondsSinceEpoch(1000),
  minTemp: 1.0,
  maxTemp: 10.0,
  theTemp: 5.0,
  windSpeed: 1.0,
  windDirection: 1.0,
  airPressure: 1.0,
  humidity: 1,
  visibility: 1.0,
  predictability: 1,
);

void main() {
  group('Select Address Screen', () {
    final model = WeatherScreenModelMock();

    testGoldens('Example of testing a responsive layout', (tester) async {
      when(model.getWeather).thenAnswer((_) => Future.value([
            Weather(
              id: 0,
              weatherStateName: 'weatherStateName',
              weatherStateAbbr: WeatherState.hail,
              windDirectionCompass: WindDirectionCompass.east,
              created: DateTime.now(),
              applicableDate: DateTime.now(),
              minTemp: 1.0,
              maxTemp: 10.0,
              theTemp: 5.0,
              windSpeed: 1.0,
              windDirection: 1.0,
              airPressure: 1.0,
              humidity: 1,
              visibility: 1.0,
              predictability: 1,
            ),
          ]));
      when(() => model.location).thenAnswer((_) => Location(
            title: 'title',
            locationType: LocationType.city,
            latLng: LatLng(longitude: 10.0, latitude: 10.0),
            woeid: 1,
          ));

      await tester.pumpWidgetBuilder(WeatherScreen(
        wmFactory: (context) => WeatherScreenWM(
          model,
        ),
      ));
      await multiScreenGolden(tester, 'select_address_screen');
    });

    testGoldens('Example of testing a responsive layout', (tester) async {
      when(model.getWeather).thenAnswer((_) => Future.value([
            weather,
            weather,
            weather,
            weather,
            weather,
          ]));
      when(() => model.location).thenAnswer((_) => Location(
            title: 'title',
            locationType: LocationType.city,
            latLng: LatLng(longitude: 10.0, latitude: 10.0),
            woeid: 1,
          ));

      late WeatherScreenWM wm;
      await tester.pumpWidgetBuilder(WeatherScreen(
        wmFactory: (context) => wm = WeatherScreenWM(model),
      ));

      await multiScreenGolden(tester, 'select_address_screen_data');
    });
  });
}
