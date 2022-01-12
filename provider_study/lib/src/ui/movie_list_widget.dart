import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_study/src/model/movie.dart';
import 'package:provider_study/src/provider/movie_provider.dart';

class MovieListWidget extends StatelessWidget {
  MovieListWidget({Key? key}) : super(key: key);
  late MovieProvider _movieProvider;

  Widget _makeMovieOne(Movie movie){
    return Row(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          ),
          child: Image.network(movie.posterURl),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  movie.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0
                  ),
                ),
                const SizedBox(height: 10.0),
                Expanded(
                  child: Text(
                    movie.overview,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 8,
                    style: const TextStyle(
                      fontSize: 13.0
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _makeListView(List<Movie> movies){
    return ListView.separated(
      itemCount: movies.length,
      itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 200.0,
            child: _makeMovieOne(movies[index]),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 3.0,
                  blurRadius: 3.0,
                  offset: Offset.zero
                )
              ]
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index){
        return const Divider();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _movieProvider = Provider.of<MovieProvider>(context,listen: false);
    _movieProvider.loadMovies();
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Movie List Provider'),
      ),
      body: Consumer<MovieProvider>(
        builder: (context, provider, child) {
          if(provider.movies.isNotEmpty){
            return _makeListView(provider.movies);
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
