import 'package:json_annotation/json_annotation.dart';

import 'weather_state.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  final int id;
  @JsonKey(name: 'weather_state_name')
  final String weatherStateName;
  @JsonKey(name: 'weather_state_abbr', unknownEnumValue: WeatherState.unknown)
  final WeatherState weatherStateAbbr;
  @JsonKey(
    name: 'wind_direction_compass',
    unknownEnumValue: WindDirectionCompass.unknown,
  )
  final WindDirectionCompass windDirectionCompass;
  final DateTime created;
  @JsonKey(name: 'applicable_date')
  final DateTime applicableDate;
  @JsonKey(name: 'min_temp')
  final double minTemp;
  @JsonKey(name: 'max_temp')
  final double maxTemp;
  @JsonKey(name: 'the_temp')
  final double theTemp;
  @JsonKey(name: 'wind_speed')
  final double windSpeed;
  @JsonKey(name: 'wind_direction')
  final double windDirection;
  @JsonKey(name: 'air_pressure')
  final double airPressure;
  final int humidity;
  final double visibility;
  final int predictability;

  const Weather({
    required this.id,
    required this.weatherStateName,
    required this.weatherStateAbbr,
    required this.windDirectionCompass,
    required this.created,
    required this.applicableDate,
    required this.minTemp,
    required this.maxTemp,
    required this.theTemp,
    required this.windSpeed,
    required this.windDirection,
    required this.airPressure,
    required this.humidity,
    required this.visibility,
    required this.predictability,
  });

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  @override
  String toString() {
    return 'Weather{id: $id, weatherStateName: $weatherStateName, weatherStateAbbr: $weatherStateAbbr, windDirectionCompass: $windDirectionCompass, created: $created, applicableDate: $applicableDate, minTemp: $minTemp, maxTemp: $maxTemp, theTemp: $theTemp, windSpeed: $windSpeed, windDirection: $windDirection, airPressure: $airPressure, humidity: $humidity, visibility: $visibility, predictability: $predictability}';
  }
}

extension WeatherStateX on WeatherState {
  String? get abbr => _$WeatherStateEnumMap[this];
}

enum WindDirectionCompass {
  @JsonValue('N')
  north,
  @JsonValue('NE')
  northEast,
  @JsonValue('E')
  east,
  @JsonValue('SE')
  southEast,
  @JsonValue('S')
  south,
  @JsonValue('SW')
  southWest,
  @JsonValue('W')
  west,
  @JsonValue('NW')
  northWest,
  unknown,
}
