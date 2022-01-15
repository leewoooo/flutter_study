import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_notepad/src/style/style.dart';
import 'package:getx_notepad/src/ui/home.dart';

void main() {
  runApp(GetMaterialApp(
    // title: "GetX NotePad",
    home: const MyApp(),
    theme: mainTheme(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const Home();
  }
}


