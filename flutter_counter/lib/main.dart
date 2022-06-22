import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/app.dart';
import 'package:flutter_counter/counter_observer.dart';

void main() {
  BlocOverrides.runZoned(() =>  runApp(const CounterApp()),
  blocObserver: CounterObserver());
}

