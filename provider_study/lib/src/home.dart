import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_study/src/provider/bottom_navigation_provider.dart';
import 'package:provider_study/src/ui/count_home_widget.dart';
import 'package:provider_study/src/ui/movie_list_widget.dart';

const home = 0;
const movie = 1;

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  // late CountProvider _countProvider;
  late BottomNavigationProvider _bottomNavigationProvider;

  Widget _navigationBody() {
    switch (_bottomNavigationProvider.currentPage) {
      case home:
        return CountHomeWidget();
      case movie:
        return MovieListWidget();
        break;
    }
    return Container();
  }

  Widget _bottomNavigationWidget() {
    return BottomNavigationBar(
      currentIndex: _bottomNavigationProvider.currentPage,
      onTap: (value) {
        _bottomNavigationProvider.updateCurrentPage(value);
      },
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.movie),
          label: '영화',
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // _countProvider = Provider.of<CountProvider>(context,listen: false);
    _bottomNavigationProvider = Provider.of<BottomNavigationProvider>(context);
    return Scaffold(
        body: _navigationBody(),
        bottomNavigationBar: _bottomNavigationWidget());
  }
}
