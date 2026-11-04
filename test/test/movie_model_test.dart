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
  });
}
