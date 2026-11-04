import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movies.dart';
import 'package:southsea_cinema/models/basket_item.dart';
import 'package:southsea_cinema/repositories/basket_repository.dart';
import 'package:southsea_cinema/views/basket_screen.dart';

void main() {
  late BasketRepository basket;
  late Movie movie;

  setUp(() {
    basket = BasketRepository.instance;
    basket.clear();

    movie = Movie(
      id: '1',
      title: 'Test Movie',
      synopsis: 'A movie used for testing.',
      ageRating: '12A',
      runtime: '120',
      screeningTime: '19:00',
      ticketPrice: 10.00,
      posterImagePath: 'assets/images/test.jpg',
    );
  });

  tearDown(() {
    basket.clear();
  });

  testWidgets('Basket screen displays an item and its total',
      (WidgetTester tester) async {
    basket.addItem(BasketItem(movie: movie, quantity: 2));

    await tester.pumpWidget(
      const MaterialApp(
        home: BasketScreen(),
      ),
    );

    expect(find.text('Test Movie'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
    expect(find.text('£20.00'), findsOneWidget);
  });

  testWidgets('Basket screen displays an empty basket',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: BasketScreen(),
      ),
    );

    expect(find.text('Test Movie'), findsNothing);
  });

  testWidgets('Buy Tickets clears the basket',
      (WidgetTester tester) async {
    basket.addItem(BasketItem(movie: movie, quantity: 2));

    await tester.pumpWidget(
      const MaterialApp(
        home: BasketScreen(),
      ),
    );

    await tester.tap(find.text('BUY TICKETS'));
    await tester.pumpAndSettle();

    expect(basket.getItems(), isEmpty);
  });
}