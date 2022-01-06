import 'package:flutter/material.dart';

ThemeData returnMainThemeData(){
  return ThemeData(
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w700,
        fontSize: 25.0,
      ),
      centerTitle: false,
      backgroundColor: Colors.white,
      actionsIconTheme: IconThemeData(
        color: Colors.black,
        size: 30.0,
      ),
      iconTheme: IconThemeData(
        // https://sarunw.com/posts/how-to-change-back-button-color-in-flutter/
        // 각 네비게이션의 뒤로가기 색상 때문에.
        color: Colors.black
      )
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.pink,
      unselectedItemColor: Colors.black,
      backgroundColor: Colors.white,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      elevation: 1.0,
    )
  );
}