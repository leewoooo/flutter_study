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
      appBar: AppBar(
        title: Text('숙제4'),
        centerTitle: false,
      ),
      body: ContactLisView(),
    );
  }
}

class ContactLisView extends StatefulWidget {
  const ContactLisView({Key? key}) : super(key: key);

  @override
  _ContactListLeadingState createState() => _ContactListLeadingState();
}

class _ContactListLeadingState extends State<ContactLisView> {
  var like = [0,0,0]; // 3명의 좋아요 state
  var names = ['김영숙', '홍길동','피자집'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          leading: Text(like[index].toString()),
          title: Text(names[index].toString()),
          trailing: ElevatedButton(
            child: Text('좋아요'),
            onPressed: () {
              setState(() {
                like[index]++;
              });
            },
          ),
        );
      },
      itemCount: names.length,
    );
  }
}




