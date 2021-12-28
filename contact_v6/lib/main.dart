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
  var total = 3;
  var friendList = ["이우길","이우길2","이우길3"];

  incrementTotal(){
    setState(() {
      total++;
    });
  }

  addFriend(String friend){
    setState(() {
      friendList.add(friend);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Text('버튼'),
        onPressed: () {
          showDialog(context: context, builder: (context) {
            return CustomDialog(incrementTotal:incrementTotal, addFriend: addFriend);
          });
        },
      ),
      appBar: AppBar(
        title: Text('친구수: '+ total.toString()),
        centerTitle: false,
      ),
      body: ListView.builder(
        itemCount: friendList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.account_circle_sharp),
            title: Text(friendList[index]),
          );
        },
      ),
    );
  }
}

class CustomDialog extends StatelessWidget {
  const CustomDialog({Key? key, this.incrementTotal, this.addFriend}) : super(key: key);

  final incrementTotal;
  final addFriend;

  @override
  Widget build(BuildContext context) {
    var inputData = TextEditingController();
    return AlertDialog(
      title: Text('숙제7'),
      content: TextField(
        controller: inputData,
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            addFriend(inputData.text);
            incrementTotal();
            Navigator.pop(context);
          },
          child: Text('등록'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('취소'),
        )
      ],
    );
  }
}

