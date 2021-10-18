import 'package:assignment/app/home/domain/entity/movie_detail_entity.dart';

abstract class MovieRepository {
  Future<MovieDetailEntity> getMovies({required String name});
}
