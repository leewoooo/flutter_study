import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_study/src/component/view_count.dart';
import 'package:provider_study/src/provider/count_provider.dart';

class CountHomeWidget extends StatelessWidget {
  CountHomeWidget({Key? key}) : super(key: key);
  late CountProvider _countProvider;

  @override
  Widget build(BuildContext context) {
    _countProvider = Provider.of<CountProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Count Provider'),
      ),
      body: const ViewCount(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {
              _countProvider.add();
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              _countProvider.remove();
            },
            icon: const Icon(Icons.remove),
          )
        ],
      ),
    );
  }
}
