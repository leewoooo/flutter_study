import 'package:flutter/material.dart';
import 'package:instagram_without_ref/domain/article.dart';
import 'package:instagram_without_ref/store/home.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  void initState() {
    super.initState();
    context.read<HomeStore>().initArticles();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: context.watch<HomeStore>().articles.length,
      itemBuilder: (context, index) => renderArticle(index, context.watch<HomeStore>().articles[index])
    );
  }

  Widget renderArticle(int index, Article article){
    return Column(
      children: [
        article.image,
        Container(
          padding: const EdgeInsets.all(15.0),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('ID: ${article.id}'),
              Text('Likes: ${article.likes}'),
              Text('Date: ${article.date}'),
              Text('Content: ${article.content}'),
              Text('User: ${article.user}'),
              rederLikeButton(context, index),
            ],
          ),
        )
      ],
    );
  }

  ElevatedButton rederLikeButton(BuildContext context, int index){
    return ElevatedButton(
      child: context.watch<HomeStore>().articles[index].liked ? const Text('좋아요 취소'): const Text('좋아요'),
      onPressed: () {

      },
      style: ElevatedButton.styleFrom(
        primary: context.watch<HomeStore>().articles[index].liked ? Colors.deepOrange : Colors.blue
      )
    );
  }
}
