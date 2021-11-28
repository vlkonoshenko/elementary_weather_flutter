import 'package:elementary_weather_flutter/ui/select_address_screen/select_address_screen.dart';
import 'package:flutter/material.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Gilroy',
        primarySwatch: Colors.blue,
      ),
      home: const SelectAddressScreen(),
    );
  }
}
