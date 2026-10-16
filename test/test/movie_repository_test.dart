import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movies.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';


import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movies.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

void main() {
  group('MovieRepository unit tests', () {
    test('getMovies returns two movies', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();

      expect(movies.length, 2);
    });

    test('getMovies contains valid Obsession and The Odyssey movies', () {
      final MovieRepository repository = MovieRepository();
      final List<Movie> movies = repository.getMovies();

      final Movie obsession = movies[0];
      expect(obsession.id, 'fim001');
      expect(obsession.title, 'Obsession (2026)');
      expect(obsession.ticketPrice, 7.50);
      expect(obsession.posterImagePath, isNotEmpty);

      final Movie odyssey = movies[1];
      expect(odyssey.id, 'fim002');
      expect(odyssey.title, 'The Odyssey (2026)');
      expect(odyssey.ticketPrice, 7.50);
      expect(odyssey.posterImagePath, isNotEmpty);
    });

    test('getMovieById returns matching movie when id exists', () {
      final MovieRepository repository = MovieRepository();
      final Movie? movie = repository.getMovieById('fim001');

      expect(movie, isNotNull);
      expect(movie?.title, 'Obsession (2026)');
      expect(movie?.ticketPrice, 7.50);
    });

    test('getMovieById returns null when id does not exist', () {
      final MovieRepository repository = MovieRepository();
      final Movie? movie = repository.getMovieById('non-existent');

      expect(movie, isNull);
    });
  });
}
