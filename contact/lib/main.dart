import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('숙제 2'),
          centerTitle: false, // 기본 설정값 true
        ),
        body: SizedBox(
          width: double.infinity,
          height: 150,
          child: Row(
            children: [
              Flexible(
                child: Container(
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('background.jpeg'),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                flex: 3,
              ),
              Flexible(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('캐논 카메라'),
                      Text('성동구 행당동 끌올 10분 전'),
                      Text('210,000원'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.favorite_border),
                          Text('4')
                        ],
                      )
                    ],
                  ),
                ),
                flex: 7,
              )
            ],
          ),
        ),
      ),
    );
  }
}

