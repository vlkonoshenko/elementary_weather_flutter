import 'package:elementary/elementary.dart';
import 'package:elementary_weather_flutter/app_model.dart';
import 'package:elementary_weather_flutter/service/address_service.dart';
import 'package:elementary_weather_flutter/service/model/location.dart';
import 'package:elementary_weather_flutter/service/model/location_type.dart';
import 'package:flutter/foundation.dart';

class SelectAddressModel extends ElementaryModel {
  final ValueNotifier<List<Location>> predictions = ValueNotifier([]);
  final ValueNotifier<List<Location>> predictions2 = ValueNotifier<List<Location>>([
  const Location(
  title: 'title',
  locationType: LocationType.city,
  latLng: LatLng(longitude: 10.0, latitude: 10.0),
  woeid: 1,
  ),
  ]);
  final AddressService _addressService;
  final AppModel _appModel;

  SelectAddressModel(this._addressService, this._appModel);

// ignore:use_setters_to_change_properties
  void onLocationSelected(Location location) {
    _appModel.selectedLocation = location;
  }

  void getCityPrediction(String text) {
    _addressService
        .getCityPredictions(text)
        .then((value) => predictions.value = value);
  }
}
