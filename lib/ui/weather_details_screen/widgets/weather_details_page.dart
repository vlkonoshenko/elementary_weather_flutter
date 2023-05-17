import 'package:elementary_weather_flutter/service/model/weather.dart';
import 'package:elementary_weather_flutter/theme/app_typography.dart';
import 'package:elementary_weather_flutter/ui/weather_details_screen/widgets/weather_forecast_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class WeatherDetailsPage extends StatelessWidget {
  final String location;
  final List<Weather> data;

  const WeatherDetailsPage({
    required this.location,
    required this.data,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 300,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/image/bg.png',
              ),
              colorFilter: ColorFilter.mode(Colors.black12, BlendMode.color),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top),
              Row(
                children: [
                  const SizedBox(width: 25),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat('EEEE, DD, MMMM').format(DateTime.now()),
                        style: AppTypography.body.copyWith(color: Colors.white),
                      ),
                      Text(
                        location,
                        style:
                            AppTypography.title.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/weather/${data.first.weatherStateAbbr.abbr}.svg',
                      height: 80,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  '${data.first.theTemp.round()}°',
                  style: const TextStyle(
                    fontSize: 60,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Text(
                '${data.first.weatherStateName} • Humidity ${data.first.humidity}%',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Text('This week', style: AppTypography.title),
        ),
        Expanded(
          child: ListView.separated(
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              return WeatherForecastTile(
                position: index,
                weather: data[index],
              );
            },
            itemCount: data.length,
            separatorBuilder: (context, index) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Divider(thickness: 1),
              );
            },
          ),
        ),
      ],
    );
  }
}
