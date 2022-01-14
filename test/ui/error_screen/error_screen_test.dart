
import 'package:elementary_weather_flutter/ui/error_screen/error_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  group('Error Screen', () {
    testGoldens('Example of testing a responsive layout', (tester) async {
      await tester.pumpWidgetBuilder( ErrorScreen(onRetryPressed: (){},));
      await multiScreenGolden(tester, 'error_screen');
    });
  });
}
