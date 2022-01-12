import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider_study/src/model/movie.dart';
import 'package:http/http.dart' as http;


var movieServerURI = 'https://api.themoviedb.org/3/movie/popular?api_key=${dotenv.get('TMDB_API_KEY')}';

class MovieRepository{
  Future<List<Movie>> loadMovies() async{
    http.Response response = await http.get(Uri.parse(movieServerURI));
    Map<String,dynamic> decoded = json.decode(response.body);
    if(decoded["results"] != null){
      List<dynamic> list = decoded["results"];
      return list.map<Movie>((item) => Movie.fromJSON(item)).toList();
    }
    // 결과가 없을 경우 빈 배열 return
    return [];
  }
}