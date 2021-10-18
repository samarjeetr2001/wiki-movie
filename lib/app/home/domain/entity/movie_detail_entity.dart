import 'movie_meta_entity.dart';

class MovieDetailEntity {
  final MovieMetaEntity metaData;
  final String genre;
  final List<Rating> ratings;
  final int releasedYear;
  final String country;
  final String language;
  final String plot;
  final List<String> director;
  final List<String> actors;
  final List<String> writers;

  MovieDetailEntity({
    required this.metaData,
    required this.genre,
    required this.ratings,
    required this.releasedYear,
    required this.country,
    required this.language,
    required this.plot,
    required this.director,
    required this.actors,
    required this.writers,
  });

  static MovieDetailEntity toEntity(Map data) {
    List<Rating> rating = [];
    for (int i = 0; i < data['Ratings'].length; i++) {
      rating.add(Rating(
          source: data['Ratings'][i]['Source'],
          value: data['Ratings'][i]['Value']));
    }
    return MovieDetailEntity(
      metaData: MovieMetaEntity.toEntity(data),
      genre: data['Genre'],
      ratings: rating,
      releasedYear: int.parse(data['Year']),
      country: data['Country'],
      language: data['Language'],
      plot: data['Plot'],
      director: data['Director'].toString().split(','),
      actors: data['Actors'].toString().split(','),
      writers: data['Writer'].toString().split(','),
    );
  }
}

class Rating {
  final String source;
  final String value;

  Rating({required this.source, required this.value});
}

//  {
//   "Title": "Avengers: Endgame",
//   "Year": "2019",
//   "Rated": "PG-13",
//   "Released": "26 Apr 2019",
//   "Runtime": "181 min",
//   "Genre": "Action, Adventure, Drama",
//   "Director": "Anthony Russo, Joe Russo",
//   "Writer": "Christopher Markus, Stephen McFeely, Stan Lee",
//   "Actors": "Robert Downey Jr., Chris Evans, Mark Ruffalo",
//   "Plot":
//       "After the devastating events of Avengers: Infinity War (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to reverse Thanos' actions and restore balance to the universe.",
//   "Language": "English, Japanese, Xhosa, German",
//   "Country": "United States",
//   "Awards": "Nominated for 1 Oscar. 70 wins & 122 nominations total",
//   "Poster":
//       "https://m.media-amazon.com/images/M/MV5BMTc5MDE2ODcwNV5BMl5BanBnXkFtZTgwMzI2NzQ2NzM@._V1_SX300.jpg",
//   "Ratings": [
//     {"Source": "Internet Movie Database", "Value": "8.4/10"},
//     {"Source": "Rotten Tomatoes", "Value": "94%"},
//     {"Source": "Metacritic", "Value": "78/100"}
//   ],
//   "Metascore": "78",
//   "imdbRating": "8.4",
//   "imdbVotes": "937,294",
//   "imdbID": "tt4154796",
//   "Type": "movie",
//   "DVD": "30 Jul 2019",
//   "BoxOffice": "\$858,373,000",
//   "Production": "N/A",
//   "Website": "N/A",
//   "Response": "True"
// }
