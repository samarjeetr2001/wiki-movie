import 'package:get_it/get_it.dart';

import 'app/navigation_service.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  //Navigation
  serviceLocator.registerLazySingleton(() => NavigationService());
  //Respository
  // serviceLocator.registerLazySingleton<AuthenticationRepository>(
  //     () => (AuthenticationRepositoryImpl()));

  //Presenter
  // serviceLocator.registerFactory(() => SignInPresenter(
  //       serviceLocator(),
  //       serviceLocator(),
  //     ));

  //Usecase
  // serviceLocator
  //     .registerFactory(() => CheckRegistrationStatusUsecase(serviceLocator()));
}

Future<void> reset() async {
  // serviceLocator.resetLazySingleton<AuthenticationRepository>();
}
