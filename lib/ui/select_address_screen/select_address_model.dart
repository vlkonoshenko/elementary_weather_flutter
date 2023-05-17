import 'package:elementary/elementary.dart';
import 'package:elementary_weather_flutter/app_model.dart';
import 'package:elementary_weather_flutter/service/address_service.dart';
import 'package:elementary_weather_flutter/service/model/location.dart';
import 'package:flutter/foundation.dart';

class SelectAddressModel extends ElementaryModel {
  final ValueNotifier<List<Location>> predictions = ValueNotifier([]);

  final AddressService _addressService;
  final AppModel _appModel;

  SelectAddressModel(this._addressService, this._appModel);

// ignore:use_setters_to_change_properties
  void onLocationSelected(Location location) {
    _appModel.selectedLocation = location;
  }

  Future<void> getCityPrediction(String _) async {
    final value = await _addressService.getCityPredictions();
    predictions.value = value;
  }
}
