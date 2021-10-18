class MovieMetaEntity {
  final String imdbID;
  final String title;
  final double imdbRating;
  final String posterUrl;
  final MovieDuration duration;

  MovieMetaEntity({
    required this.imdbID,
    required this.title,
    required this.imdbRating,
    required this.posterUrl,
    required this.duration,
  });

  static MovieMetaEntity toEntity(Map data) {
    return MovieMetaEntity(
      imdbID: data['imdbID'],
      title: data['Title'],
      imdbRating: double.parse(data['imdbRating']),
      posterUrl: data['Poster'],
      duration: MovieDuration.toEntity(
        int.parse((data['Runtime']).toString().split(' ').first),
      ),
    );
  }
}

class MovieDuration {
  final int hours;
  final int minutes;

  MovieDuration({required this.hours, required this.minutes});

  static MovieDuration toEntity(int inMin) {
    int hours = 0;
    int minutes = 0;
    if (inMin > 59) {
      hours = inMin ~/ 60;
      minutes = inMin % 60;
    } else {
      minutes = inMin;
    }

    return MovieDuration(hours: hours, minutes: minutes);
  }
}
