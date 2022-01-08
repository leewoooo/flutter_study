import 'dart:io';

import 'package:flutter/material.dart';
import 'package:instagram/domain/article.dart';

class RegisterArticleRoute extends StatefulWidget {
  const RegisterArticleRoute({Key? key, required this.addArticleFirst, required this.id, required this.file}) : super(key: key);
  final void Function(Article) addArticleFirst;
  final int id;
  final File file;
  // final void addArticle;
  @override
  State<RegisterArticleRoute> createState() => _RegisterArticleRouteState();
}

class _RegisterArticleRouteState extends State<RegisterArticleRoute> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('새 게시글'),
        actions: [
          TextButton(
            child: const Text(
              '공유',
              style: TextStyle(
                color: Colors.black,
                fontSize: 15.0
              ),
            ),
            onPressed: () {
              Article newArticle = Article.fromImageFile(widget.file, controller.text,widget.id);
              widget.addArticleFirst(newArticle);
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(15.0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text('등록 사진'),
            Image.file(
              widget.file,
              height: 300.0,
            ),
            const SizedBox(height: 10.0,),
            const Text('등록 content'),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a Article Content'
              ),
              controller: controller,
            )
          ],
        ),
      ),
    );
  }
}
