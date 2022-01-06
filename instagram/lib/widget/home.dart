import 'package:flutter/material.dart';
import 'package:instagram/domain/article.dart';


class HomeTab extends StatelessWidget {
  const HomeTab({Key? key, required this.articles}) : super(key: key);
  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return (
      ListView.builder(
        itemCount: articles.length,
        itemBuilder: (ctx, i) => renderingArticle(articles[i]),
      )
    );
  }

  Column renderingArticle(Article article){
    return Column(
      children: [
        article.image,
        Container(
          padding: const EdgeInsets.all(15.0),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('ID: ${article.id.toString()}'),
              Text('Likes: ${article.likes.toString()}'),
              Text('Date: ${article.date}'),
              Text('Content: ${article.content}'),
              Text('Liked: ${article.liked.toString()}'),
              Text('User: ${article.user}'),
            ],
          ),
        )
      ],
    );
  }
}
