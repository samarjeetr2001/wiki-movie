import 'package:flutter/foundation.dart';

abstract class StateMachine<State, Event> {
  late State _state;

  StateMachine(State initialState) {
    _state = initialState;
  }

  @protected
  State getStateOnEvent(Event event);

  State onEvent(Event event) {
    _state = getStateOnEvent(event);
    return _state;
  }

  State getCurrentState() {
    return _state;
  }
}
