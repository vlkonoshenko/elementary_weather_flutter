import 'package:elementary_weather_flutter/service/model/location.dart';
import 'package:elementary_weather_flutter/service/model/location_type.dart';
import 'package:elementary_weather_flutter/ui/select_address_screen/widgets/location_tile.dart';
import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  testGoldens('Highlighted text should looks correct', (tester) async {
    final builder = GoldenBuilder.grid(
      columns: 2,
      widthToHeightRatio: 1,
    )
      ..addScenario(
        'Default',
        LocationTile(
          location: _locationMock,
          requestString: 'L',
          onClick: (_) {},
        ),
      )
      ..addScenario(
          'Selected',
          LocationTile(
            location: _locationMock,
            requestString: '',
            onClick: (_) {},
          ))
      ..addScenario(
          'Part Selected',
          LocationTile(
            location: _locationMock,
            requestString: 'title',
            onClick: (_) {},
          ))
      ..addScenario(
          'Full',
          LocationTile(
            location: _locationMock,
            requestString: 'long',
            onClick: (_) {},
          ));
    await tester.pumpWidgetBuilder(builder.build());
    await screenMatchesGolden(tester, 'highlighted_text_state');
  });
}

const _locationMock = Location(
  title: 'Long long title',
  locationType: LocationType.city,
  latLng: LatLng(longitude: 10.0, latitude: 10.0),
  woeid: 1,
);
