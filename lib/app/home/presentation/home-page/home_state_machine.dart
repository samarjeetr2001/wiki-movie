import 'package:assignment/core/presentation/state_machine.dart';

class HomeStateMachine extends StateMachine<HomeState, HomeEvent> {
  HomeStateMachine() : super(HomeInitState());

  @override
  HomeState getStateOnEvent(HomeEvent event) {
    final eventType = event.runtimeType;
    HomeState newState = getCurrentState();
    switch (eventType) {
    }
    return newState;
  }
}

class HomeState {}

class HomeInitState extends HomeState {}

class HomeEvent {}
