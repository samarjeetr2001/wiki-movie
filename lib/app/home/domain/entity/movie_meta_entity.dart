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
}

class MovieDuration {
  final int hours;
  final int minutes;

  MovieDuration({required this.hours, required this.minutes});
}
