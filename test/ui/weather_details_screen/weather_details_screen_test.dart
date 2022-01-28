import 'package:elementary_weather_flutter/service/context_helper.dart';
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

void main() {
  group('WeatherDetailsScreen', () {
    final model = WeatherScreenModelMock();

    testGoldens('Example of testing a responsive layout', (tester) async {
      when(model.getWeather).thenAnswer((_) => Future.value([_weatherMock]));
      when(() => model.location).thenAnswer((_) => _locationMock);

      await tester.pumpWidgetBuilder(WeatherScreen(
        wmFactory: (context) => WeatherScreenWM(ContextHelper(), model),
      ));

      await multiScreenGolden(tester, 'weather_details_screen');
    });

    testGoldens('Weather details screen with data golden test', (tester) async {
      when(model.getWeather).thenAnswer((_) {
        return Future.value(_mockWeathers);
      });
      when(() => model.location).thenAnswer((_) => _locationMock);

      await tester.pumpWidgetBuilder(WeatherScreen(
        wmFactory: (context) => WeatherScreenWM(ContextHelper(), model),
      ));

      await multiScreenGolden(tester, 'weather_details_screen_data');
    });

    testGoldens(
      'Weather details screen with error golden test',
      (tester) async {
        late WeatherScreenWM wm;
        when(model.getWeather).thenThrow(Exception());
        await tester.pumpWidgetBuilder(WeatherScreen(
          wmFactory: (context) => wm = WeatherScreenWM(ContextHelper(), model),
        ));

        wm.onErrorHandle(Exception());
        await multiScreenGolden(tester, 'weather_details_screen_err');
      },
    );
  });
}

class WeatherScreenModelMock extends Mock implements WeatherScreenModel {}

final _weatherMock = Weather(
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

final _mockWeathers = [
  _weatherMock,
  _weatherMock,
  _weatherMock,
  _weatherMock,
  _weatherMock,
];

const _locationMock = Location(
  title: 'title',
  locationType: LocationType.city,
  latLng: LatLng(longitude: 10.0, latitude: 10.0),
  woeid: 1,
);
