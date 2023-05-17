import 'package:elementary_weather_flutter/service/model/location.dart';
import 'package:elementary_weather_flutter/service/model/location_type.dart';
import 'package:elementary_weather_flutter/service/model/weather.dart';
import 'package:elementary_weather_flutter/service/model/weather_state.dart';
import 'package:elementary_weather_flutter/service/weather_service.dart';
import 'package:elementary_weather_flutter/ui/weather_details_screen/weather_screen_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  late WeatherScreenModel wm;
  final weatherServiceMock = WeatherServiceMock();

  setUp(() {
    wm = WeatherScreenModel(weatherServiceMock, _locationMock);
  });

  test('location getter return selected location', () {
    expect(wm.location, same(_locationMock));
  });

  test('method getWeather return weather from weather service', () async {
    when(() => weatherServiceMock.getWeather).thenAnswer(
      (invocation) => () => Future.value(_weatherMock),
    );

    expect(await wm.getWeather(), same(_weatherMock));
  });
}

class WeatherServiceMock extends Mock implements WeatherService {}

const _locationMock = Location(
  title: 'title',
  locationType: LocationType.city,
  latLng: LatLng(longitude: 10.0, latitude: 10.0),
  woeid: 1,
);

final _weatherMock = [
  Weather(
    id: 1,
    weatherStateName: 'weatherStateName',
    weatherStateAbbr: WeatherState.clear,
    windDirectionCompass: WindDirectionCompass.northEast,
    created: DateTime.fromMicrosecondsSinceEpoch(0),
    applicableDate: DateTime.fromMicrosecondsSinceEpoch(0),
    minTemp: 1.0,
    maxTemp: 1.0,
    theTemp: 1.0,
    windSpeed: 1.1,
    windDirection: 1.0,
    airPressure: 1.0,
    humidity: 1,
    visibility: 1.0,
    predictability: 1,
  ),
];
