class Article {
  final int id;
  final String image;
  final int likes;
  final String date;
  final String content;
  final bool liked;
  final String user;

  Article({
    required this.id,
    required this.image,
    required this.likes,
    required this.date,
    required this.content,
    required this.liked,
    required this.user
  });

  factory Article.fromJSON(Map<String, dynamic> json){
    return Article(
        id: json['id'],
        image: json['image'] as String,
        likes: json['likes'],
        date: json['date'] as String,
        content: json['content'] as String,
        liked: json['liked'] as bool,
        user: json['user'] as String
    );
  }
}