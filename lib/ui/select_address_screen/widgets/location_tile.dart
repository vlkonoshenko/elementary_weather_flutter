import 'package:elementary_weather_flutter/service/model/location.dart';
import 'package:elementary_weather_flutter/ui/select_address_screen/widgets/highlighted_text.dart';
import 'package:flutter/material.dart';

class LocationTile extends StatelessWidget {
  final Location location;
  final String requestString;
  final void Function(Location)? onClick;

  const LocationTile({
    Key? key,
    required this.location,
    required this.requestString,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 40),
        title: HighlightedText(
          text: location.title,
          matcher: requestString,
        ),
        onTap: () {
          if (onClick != null) {
            onClick!(location);
          }
        },
      );
}
