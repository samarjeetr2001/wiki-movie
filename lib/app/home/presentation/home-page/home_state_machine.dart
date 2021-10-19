import 'package:assignment/app/home/domain/entity/movie_detail_entity.dart';
import 'package:assignment/core/presentation/state_machine.dart';

class HomeStateMachine extends StateMachine<HomeState, HomeEvent> {
  HomeStateMachine() : super(HomeInitState());

  @override
  HomeState getStateOnEvent(HomeEvent event) {
    final eventType = event.runtimeType;
    HomeState newState = getCurrentState();
    switch (eventType) {
      case HomeSearchMovieEvent:
        newState = HomeLoadingState();
        break;

      case HomeErrorEvent:
        HomeErrorEvent errorEvent = event as HomeErrorEvent;
        newState = HomeErrorState(errorEvent.errorMsg);
        break;

      case HomeInitializedEvent:
        HomeInitializedEvent initializedEvent = event as HomeInitializedEvent;
        newState = HomeInitializedState(
            movieDetailEntity: initializedEvent.movieDetailEntity);
        break;
    }
    return newState;
  }
}

class HomeState {}

class HomeInitState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeErrorState extends HomeState {
  final String errorMsg;

  HomeErrorState(this.errorMsg);
}

class HomeInitializedState extends HomeState {
  final MovieDetailEntity movieDetailEntity;

  HomeInitializedState({required this.movieDetailEntity});
}

class HomeEvent {}

class HomeSearchMovieEvent extends HomeEvent {}

class HomeErrorEvent extends HomeEvent {
  final String errorMsg;

  HomeErrorEvent(this.errorMsg);
}

class HomeInitializedEvent extends HomeEvent {
  final MovieDetailEntity movieDetailEntity;

  HomeInitializedEvent({required this.movieDetailEntity});
}
