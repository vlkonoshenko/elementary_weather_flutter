import 'package:elementary/elementary.dart';
import 'package:elementary_weather_flutter/service/address_service.dart';
import 'package:elementary_weather_flutter/service/model/location.dart';
import 'package:elementary_weather_flutter/service/navigation_helper.dart';
import 'package:elementary_weather_flutter/ui/weather_details_screen/weather_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../app_model.dart';
import '../../main.dart';
import 'select_address_model.dart';
import 'select_address_screen.dart';

class SelectAddressWM
    extends WidgetModel<SelectAddressScreen, SelectAddressModel>
    implements ISelectAddressWm {
  final NavigationHelper _navigator;
  final TextEditingController _searchFieldController = TextEditingController();

  @override
  ValueListenable<List<Location>> get predictions => model.predictions;

  @override
  TextEditingController get searchFieldController => _searchFieldController;

  SelectAddressWM(SelectAddressModel model, this._navigator) : super(model);

  @override
  void initWidgetModel() {
    super.initWidgetModel();

    searchFieldController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _searchFieldController
      ..removeListener(_onTextChanged)
      ..dispose();

    super.dispose();
  }

  @override
  void onTapLocation(Location e) {
    model.onLocationSelected(e);
    _navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (_) => const WeatherScreen(),
      ),
    );
  }

  void _onTextChanged() {
    model.getCityPrediction(searchFieldController.text);
  }
}

abstract class ISelectAddressWm extends IWidgetModel {
  TextEditingController get searchFieldController;

  ValueListenable<List<Location>> get predictions;

  void onTapLocation(Location e);
}

SelectAddressWM createSelectAddressWM(BuildContext _) => SelectAddressWM(
      SelectAddressModel(
        AddressService(),
        getIt<AppModel>(),
      ),
      NavigationHelper(),
    );
