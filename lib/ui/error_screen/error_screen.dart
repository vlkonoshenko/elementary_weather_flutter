import 'package:elementary_weather_flutter/theme/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class ErrorScreen extends StatelessWidget {
  final VoidCallback onRetryPressed;

  const ErrorScreen({
    required this.onRetryPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/image/error.svg',
          width: 140,
          height: 220,
          fit: BoxFit.cover,
        ),
        Text(
          'Ooops!',
          style: AppTypography.header,
        ),
        const SizedBox(height: 24),
        Text(
          "Sorry, we didn't find anything. Please\n try again later.",
          style: AppTypography.body,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 56,
          width: 176,
          child: TextButton(
            onPressed: onRetryPressed,
            child: Text(
              'Try again',
              style: AppTypography.title,
            ),
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: const Color(0xff49A5C1),
              onSurface: Colors.grey,
              elevation: 10,
              shadowColor: const Color(0xff49A5C1),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(18)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
