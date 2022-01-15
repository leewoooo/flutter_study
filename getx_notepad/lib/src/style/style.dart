import 'package:flutter/material.dart';

ThemeData mainTheme(){
  return ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      actionsIconTheme: IconThemeData(
        color: Colors.black,
        opacity: 1.0
      ),
      // centerTitle: false,
      iconTheme: IconThemeData(
       color: Colors.black,
       opacity: 1.0
      ),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.w700,
      )
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.white,
    ),
    inputDecorationTheme: const InputDecorationTheme(
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.grey)
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black)
      ),
    ),
  );
}