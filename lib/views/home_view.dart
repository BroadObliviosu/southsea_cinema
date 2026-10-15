// import 'package:flutter/material.dart';
// import 'package:southsea_cinema/constants.dart';
// import 'package:southsea_cinema/widgets/nav_drawer.dart';

// class HomeView extends StatelessWidget {
//   const HomeView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           appTitle,
//           style: cinemaHeaderStyle,
//         ),
//         backgroundColor: cinemaSurface,
//         iconTheme: const IconThemeData(color: cinemaBrand),
//         elevation: 0,
//       ),
//       drawer: const NavDrawer(),
//       body: const Center(
//         child: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'Welcome to $appTitle',
//                 style: TextStyle(
//                   color: cinemaFontWhite,
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/models/movies.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final movieRepository = MovieRepository();
    final movies = movieRepository.getMovies(); //final cant be reassigned

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          appTitle,
          style: cinemaHeaderStyle,
          ),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: ListView.builder( //maakes it scrollable
        itemCount: movies.length,//updates the number of items in the list based on the length of the movies list
        itemBuilder: (context, index) { //builds each item in the list based on the index
          return MovieCard(movie: movies[index]); //selects movie based on index
        },
      ),
    );
  }
}