import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:instagram_without_ref/domain/article.dart';
import 'package:http/http.dart' as http;

const first = 0;
const serverURI = 'https://codingapple1.github.io/app/data.json';

class HomeStore extends ChangeNotifier {
  List<Article> articles = [];
  late File file;

  String user = '';
  String content = '';

  void initArticles() async {
    final http.Response response = await http.get(Uri.parse(serverURI));
    List<dynamic> decoded = jsonDecode(response.body);
    articles =
        decoded.map((decodedMap) => Article.fromJson(decodedMap)).toList();
    notifyListeners();
  }

  void addArticleWhereFrist(Article article) {
    articles.insert(first, article);
    notifyListeners();
  }

  void uploadd(File file){
    this.file = file;
    notifyListeners();
  }

  void setUser(String user){
    this.user = user;
    notifyListeners();
  }

  void setContent(String content){
    this.content = content;
    notifyListeners();
  }
}
