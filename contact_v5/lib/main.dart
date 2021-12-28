import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var a = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Text('버튼'),
        onPressed: () {
          showDialog(context: context, builder: (context) {
            return CustomDialog(state: a);
          });
        },
      ),
      appBar: AppBar(
        title: Text('숙제6'),
        centerTitle: false,
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  const CustomDialog({Key? key, this.state}) : super(key: key);
  final state;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('숙제6 다이얼로그 제목'),
      content: Text(state.toString()),
      actions: [
        ElevatedButton(
          onPressed: () {
          },
          child: Text('완료')
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('취소')
        )
      ],
    );
  }
}



