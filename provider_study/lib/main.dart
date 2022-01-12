import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:provider_study/src/home.dart';
import 'package:provider_study/src/provider/bottom_navigation_provider.dart';
import 'package:provider_study/src/provider/count_provider.dart';
import 'package:provider_study/src/provider/movie_provider.dart';

void main() async{
  await dotenv.load(fileName: "./.env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CountProvider()),
          ChangeNotifierProvider(create: (context) => BottomNavigationProvider()),
          ChangeNotifierProvider(create: (context) => MovieProvider())
        ],
        child: Home(),
      ),
    );
  }
}

