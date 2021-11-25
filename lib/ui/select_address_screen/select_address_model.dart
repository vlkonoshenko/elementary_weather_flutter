import 'package:elementary/elementary.dart';
import 'package:elementary_weather_flutter/app_model.dart';
import 'package:elementary_weather_flutter/service/address_service.dart';
import 'package:elementary_weather_flutter/service/model/location.dart';
import 'package:flutter/foundation.dart';

class SelectAddressModel extends ElementaryModel {
  final AddressService addressService;
  final ValueNotifier<List<Location>> predictions = ValueNotifier([]);
  final AppModel _appModel;



  SelectAddressModel(this.addressService, this._appModel);

  void onTextChanged(String text) {
    addressService
        .locationSearch(text)
        .then((value) => predictions.value = value);
  }

  void saveLocation(Location location) {
    _appModel.selectedLocation = location;
  }

}
