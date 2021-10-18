import 'dart:async';
import 'package:assignment/app/home/domain/entity/movie_detail_entity.dart';
import 'package:assignment/app/home/domain/repository/movie_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class GetMovieUsecase extends CompletableUseCase<String> {
  final MovieRepository _repository;
  GetMovieUsecase(this._repository);

  @override
  Future<Stream<MovieDetailEntity>> buildUseCaseStream(params) async {
    final StreamController<MovieDetailEntity> streamController =
        StreamController();
    try {
      MovieDetailEntity movieData =
          await _repository.getMovies(name: params as String);
      streamController.add(movieData);
      streamController.close();
    } catch (error) {
      streamController.addError(error);
    }
    return streamController.stream;
  }
}
