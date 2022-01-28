import 'package:elementary_weather_flutter/ui/error_screen/error_screen.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  testGoldens('Error screen golden test', (tester) async {
    await tester.pumpWidgetBuilder(const ErrorScreen());
    await multiScreenGolden(tester, 'error_screen');
  });
}
