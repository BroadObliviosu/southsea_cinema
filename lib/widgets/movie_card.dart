import 'package:flutter/material.dart';
import 'package:southsea_cinema/models/movies.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) { //defines UI
    return Card(
      child: Padding( //adds space around the content of the card
        padding: const EdgeInsets.all(8.0), //adds 8 pixels of padding
        child: Row( 
          crossAxisAlignment: CrossAxisAlignment.start,//allings to the top
          children: [
            Image.asset(
              movie.posterImagePath,
              width:100,
              height:150,
              fit: BoxFit.cover, //displays the image 
            ),
            const SizedBox(width: 16), //space between the image and the text
            Expanded( //takes up remainng space in the row
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, //alligns text
                children: [
                  Text(movie.title,
                  style: const TextStyle(color: Colors.black)
                  ),
                  Text(movie.ageRating,
                  style: const TextStyle(color: Colors.black)),
                  Text(movie.synopsis,
                  style: const TextStyle(color: Colors.black)),
                  Text('Screening Time: ${movie.screeningTime}'
                  ,style: const TextStyle(color: Colors.black)),
                  
                  ElevatedButton( //adds a button
                    onPressed: () =>  print('booking ${movie.title}'),
                    child: const Text('Book Now'),
                  )
                ],
              ),
            )
          ]
        )
      ),
    );
  }
}
