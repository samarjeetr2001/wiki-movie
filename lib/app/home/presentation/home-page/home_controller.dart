import 'package:assignment/app/home/domain/entity/movie_detail_entity.dart';
import 'package:assignment/core/presentation/observer.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../../injection_container.dart';
import '../../../navigation_service.dart';
import 'home_presenter.dart';
import 'home_state_machine.dart';

class HomeController extends Controller {
  final HomePresenter _presenter;
  final HomeStateMachine _stateMachine;
  final NavigationService _navigationService;
  HomeController()
      : _presenter = serviceLocator<HomePresenter>(),
        _stateMachine = HomeStateMachine(),
        _navigationService = serviceLocator<NavigationService>(),
        super();

  @override
  void initListeners() {}

  @override
  void onInitState() {
    super.onInitState();
  }

  @override
  void onDisposed() {
    _presenter.dispose();
    super.onDisposed();
  }

  HomeState getCurrentState() {
    return _stateMachine.getCurrentState();
  }

  void navigateToDetailPage({required MovieDetailEntity movie}) {
    _navigationService.navigateTo(NavigationService.detailRoute,
        arguments: movie);
  }

  void getMovies({required String name}) {
    _stateMachine.onEvent(HomeSearchMovieEvent());
    refreshUI();
    _presenter.getMovies(
      observer: UseCaseObserver(
        () {},
        (error) {
          _stateMachine.onEvent(HomeErrorEvent(error.toString()));
          refreshUI();
          print('Error in Get Movie $error');
        },
        onNextFunction: (MovieDetailEntity movie) {
          _stateMachine.onEvent(HomeInitializedEvent(movieDetailEntity: movie));
          refreshUI();
          print(movie);
        },
      ),
      name: name,
    );
  }
}
