import 'package:equatable/equatable.dart';
// part of 'timer_bloc.dart';
abstract class TimerState extends Equatable{
  final int duration;
  const TimerState(this.duration);
  @override
  List<Object?> get props => [duration];
}

class TimerInitial extends TimerState{
  const TimerInitial(int duration) : super(duration);
   @override
  String toString()=>'Timer Initial {duration: $duration}';
}

class TimerRunPause extends TimerState{
  const TimerRunPause(int duration) : super(duration);
  @override
  String toString()=>'Timer Run pause {duration: $duration}';
}

class TimerRunInProgress extends TimerState{
  const TimerRunInProgress(int duration) : super(duration);
  @override
  String toString()=>'Timer Run in Progress {duration: $duration}';
}

class TimerRunComplete extends TimerState{
  const TimerRunComplete() : super(0);
}