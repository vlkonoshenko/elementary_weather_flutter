import 'package:flutter/widgets.dart';

class CircleProgressLoader extends StatefulWidget {
  const CircleProgressLoader({Key? key}) : super(key: key);

  @override
  _CircleProgressLoaderState createState() => _CircleProgressLoaderState();
}

class _CircleProgressLoaderState extends State<CircleProgressLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: Center(
        child: Image.asset(
          'assets/image/progress_indicator.png',
          height: 48,
          width: 48,
        ),
      ),
    );
  }
}
