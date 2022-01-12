import 'package:flutter/material.dart';
import 'package:provider_study/src/model/movie.dart';
import 'package:provider_study/src/repository/movie_repository.dart';

class MovieProvider extends ChangeNotifier{
  final MovieRepository _movieRepository = MovieRepository();
  List<Movie> _movies = [];
  List<Movie> get movies => _movies;

  loadMovies() async{
    //repository
    List<Movie> loadMovies = await _movieRepository.loadMovies();
    // loadMovies에 대한 예외 처리 및 추가적인 가공작업 가능
    _movies = loadMovies;
    notifyListeners();
  }
}