import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_counter_app/counter_service.dart';

// enum CounterEvent { increment, decrement }

abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {
  int counterValue;
  IncrementEvent({
    required this.counterValue,
  });
}

class DecrementEvent extends CounterEvent {
  int counterValue;
  DecrementEvent({
    required this.counterValue,
  });
}

abstract class CounterState {}

class IncrementedState extends CounterState {
  int counterValue;
  IncrementedState({
    required this.counterValue,
  });
}

class DecrementedState extends CounterState {
  int counterValue;
  DecrementedState({
    required this.counterValue,
  });
}

class LoadingState extends CounterState {}

class InitialState extends CounterState {}

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final CounterService counterService;
  CounterBloc(this.counterService) : super(InitialState());

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is IncrementEvent) {
      yield LoadingState();
      int incrementedValue =
          await counterService.getIncrementedNumber(event.counterValue);
      yield IncrementedState(counterValue: incrementedValue);
    }
    if (event is DecrementEvent) {
      yield LoadingState();
      int decreentedValue =
          await counterService.getDecrementedNumber(event.counterValue);
      yield DecrementedState(counterValue: decreentedValue);
    }
  }
}
