import 'dart:io'; // html package의 file이 아니라 io의 file이다.

import 'package:flutter/material.dart';

class Upload extends StatelessWidget {
  const Upload({Key? key, required this.file}) : super(key: key);
  final File file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instagram'),
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('이미지 업로드 화면'),
          SizedBox(
            width: double.infinity,
            height: 300.0,
            child: Image.file(
              file,
              fit: BoxFit.cover,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: (){
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
