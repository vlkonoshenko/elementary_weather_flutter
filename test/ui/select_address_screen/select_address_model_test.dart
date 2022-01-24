import 'package:elementary_weather_flutter/app_model.dart';
import 'package:elementary_weather_flutter/service/address_service.dart';
import 'package:elementary_weather_flutter/service/model/location.dart';
import 'package:elementary_weather_flutter/service/model/location_type.dart';
import 'package:elementary_weather_flutter/ui/select_address_screen/select_address_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('AddressModelTest', () {
    test('onLocationSelected', () {
      final appModel = AppModel();
      SelectAddressModel(
        AddressServiceMock(),
        appModel,
      ).onLocationSelected(_locationMock);
      expect(appModel.selectedLocation, _locationMock);
    });

    test('getCityPrediction return empty list', () async {
      final addressServiceMock = AddressServiceMock();

      when(() => addressServiceMock.getCityPredictions(''))
          .thenAnswer((_) => Future.value([]));

      final model = SelectAddressModel(
        addressServiceMock,
        AppModel(),
      );
      expect(model.predictions.value, <Location>[]);
      await model.getCityPrediction('');

      expect(model.predictions.value, <Location>[]);
    });

    test('getCityPrediction return prediction list', () async {
      final addressServiceMock = AddressServiceMock();

      when(() => addressServiceMock.getCityPredictions(''))
          .thenAnswer((_) => Future.value([_locationMock]));

      final model = SelectAddressModel(addressServiceMock, AppModel());
      expect(model.predictions.value, <Location>[]);
      await model.getCityPrediction('');

      expect(model.predictions.value, <Location>[_locationMock]);
    });
  });
}

class AddressServiceMock extends Mock implements AddressService {}

const _locationMock = Location(
  title: 'title',
  locationType: LocationType.city,
  latLng: LatLng(longitude: 10.0, latitude: 10.0),
  woeid: 1,
);
