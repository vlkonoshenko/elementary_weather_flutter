import 'package:elementary_weather_flutter/ui/loading_page/widgets/circle_progress_loader.dart';
import 'package:flutter/widgets.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        CircleProgressLoader(),
        SizedBox(height: 40),
        Text('Please wait for loading…'),
      ],
    );
  }
}
