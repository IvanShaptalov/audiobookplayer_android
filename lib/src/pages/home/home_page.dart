import 'package:audiobook_player/src/pages/home/home_screen.dart';
import 'package:audiobook_player/src/pages/home/view/player.dart';
import 'package:flutter/material.dart';

import '../../settings/settings_view.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State {
  var _currentPage = 1;
  var _pages = [Text("Search"), SampleItemListView(), Text("Library")];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "BEKMEK",
        home: Scaffold(
            appBar: AppBar(
              title: const Text('home page'),
              actions: [
                IconButton(
                  alignment: Alignment.centerRight,
                  icon: const Icon(Icons.image),
                  onPressed: () {
                    // Navigate to the settings page. If the user leaves and returns
                    // to the app after it has been killed while running in the
                    // background, the navigation stack is restored.
                    Navigator.restorablePushNamed(
                        context, SettingsView.routeName);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    // Navigate to the settings page. If the user leaves and returns
                    // to the app after it has been killed while running in the
                    // background, the navigation stack is restored.
                    Navigator.restorablePushNamed(
                        context, SettingsView.routeName);
                  },
                ),
              ],
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _pages.elementAt(_currentPage), 
                Player()],
            ),
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
