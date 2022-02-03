import 'package:elementary_weather_flutter/service/model/weather.dart';
import 'package:elementary_weather_flutter/service/model/weather_state.dart';
import 'package:elementary_weather_flutter/ui/weather_details_screen/widgets/weather_forecast_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  testGoldens('weather forecast goldens state', (tester) async {
    final builder = GoldenBuilder.grid(
      columns: 2,
      widthToHeightRatio: 1,
      wrap: (child) {
        return SizedBox(height: 50, child: child);
      },
    )
      ..addScenario(
        'Today',
        WeatherForecastTile(position: 0, weather: _mockWeather),
      )
      ..addScenario(
        'Hail',
        WeatherForecastTile(position: 1, weather: _mockWeather2),
      )
      ..addScenario(
        'Sleet',
        WeatherForecastTile(position: 2, weather: _mockWeather3),
      )
      ..addScenario(
        'Rain',
        WeatherForecastTile(position: 3, weather: _mockWeather4),
      );
    await tester.pumpWidgetBuilder(builder.build());
    await screenMatchesGolden(tester, 'weather_forecast_tile_state');
  });
}

final _mockWeather = Weather(
  id: 0,
  weatherStateName: 'Snow',
  weatherStateAbbr: WeatherState.showers,
  windDirectionCompass: WindDirectionCompass.east,
  created: DateTime.fromMicrosecondsSinceEpoch(1000),
  applicableDate: DateTime.fromMicrosecondsSinceEpoch(1000),
  minTemp: 1.0,
  maxTemp: -3.0,
  theTemp: 5.0,
  windSpeed: 1.0,
  windDirection: 1.0,
  airPressure: 1.0,
  humidity: 1,
  visibility: 1.0,
  predictability: 1,
);

final _mockWeather2 = Weather(
  id: 0,
  weatherStateName: 'Hail',
  weatherStateAbbr: WeatherState.hail,
  windDirectionCompass: WindDirectionCompass.east,
  created: DateTime(2020, 1, 4),
  applicableDate: DateTime(2020, 1, 4),
  minTemp: -10.0,
  maxTemp: 10.0,
  theTemp: 8.0,
  windSpeed: 1.0,
  windDirection: 1.0,
  airPressure: 1.0,
  humidity: 1,
  visibility: 1.0,
  predictability: 1,
);

final _mockWeather3 = Weather(
  id: 0,
  weatherStateName: 'Sleet',
  weatherStateAbbr: WeatherState.sleet,
  windDirectionCompass: WindDirectionCompass.east,
  created: DateTime(2020, 1, 3),
  applicableDate: DateTime(2020, 1, 3),
  minTemp: 0.0,
  maxTemp: 10.0,
  theTemp: 8.0,
  windSpeed: 1.0,
  windDirection: 1.0,
  airPressure: 1.0,
  humidity: 1,
  visibility: 1.0,
  predictability: 1,
);

final _mockWeather4 = Weather(
  id: 0,
  weatherStateName: 'Rain',
  weatherStateAbbr: WeatherState.heavyRain,
  windDirectionCompass: WindDirectionCompass.east,
  created: DateTime(2020, 1, 2),
  applicableDate: DateTime(2020, 1, 2),
  minTemp: 0.0,
  maxTemp: 5.0,
  theTemp: 8.0,
  windSpeed: 1.0,
  windDirection: 1.0,
  airPressure: 1.0,
  humidity: 1,
  visibility: 1.0,
  predictability: 1,
);
