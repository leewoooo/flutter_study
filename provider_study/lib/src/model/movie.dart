class Movie {
  final String overview;
  final String posterPath;
  final String title;

  Movie({
    required this.overview,
    required this.posterPath,
    required this.title
  });

  String get posterURl => 'https://image.tmdb.org/t/p/w500/$posterPath';

  factory Movie.fromJSON(Map<String,dynamic> json){
    return Movie(
      overview: json["overview"] as String,
      posterPath: json["poster_path"] as String,
      title: json["title"] as String
    );
  }
}