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

class SelectAddressModelMock extends Mock implements SelectAddressModel {}

class NavigationHelperMock extends Mock implements NavigationHelper {}

class BuildContextMock extends Mock implements BuildContext {}

const location = Location(
  title: 'title',
  locationType: LocationType.city,
  latLng: LatLng(longitude: 10.0, latitude: 10.0),
  woeid: 1,
);

void main() {
  group('init', () {
    final getIt = GetIt.instance;

    setUp(() {
      getIt.registerSingleton<AppModel>(AppModel());
    });

    test(
      'createSelectAddressWM',
      () {
        final wm = createSelectAddressWM(BuildContextMock());
        expect(wm, isNotNull);
      },
    );
  });

  group('Confirm transfer screen wm testing', () {
    late SelectAddressModelMock modelData;
    late NavigationHelperMock navigatorStateMock;

    setUp(() {
      modelData = SelectAddressModelMock();
      navigatorStateMock = NavigationHelperMock();

      registerFallbackValue(MaterialPageRoute<void>(builder: (_) {
        return const Center();
      }));
    });

    SelectAddressWM setupWm() {
      return SelectAddressWM(modelData, navigatorStateMock);
    }

    testWidgetModel<SelectAddressWM, SelectAddressScreen>(
      'make transfer with server is not responding error',
      setupWm,
      (wm, tester, context) async {
        tester.init();
        wm.onTapLocation(location);

        verify(() => modelData.onLocationSelected(location));

        verify(() => navigatorStateMock.push(context, any()));
      },
    );
  });
}
