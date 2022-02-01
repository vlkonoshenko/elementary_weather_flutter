import 'package:elementary_weather_flutter/service/model/location.dart';
import 'package:elementary_weather_flutter/service/model/location_type.dart';
import 'package:elementary_weather_flutter/ui/select_address_screen/select_address_screen.dart';
import 'package:elementary_weather_flutter/ui/select_address_screen/select_address_wm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  const selectAddressScreen = SelectAddressScreen();
  final selectAddressWm = SelectAddressWMMock();

  setUp(() {
    when(() => selectAddressWm.predictions)
        .thenAnswer((_) => ValueNotifier<List<Location>>([]));
    when(() => selectAddressWm.searchFieldController)
        .thenAnswer((_) => TextEditingController());
  });

  testGoldens('Select address screen default golden test', (tester) async {
    await tester.pumpWidgetBuilder(selectAddressScreen.build(selectAddressWm));

    await multiScreenGolden(tester, 'select_address_screen');
  });

  testGoldens('Select address screen with data golden test', (tester) async {
    when(() => selectAddressWm.predictions)
        .thenAnswer((_) => ValueNotifier<List<Location>>([_locationMock]));

    await tester.pumpWidgetBuilder(selectAddressScreen.build(selectAddressWm));

    await multiScreenGolden(tester, 'select_address_screen_data');
  });
}

class SelectAddressWMMock extends Mock implements ISelectAddressWm {}

const _locationMock = Location(
  title: 'title',
  locationType: LocationType.city,
  latLng: LatLng(longitude: 10.0, latitude: 10.0),
  woeid: 1,
);
