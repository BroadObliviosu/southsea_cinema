import 'package:southsea_cinema/models/movies.dart';
import 'dart:convert';
import 'package:flutter/services.dart';


class MovieRepository {

  List<Movie>? _cachedMovies;

  List<Movie> getMovies() {
    //get the list from the movies.dart.
    final List<Movie>? cachedMovies = _cachedMovies;
      if (cachedMovies != null) {
        return cachedMovies;
      }
    return [
      Movie(
        id: 'fim001',
        title: 'Obsession (2026)',
        synopsis:
            'A psychological thriller that delves into the depths of human desire and obsession',
        ageRating: '18',
        runtime: '1h 45m',
        screeningTime: '20:00',
        ticketPrice: 7.50,
        posterImagePath: 'assets/images/img1.jpg',
      ),
      Movie(
        id: 'fim002',
        title: 'The Odyssey (2026)',
        synopsis:
            'An epic adventure that follows a hero\'s journey through uncharted territories and mythical challenges',
        ageRating: '15',
        runtime: '2h 35m',
        screeningTime: '18:30',
        ticketPrice: 7.50,
        posterImagePath: 'assets/images/img2.jpg',
      ),
    ];
  }

  Movie? getMovieById(String id) {
    for (final movie in getMovies()) {
      if (movie.id == id) {
        return movie;
      }
    }
    return null;
  } //lets an app find its movie using the IP

Future<List<Movie>> loadMoviesFromAsset({
  String assetPath = 'assets/data/movies.json',
}) async {
  final String jsonString = await rootBundle.loadString(assetPath);
  final dynamic decodedData = jsonDecode(jsonString);
  final List<dynamic> jsonList = decodedData as List<dynamic>;
  final List<Movie> loadedMovies = [];

  for (final dynamic item in jsonList) {
    final Map<String, dynamic> itemMap = item as Map<String, dynamic>;
    final Movie movie = Movie.fromJson(itemMap);
    loadedMovies.add(movie);
  }

  _cachedMovies = loadedMovies;
  return loadedMovies;
}

}
