import 'package:assignment/app/home/domain/entity/movie_detail_entity.dart';
import 'package:flutter/material.dart';

class MovieDetailView extends StatefulWidget {
  final MovieDetailEntity movieDetailEntity;
  const MovieDetailView({Key? key, required this.movieDetailEntity})
      : super(key: key);

  @override
  _MovieDetailViewState createState() => _MovieDetailViewState();
}

class _MovieDetailViewState extends State<MovieDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text(widget.movieDetailEntity.metaData.title)],
      ),
    );
  }
}
