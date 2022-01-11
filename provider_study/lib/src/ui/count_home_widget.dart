import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_study/src/provider/count_provider.dart';

class CountHomeWidget extends StatelessWidget {
  const CountHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build called');
    return Center(
      child: Consumer<CountProvider>(
        builder: (context, provider, child) {
          return Text(provider.count.toString(),
            style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 80.0
            ),
          );
        },
      ),
    );
  }
}
