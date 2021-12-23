import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(
    home: Homework(),
  ));
}

class Homework extends StatelessWidget {
  Homework({Key? key}) : super(key: key);
  var num = 1;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Text(num.toString()),
        onPressed: (){
          print(num);
          num++;
        },
      ),
      appBar: AppBar(
        title: Text('세번째 숙제'),
        centerTitle: false,
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return ContactRow();
        },
      ),
      bottomNavigationBar: CustomAppBar(),
    );
  }
}

class ContactRow extends StatelessWidget {
  const ContactRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListTile(
        leading: Icon(Icons.account_circle_sharp),
        title: Text('이우길'),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.phone),
          Icon(Icons.message),
          Icon(Icons.account_box),
        ],
      ),
    );
  }
}


