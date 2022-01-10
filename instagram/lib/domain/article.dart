import 'dart:io';

import 'package:flutter/material.dart';

class Article {
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

  factory Article.fromJSON(Map<String, dynamic> json){
    Image image = Image.network(json['image'] as String);
    return Article(
        id: json['id'] as int,
        image: image,
        likes: json['likes'] as int,
        date: json['date'] as String,
        content: json['content'] as String,
        liked: json['liked'] as bool,
        user: json['user'] as String,
    );
  }

  factory Article.fromImageFile(File file, String content, int id){
    return Article(
        id: id,
        image: Image.file(file),
        likes: 9,
        date: 'mockData',
        content: content,
        liked: false,
        user: 'foobar'
    );
  }
}


