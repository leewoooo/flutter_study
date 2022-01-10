import 'package:flutter/material.dart';
import 'package:instagram/domain/article.dart';
import 'package:instagram/widget/profile.dart';


class HomeTab extends StatelessWidget {
  const HomeTab({Key? key, required this.articles}) : super(key: key);
  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return (
      ListView.builder(
        itemCount: articles.length,
        itemBuilder: (ctx, i) => renderingArticle(context, articles[i]),
      )
    );
  }

  Column renderingArticle(BuildContext context, Article article){
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
              GestureDetector(
                child: Text('User: ${article.user}'),
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) => const Profile(),
                      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
                        SlideTransition(
                          position: Tween(
                            begin: const Offset(1.0,0.0),
                            end: Offset.zero
                          ).animate(animation),
                          child: child,
                        ),
                    )
                  );
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
