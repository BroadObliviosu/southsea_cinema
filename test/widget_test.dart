import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';

// void main() {
//   testWidgets('Basic app loading test', (WidgetTester tester) async {
//     await tester.pumpWidget(const SouthseaCinemaApp());
//     expect(find.text('Welcome to Southsea Cinema'), findsOneWidget);
//   });

// }

import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';
import 'package:southsea_cinema/constants.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/views/home_view.dart';
import 'package:flutter/services.dart';

void main() {
  setUp(() {
    rootBundle.clear();
  });
  group('App smoke tests', () {
    testWidgets('App displays HomeView as home', (WidgetTester tester) async {
      // which represents a value or action that will complete later.
      await tester.pumpWidget(const SouthseaCinemaApp());
      await tester.pumpAndSettle();
      //checks to see if correct

      expect(find.byType(HomeView),
          findsOneWidget); //checks to see if the home page exists
      expect(find.text(appTitle), findsOneWidget); //checks for app title
    });

    testWidgets('Displays movie cards with names and booking buttons',
        (WidgetTester tester) async {
      await tester.pumpWidget(const SouthseaCinemaApp());
      await tester
          .pumpAndSettle(); //waits for ui to finish updating before continuing

      expect(find.text('Obsession (2026)'),
          findsOneWidget); //looks for the text, wants to find it once
      expect(find.text('The Odyssey (2026)'), findsOneWidget);
      expect(find.text('Book Now'),
          findsNWidgets(2)); //wants to find it twice as there is 2 buttons
    });
  });
}
