import 'package:flutter/material.dart';
import 'package:instagram_without_ref/dto/article.dart';

class Article{
  final int id;
  final Image image;
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

  // for Example Server Response to Article
  factory Article.fromJson(Map<String, dynamic> json){
    return Article(
        id: json["id"] as int,
        image: Image.network(json["image"] as String),
        likes: json["likes"] as int,
        date: json["date"] as String,
        content: json["content"] as String,
        liked: json["liked"] as bool,
        user: json["user"] as String,
    );
  }

  // for user Image and Content to Article
  factory Article.fromSaveRequest(SaveArticleRequest req){
    return Article(
        id: req.id,
        image: Image.file(req.file),
        likes: 0,
        date: req.date,
        content: req.content,
        liked: false,
        user: req.user
    );
  }

}