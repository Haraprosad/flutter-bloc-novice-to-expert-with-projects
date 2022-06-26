import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_timer/app.dart';
import 'package:flutter_timer/timer_observer.dart';

void main() {
  BlocOverrides.runZoned(() => runApp(const MyApp()),
  blocObserver: TimerObserver());
}

