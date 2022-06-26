import 'package:flutter/material.dart';
import 'package:flutter_timer/timer/widget/actions.dart';
import 'package:flutter_timer/timer/widget/background.dart';
import 'package:flutter_timer/timer/widget/timer_text.dart';
class TimerView extends StatelessWidget {
  const TimerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Timer"),),
      body: Stack(children: [
            const Background(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 100.0),
                  child: Center(child: TimerText()),
                ),
                ActionsWidget(),
              ],
            )
      ],
    ));
  }
}
