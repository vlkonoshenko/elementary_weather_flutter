import 'package:elementary_test/elementary_test.dart';
import 'package:elementary_weather_flutter/app_model.dart';
import 'package:elementary_weather_flutter/service/model/location.dart';
import 'package:elementary_weather_flutter/service/model/location_type.dart';
import 'package:elementary_weather_flutter/service/navigation_helper.dart';
import 'package:elementary_weather_flutter/ui/select_address_screen/select_address_model.dart';
import 'package:elementary_weather_flutter/ui/select_address_screen/select_address_screen.dart';
import 'package:elementary_weather_flutter/ui/select_address_screen/select_address_wm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('init select address screen wm', () {
    final getIt = GetIt.instance;

    setUp(() {
      getIt.registerSingleton<AppModel>(AppModel());
    });

    test('createSelectAddressWM', () {
      expect(() => createSelectAddressWM(BuildContextMock()), returnsNormally);
    });
  });

  group('select address screen wm testing', () {
    late SelectAddressModelMock modelData;
    late NavigationHelperMock navigatorStateMock;

    SelectAddressWM setupWm() {
      modelData = SelectAddressModelMock();
      navigatorStateMock = NavigationHelperMock();

      when(() => modelData.getCityPrediction(any()))
          .thenAnswer((invocation) => Future.value());

      registerFallbackValue(MaterialPageRoute<void>(builder: (_) {
        return const Center();
      }));

      return SelectAddressWM(modelData, navigatorStateMock);
    }

    testWidgetModel<SelectAddressWM, SelectAddressScreen>(
      'onTapLocation call onLocationSelected and navigate to next screen',
      setupWm,
      (wm, tester, context) async {
        tester.init();
        wm.onTapLocation(_locationMock);

        verify(() => modelData.onLocationSelected(_locationMock));
        verify(() => navigatorStateMock.push(context, any()));
      },
    );

    testWidgetModel<SelectAddressWM, SelectAddressScreen>(
      'onTextChanged call getCityPrediction',
      setupWm,
      (wm, tester, context) async {
        tester.init();

        wm.searchFieldController.text = 'Test';
        verify(() => modelData.getCityPrediction(any()));
      },
    );
  });
}

class SelectAddressModelMock extends Mock implements SelectAddressModel {}

class NavigationHelperMock extends Mock implements NavigationHelper {}

class BuildContextMock extends Mock implements BuildContext {}

const _locationMock = Location(
  title: 'title',
  locationType: LocationType.city,
  latLng: LatLng(longitude: 10.0, latitude: 10.0),
  woeid: 1,
);
