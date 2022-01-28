import 'package:elementary_weather_flutter/service/model/location.dart';
import 'package:elementary_weather_flutter/service/model/location_type.dart';
import 'package:elementary_weather_flutter/service/navigation_helper.dart';
import 'package:elementary_weather_flutter/ui/select_address_screen/select_address_model.dart';
import 'package:elementary_weather_flutter/ui/select_address_screen/select_address_screen.dart';
import 'package:elementary_weather_flutter/ui/select_address_screen/select_address_wm.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';

class SelectAddressModelMock extends Mock implements SelectAddressModel {}

void main() {
  group('Select Address Screen', () {
    final model = SelectAddressModelMock();

    testGoldens('Select address screen default golden test', (tester) async {
      when(() => model.predictions)
          .thenAnswer((_) => ValueNotifier<List<Location>>([]));

      await tester.pumpWidgetBuilder(SelectAddressScreen(
        wmFactory: (context) => SelectAddressWM(model, NavigationHelper()),
      ));

      await multiScreenGolden(tester, 'select_address_screen');
    });

    testGoldens('Select address screen with data golden test', (tester) async {
      when(() => model.predictions)
          .thenAnswer((_) => ValueNotifier<List<Location>>([_locationMock]));

      await tester.pumpWidgetBuilder(SelectAddressScreen(
        wmFactory: (context) => SelectAddressWM(model, NavigationHelper()),
      ));

      await multiScreenGolden(tester, 'select_address_screen_data');
    });
  });
}

const _locationMock = Location(
  title: 'title',
  locationType: LocationType.city,
  latLng: LatLng(longitude: 10.0, latitude: 10.0),
  woeid: 1,
);
