import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';
import 'package:southsea_cinema/widgets/basket_button.dart';
import 'package:southsea_cinema/models/movies.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Movie> _movies = [];
  bool _loading = true;
  String _errorMessage = '';

  @override
  void initState() {
    super.initState();
    _loadMovies();
  }

  Future<void> _loadMovies() async {
    try {
      final movieRepository = MovieRepository();
      final movies = await movieRepository.loadMoviesFromAsset();

      if (!mounted) return;

      setState(() {
        _movies = movies;
        _loading = false;
      });
    } catch (e) {
      if (!mounted) return;

      setState(() {
        _errorMessage = e.toString();
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final Widget body;

    if (_loading) {
      body = const Center(child: CircularProgressIndicator());
    } else if (_errorMessage.isNotEmpty) {
      body = Center(child: Text(_errorMessage));
    } else {
      body = ListView.builder(
        itemCount: _movies.length,
        itemBuilder: (BuildContext context, int index) {
          return MovieCard(movie: _movies[index]);
        },
      ); //final cant be reassigned
    }
      return Scaffold(
        appBar: AppBar(
          title: const Text(appTitle), //appBarTheme in main.dart takes over.
          actions: const [BasketButton()],
          backgroundColor: cinemaSurface,
          iconTheme: const IconThemeData(color: cinemaBrand),
          elevation: 0,
        ),
        drawer: const NavDrawer(),
        body: body, //selects movie based on index
      );
    }
  }

