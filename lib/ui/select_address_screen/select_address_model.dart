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

  void onLocationSelected(Location location) {
    _appModel.selectedLocation = location;
  }

  void onSearchTextChanged(String text) {
    _addressService
        .locationSearch(text)
        .then((value) => predictions.value = value);
  }
}
