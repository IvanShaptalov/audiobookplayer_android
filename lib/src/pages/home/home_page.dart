import 'package:audiobook_player/src/pages/home/home_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State {
  var _currentPage = 1;
  var _pages = [
    Text("Search"),
    SampleItemListView(),
    Text("Library")
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "BEKMEK",
        home: Scaffold(
            body: Center(child: _pages.elementAt(_currentPage)),
            bottomNavigationBar: BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.search), label: "Search"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: "Home"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.my_library_books), label: "Library"),
                ],
                currentIndex: _currentPage,
                fixedColor: Colors.red,
                onTap: (int inIndex) {
                  setState(() {
                    _currentPage = inIndex;
                  });
                })));
  }
}
