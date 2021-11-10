import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../service/model/location.dart';
import '../service/model/weather.dart';
import '../service/weather_service.dart';
import 'weather_screen.dart';
import 'weather_screen_model.dart';

class WeatherScreenWM extends WidgetModel<WeatherScreen, WeatherScreenModel> {
  TextEditingController textController = TextEditingController();
  ValueNotifier<List<Location>?> locations = ValueNotifier(null);
  ValueNotifier<Location?> selectedLocation = ValueNotifier(null);
  ValueNotifier<Weather?> currentWeather = ValueNotifier(null);

  WeatherScreenWM(WeatherScreenModel model) : super(model);

  Future<void> onClickSearch(String value) async {
    if (textController.text.isNotEmpty) {
      locations.value = await model.getLocations(value);
    }
  }

  Future<void> onClickSelectLocation(int index) async {
    selectedLocation.value = locations.value?[index];
    currentWeather.value =
        await model.getWeather(selectedLocation.value!.woeid);
  }
}

WeatherScreenWM createWeatherScreenWM(BuildContext _) => WeatherScreenWM(
      WeatherScreenModel(WeatherService()),
    );
