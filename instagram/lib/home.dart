import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:instagram/article.dart';
import 'dart:convert';

// 추후 참조
// https://docs.flutter.dev/cookbook/networking/background-parsing // flutter iosolation
// https://www.youtube.com/watch?v=DNm9hHLKatA&t=636s // dio 영상
// https://pub.dev/packages/dio dio

class HomeTapBody extends StatefulWidget {
  const HomeTapBody({Key? key}) : super(key: key);

  @override
  State<HomeTapBody> createState() => _HomeTapBodyState();
}

class _HomeTapBodyState extends State<HomeTapBody> {
  List<Article> articles = [];

  getData() async{
    final http.Response response = await http.get(Uri.parse('https://codingapple1.github.io/app/data.json'));
    final List<dynamic> parsed = jsonDecode(response.body);

    setState(() {
      articles  = parsed.map((parsedArticle) => Article.fromJSON(parsedArticle)).toList();
    });
  }

  addData(Article article){
    setState(() {
      articles.add(article);
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    // future buildiler는 서버에서 Data를 한번에 전부 가져올 때 유용하다.
    // 데이터를 지속적으로 가져와야 할 때는 사용하기 힘들 수 있다.
    return ArticleList(data : articles, addData: addData);
  }
}

class ArticleList extends StatefulWidget {
  const ArticleList({Key? key, required this.data, required this.addData}) : super(key: key);
  final List<Article> data;
  final Function addData;
  @override
  _ArticleListState createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  ScrollController scrollController = ScrollController();
  int dataNumber = 1;

  getSubData(int dataNumber) async{
    final http.Response response = await http.get(Uri.parse('https://codingapple1.github.io/app/more$dataNumber.json'));
    final Map<String, dynamic> parsed = jsonDecode(response.body);
    widget.addData(Article.fromJSON(parsed));
    setState(() {
      this.dataNumber++;
    });
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
        if (dataNumber > 2){
          return;
        }
        getSubData(dataNumber);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.data.length,
      controller: scrollController,
      itemBuilder: (ctx, i) {
        return Column(
          children: [
            Image.network(widget.data[i].image),
            Container(
              padding: const EdgeInsetsDirectional.all(15.0),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ID: ${widget.data[i].id}'),
                  Text('Likes: ${widget.data[i].likes}'),
                  Text('Content: ${widget.data[i].content}'),
                  Text('Liked: ${widget.data[i].liked}'),
                  Text('Date: ${widget.data[i].date}'),
                  Text('User: ${widget.data[i].user}'),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}






