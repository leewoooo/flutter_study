import 'package:flutter/material.dart';
import 'package:instagram/home.dart';
import 'package:instagram/style.dart' as style;
import 'package:instagram/upload.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(MaterialApp(
    theme: style.theme,
    home: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int tab = 0;
  var file;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instagram'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.add_box_outlined),
            onPressed: () async{
              final ImagePicker picker = ImagePicker();
              final pickedFile = await picker.pickImage(source: ImageSource.gallery);
              if(pickedFile != null){
                setState(() {
                  file = File(pickedFile.path);
                });
              }

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Upload(file: file),
                )
              );
            },
            iconSize: 30.0,
          ),
        ],
      ),
      body: [const HomeTapBody(), const Text('샵')][tab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tab,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (value) {
          setState(() {
            tab = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: '홈',
            icon: Icon(Icons.home_outlined),
          ),
          BottomNavigationBarItem(
            label: '쇼핑',
            icon: Icon(Icons.shopping_bag_outlined),
          ),
        ],
      ),
    );
  }
}
