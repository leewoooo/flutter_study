import 'dart:io';

import 'package:flutter/material.dart';
import 'package:instagram_without_ref/pages/home.dart';
import 'package:instagram_without_ref/pages/register.dart';
import 'package:instagram_without_ref/store/home.dart';
import 'package:instagram_without_ref/store/main.dart';
import 'package:instagram_without_ref/style/style.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MainPageStore()),
      ChangeNotifierProvider(create: (context) => HomeStore())
    ],
    child: MaterialApp(
      home: const MyApp(),
      theme: mainTheme(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderingMainAppBar(context),
      body: <Widget>[const HomeTab(),Text('샵')][context.watch<MainPageStore>().tab],
      bottomNavigationBar: renderBottomNavigationBar(context),
    );
  }

  AppBar renderingMainAppBar(BuildContext context){
    return AppBar(
      title: const Text('Instagram'),
      centerTitle: false,
      actions: [
        IconButton(
          icon: const Icon(Icons.add_box_outlined),
          onPressed: () async {
            final ImagePicker imagePicker = ImagePicker();
            XFile? selected =  await imagePicker.pickImage(source: ImageSource.gallery);
            if (selected == null){
              return;
            }
            context.read<HomeStore>().uploadd(File(selected.path));

            Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleRegister()));
          },
        )
      ],
    );
  }

  BottomNavigationBar renderBottomNavigationBar(BuildContext context){
    return BottomNavigationBar(
      currentIndex: context.watch<MainPageStore>().tab,
      onTap: (value) {
        context.read<MainPageStore>().changeTab(value);
      },
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home'
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Shop'
        )
      ],
    );
  }
}

