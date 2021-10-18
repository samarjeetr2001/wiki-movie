import 'package:assignment/app/home/data/movie_repository_impl.dart';
import 'package:assignment/app/home/domain/repository/movie_repository.dart';
import 'package:assignment/app/home/domain/usecase/get_movie_usecase.dart';
import 'package:assignment/app/home/presentation/home-page/home_presenter.dart';
import 'package:get_it/get_it.dart';

import 'app/navigation_service.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  //Navigation
  serviceLocator.registerLazySingleton(() => NavigationService());
  //Respository
  serviceLocator
      .registerLazySingleton<MovieRepository>(() => (MovieRepositoryImpl()));

  //Presenter
  serviceLocator.registerFactory(() => HomePresenter(serviceLocator()));

  //Usecase
  serviceLocator.registerFactory(() => GetMovieUsecase(serviceLocator()));
}

Future<void> reset() async {
  serviceLocator.resetLazySingleton<MovieRepository>();
}
