import 'package:flutter/material.dart';
import 'package:rehabox/src/widgets/timer/timer_widget.dart';

class HomeScreen extends StatelessWidget {

  static const routeName = '/home';

  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CountdownClock(
          duration: Duration(seconds: 30),
          elapsed: Duration(seconds: 10),
        ),
      ),
    );
  }
}
