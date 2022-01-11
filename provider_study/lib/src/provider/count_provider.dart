import 'package:flutter/material.dart';

class CountProvider extends ChangeNotifier{
  int _count = 0; // private으로 설정

  int get count => _count;

  add() {
    _count++;
    notifyListeners();
  }

  remove(){
    _count--;
    notifyListeners();
  }
}