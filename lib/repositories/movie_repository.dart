import 'package:southsea_cinema/models/movies.dart';

class MovieRepository {
  List<Movie> getMovies() { //get the list from the movies.dart   
    return   [
      Movie(
        id: 'fim001',
        title: 'Obsession (2026)',
        synopsis: 'A psychological thriller that delves into the depths of human desire and obsession',
        ageRating: '18',
        runtime: '1h 45m',
        screeningTime:  '20:00',
        ticketPrice: 7.50,
        posterImagePath: 'assets/images/img1.jpg',
      ),
      Movie(
        id: 'fim002',
        title: 'The Odyssey (2026)',
        synopsis: 'An epic adventure that follows a hero\'s journey through uncharted territories and mythical challenges',
        ageRating: '15',
        runtime: '2h 35m',
        screeningTime:  '18:30',
        ticketPrice: 7.50,
        posterImagePath: 'assets/images/img2.jpg',
      ),

    ];
  }
}

