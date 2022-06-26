import 'package:flutter_bloc/flutter_bloc.dart';

class TimerObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    print("State condition: $change");
    super.onChange(bloc, change);
  }
}