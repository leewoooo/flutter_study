import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:instagram/domain/article.dart';

class ArticleData{
  final String serverURL;

  ArticleData({
    required this.serverURL
  });

  // https://docs.flutter.dev/cookbook/networking/background-parsing
  List<Article> parseArticle(String responseBody){
    final List<dynamic> decoded = jsonDecode(responseBody);
    return decoded.map((decodedMap) => Article.fromJSON(decodedMap)).toList();
  }

  Future<List<Article>> fetchArticles(http.Client client) async {
    final response = await client.get(Uri.parse(serverURL));
    return parseArticle(response.body);
  }
}