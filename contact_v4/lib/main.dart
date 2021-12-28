import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homework(),
    );
  }
}

class Homework extends StatelessWidget {
  const Homework({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Text('Dialog'),
        onPressed: () {
          showDialog(context: context, builder: (context) {
            return HomeworkAlertDialog();
          });
        },
      ),
      appBar: AppBar(
        title: Text('숙제5'),
        centerTitle: false,
      ),
    );
  }
}

class HomeWorkDialog extends StatelessWidget {
  const HomeWorkDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      alignment: Alignment.center,
      child: Container(
        width: 300,height: 200,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                'Contact',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: TextField()
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {

                  },
                ),
                TextButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class HomeworkAlertDialog extends StatelessWidget {
  const HomeworkAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Contact'),
      content: TextField(),
      actions: [
        TextButton(
            onPressed: () {

            },
            child: Text('OK')
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'))
      ],
    );
  }
}


