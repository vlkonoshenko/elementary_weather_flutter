import 'package:json_annotation/json_annotation.dart';

enum WeatherState {
  @JsonValue('sn')
  snow,
  @JsonValue('sl')
  sleet,
  @JsonValue('h')
  hail,
  @JsonValue('t')
  thunderstorm,
  @JsonValue('hr')
  heavyRain,
  @JsonValue('lr')
  lightRain,
  @JsonValue('s')
  showers,
  @JsonValue('hc')
  heavyCloud,
  @JsonValue('lc')
  lightCloud,
  @JsonValue('c')
  clear,
  unknown,
}
