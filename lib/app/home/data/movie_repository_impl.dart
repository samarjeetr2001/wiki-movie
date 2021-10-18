// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:assignment/app/home/domain/entity/movie_detail_entity.dart';
import 'package:assignment/app/home/domain/repository/movie_repository.dart';
import 'package:http/http.dart' as http;

class MovieRepositoryImpl extends MovieRepository {
  @override
  Future<List<MovieDetailEntity>> getMovies({required String name}) async {
    const String url =
        "http://www.omdbapi.com/?t=Avengers&y=2020&apikey=daf9df16";
    http.Response result = await http.get(Uri.parse(url));
    var body = jsonDecode(result.body);
    if (body['Response']) {
      print(body['Title']);
    } else {
      throw Exception("Movie not Found");
    }
    print(body);
    throw UnimplementedError();
  }
}
