import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/basket_item.dart';
import 'package:southsea_cinema/models/movies.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';

const Movie testMovie1 = Movie(
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

const Movie testMovie2 = Movie(
  id: 'fim002',
  title: 'The Odyssey (2026)',
  synopsis:
      'An epic adventure that follows a hero\'s journey through uncharted territories and mythical challenges',
  ageRating: '15',
  runtime: '2h 35m',
  screeningTime: '18:30',
  ticketPrice: 7.50,
  posterImagePath: 'assets/images/img2.jpg',
);

void main() {
  setUp(() {
    BasketRepository.instance.clear();
  });

  group('BasketRespository tests', () {
    test('starts with an empty basket', () {
      final items = BasketRepository.instance.getItems();
      expect(items, isEmpty);
    });

    test('adds and item and calculates the total', () {
      final basket = BasketRepository.instance;

      final item1 = BasketItem(movie: testMovie1, quantity: 2);

      final item2 = BasketItem(movie: testMovie2, quantity: 1);

      basket.addItem(item1);
      basket.addItem(item2);

      expect(basket.getItems().length, 2);
      expect(basket.getTotal(), 22.50);
    });

    test('removes an item from the basket', () {
      final basket = BasketRepository.instance;

      final item1 = BasketItem(movie: testMovie1, quantity: 1);


      basket.addItem(item1);

      expect(basket.getItems().length, 1);

      basket.removeItem(0);

      expect(basket.getItems().length, 0);
      expect(basket.getTotal(), 0.00);
    });
  });
}
