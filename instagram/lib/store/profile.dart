import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfileStore extends ChangeNotifier {
  List<String> imagesPath = [];

  void getImagesPath() async{
    final http.Response resp = await http.get(Uri.parse('https://codingapple1.github.io/app/profile.json'));
    List<dynamic> decoded = jsonDecode(resp.body);
    imagesPath = decoded.map((e) => e as String).toList();
    notifyListeners();
  }
}
