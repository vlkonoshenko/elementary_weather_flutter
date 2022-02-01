import 'package:elementary_test/elementary_test.dart';
import 'package:elementary_weather_flutter/app_model.dart';
import 'package:elementary_weather_flutter/service/context_helper.dart';
import 'package:elementary_weather_flutter/service/model/location.dart';
import 'package:elementary_weather_flutter/service/model/location_type.dart';
import 'package:elementary_weather_flutter/service/navigation_helper.dart';
import 'package:elementary_weather_flutter/ui/weather_details_screen/weather_screen.dart';
import 'package:elementary_weather_flutter/ui/weather_details_screen/weather_screen_model.dart';
import 'package:elementary_weather_flutter/ui/weather_details_screen/weather_screen_wm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('init', () {
    final getIt = GetIt.instance;

    setUp(() {
      getIt.registerSingleton<AppModel>(AppModel());
    });

    test('createWeatherScreenWM', () {
      expect(() => createWeatherScreenWM(BuildContextMock()), returnsNormally);
    });
  });

  group('WeatherScreenWM', () {
    final modelData = WeatherScreenModelMock();
    final contextHelperMock = ContextHelperMock();

    WeatherScreenWM setupWm() {
      when(modelData.getWeather).thenAnswer((invocation) => Future.value([]));

      return WeatherScreenWM(contextHelperMock, modelData);
    }

    testWidgetModel<WeatherScreenWM, WeatherScreen>(
      'wm init call getWeather',
      setupWm,
      (wm, tester, context) async {
        tester.init();

        verify(modelData.getWeather);
      },
    );

    testWidgetModel<WeatherScreenWM, WeatherScreen>(
      'topPadding getter return padding',
      setupWm,
      (wm, tester, context) async {
        tester.init();

        when(
          () => contextHelperMock.getMediaQuery(context),
        ).thenReturn(const MediaQueryData());

        expect(wm.topPadding, 16);
      },
    );

    testWidgetModel<WeatherScreenWM, WeatherScreen>(
      'onRetryPressed call getWeather',
      setupWm,
      (wm, tester, context) async {
        tester.init();
        wm.onRetryPressed();
        verify(modelData.getWeather);
      },
    );
  });
}

class WeatherScreenModelMock extends Mock implements WeatherScreenModel {}

class NavigationHelperMock extends Mock implements NavigationHelper {}

class BuildContextMock extends Mock implements BuildContext {}

class ContextHelperMock extends Mock implements ContextHelper {}

const location = Location(
  title: 'title',
  locationType: LocationType.city,
  latLng: LatLng(longitude: 10.0, latitude: 10.0),
  woeid: 1,
);
