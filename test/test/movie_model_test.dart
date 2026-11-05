import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movies.dart';

void main() {
  group('Movie model tests', () {
    test('constructor assigns properties correctly', () {
      final movie = Movie(
        id: 'fim001',
        title: 'Obsession (2026)',
        synopsis:
            'A psychological thriller that delves into the depths of human desire and obsession',
        ageRating: '18',
        runtime: '1h 45m',
        screeningTime: '20:00',
        ticketPrice: 7.50,
        posterImagePath: 'assets/images/img1.jpg',
      );

      expect(movie.id, 'fim001');
      expect(movie.title, 'Obsession (2026)');
      expect(movie.synopsis,
          'A psychological thriller that delves into the depths of human desire and obsession');
      expect(movie.ageRating, '18');
      expect(movie.runtime, '1h 45m');
      expect(movie.ticketPrice, 7.50);
      expect(movie.posterImagePath, 'assets/images/img1.jpg');
    });

    group('Movie JSON', () {
  test('fromJson creates a Movie with all fields', () {
    final json = {
      'id': 'fim001',
      'title': 'Obsession (2026)',
      'synopsis': 'A psychological thriller',
      'ageRating': '18',
      'runtime': '1h 45m',
      'screeningTime': '20:00',
      'ticketPrice': 7.50,
      'posterImagePath': 'assets/images/img1.jpg',
    };

    final movie = Movie.fromJson(json);

    expect(movie.id, 'fim001');
    expect(movie.title, 'Obsession (2026)');
    expect(movie.synopsis, 'A psychological thriller');
    expect(movie.ageRating, '18');
    expect(movie.runtime, '1h 45m');
    expect(movie.screeningTime, '20:00');
    expect(movie.ticketPrice, 7.50);
    expect(movie.posterImagePath, 'assets/images/img1.jpg');
  });

  test('fromJson handles a whole-number ticket price', () {
    final json = {
      'id': 'fim002',
      'title': 'The Odyssey (2026)',
      'synopsis': 'An epic adventure',
      'ageRating': '15',
      'runtime': '2h 35m',
      'screeningTime': '18:30',
      'ticketPrice': 8,
      'posterImagePath': 'assets/images/img2.jpg',
    };

    final movie = Movie.fromJson(json);

    expect(movie.ticketPrice, 8.0);
  });

  test('toJson returns all Movie fields', () {
    const movie = Movie(
      id: 'fim001',
      title: 'Obsession (2026)',
      synopsis: 'A psychological thriller',
      ageRating: '18',
      runtime: '1h 45m',
      screeningTime: '20:00',
      ticketPrice: 7.50,
      posterImagePath: 'assets/images/img1.jpg',
    );

    expect(movie.toJson(), {
      'id': 'fim001',
      'title': 'Obsession (2026)',
      'synopsis': 'A psychological thriller',
      'ageRating': '18',
      'runtime': '1h 45m',
      'screeningTime': '20:00',
      'ticketPrice': 7.50,
      'posterImagePath': 'assets/images/img1.jpg',
    });
  });
});
});
}
