import 'dart:convert';

import 'package:assignment/app/home/domain/entity/movie_detail_entity.dart';
import 'package:assignment/app/home/domain/repository/movie_repository.dart';
import 'package:http/http.dart' as http;

class MovieRepositoryImpl extends MovieRepository {
  MovieDetailEntity? movieDetailEntity;
  Uri lastUri = Uri.parse('http://www.google.com');
  @override
  Future<MovieDetailEntity> getMovies({required String name}) async {
    String url = "http://www.omdbapi.com/?t=$name&apikey=daf9df16";
    Uri uri = Uri.parse(url);
    if (movieDetailEntity == null || lastUri != uri) {
      await fetchMovies(uri: uri);
      lastUri = uri;
    }
    return movieDetailEntity!;
  }

  Future<void> fetchMovies({required Uri uri}) async {
    http.Response result = await http.get(uri);
    var body = jsonDecode(result.body);

    if (body['Response'] == 'True') {
      movieDetailEntity = MovieDetailEntity.toEntity(body);
    } else {
      throw Exception(body['Error']);
    }
  }
}
