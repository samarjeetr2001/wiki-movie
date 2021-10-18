import 'package:assignment/app/home/domain/usecase/get_movie_usecase.dart';
import 'package:assignment/core/presentation/observer.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomePresenter extends Presenter {
  final GetMovieUsecase _getMovieUsecase;
  HomePresenter(this._getMovieUsecase);

  @override
  dispose() {
    _getMovieUsecase.dispose();
  }

  void getMovies({required UseCaseObserver observer, required String name}) {
    _getMovieUsecase.execute(observer, name);
  }
}
