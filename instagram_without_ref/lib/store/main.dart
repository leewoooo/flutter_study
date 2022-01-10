import 'package:flutter/material.dart';

class MainPageStore extends ChangeNotifier{
  int tab = 0;

  void changeTab(int value){
    tab = value;
    notifyListeners();
  }
}