import 'package:elementary_weather_flutter/app_model.dart';
import 'package:elementary_weather_flutter/service/address_service.dart';
import 'package:elementary_weather_flutter/service/model/location.dart';
import 'package:elementary_weather_flutter/service/model/location_type.dart';
import 'package:elementary_weather_flutter/ui/select_address_screen/select_address_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  final addressServiceMock = AddressServiceMock();
  late SelectAddressModel model;

  setUp(() {
    model = SelectAddressModel(addressServiceMock, AppModel());
  });

  test('init with empty list', () async {
    when(() => addressServiceMock.getCityPredictions('')).thenAnswer(
      (_) => Future.value([]),
    );
    expect(model.predictions.value, isEmpty);
  });

  test('getCityPrediction return empty list', () async {
    when(() => addressServiceMock.getCityPredictions('Test')).thenAnswer(
      (_) => Future.value(_locationMock),
    );
    await model.getCityPrediction('');
    expect(model.predictions.value, isEmpty);
  });

  test('getCityPrediction return prediction list', () async {
    await model.getCityPrediction('Test');
    expect(model.predictions.value, same(_locationMock));
  });
}

class AddressServiceMock extends Mock implements AddressService {}

const _locationMock = [
  Location(
    title: 'title',
    locationType: LocationType.city,
    latLng: LatLng(longitude: 10.0, latitude: 10.0),
    woeid: 1,
  ),
];
