import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_study/src/provider/count_provider.dart';
import 'package:provider_study/src/ui/count_home_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CountProvider countProvider = Provider.of<CountProvider>(context,listen: false);
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {
              countProvider.add();
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              countProvider.remove();
            },
            icon: const Icon(Icons.remove),
          )
        ],
      ),
      appBar: AppBar(
        title: const Text('Provider Sample'),
        centerTitle: false,
      ),
      body: CountHomeWidget(),
    );
  }
}
