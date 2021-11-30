import 'package:elementary_weather_flutter/theme/app_typography.dart';
import 'package:flutter/material.dart';

import 'widgets/circle_progress_loader.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircleProgressLoader(),
        const SizedBox(height: 40),
        Text(
          'Please wait for loading…',
          style: AppTypography.body,
        ),
      ],
    );
  }
}
