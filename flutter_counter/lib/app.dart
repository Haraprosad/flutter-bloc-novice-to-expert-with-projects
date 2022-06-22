import 'package:flutter/material.dart';
import 'package:flutter_counter/counter/view/counter_page.dart';
class CounterApp extends StatelessWidget {
  const CounterApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CounterPage(),
    );
  }
}

