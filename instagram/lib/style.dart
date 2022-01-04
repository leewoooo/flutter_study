import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  iconTheme: const IconThemeData( color: Colors.blue ),
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    elevation: 1,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontSize: 25.0,
    ),
    actionsIconTheme: IconThemeData( color: Colors.black ),
    // https://stackoverflow.com/questions/51508257/how-to-change-the-appbar-back-button-color
    iconTheme: IconThemeData(
      color: Colors.black
    )
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    elevation: 1,
    backgroundColor: Colors.white,
    unselectedItemColor: Colors.black,
    selectedItemColor: Colors.indigo,
  ),
);