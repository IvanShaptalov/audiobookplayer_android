// ignore_for_file: library_private_types_in_public_api

import 'package:audiobook_player/src/config/config.dart';
import 'package:audiobook_player/src/pages/home/view/home_screen.dart';
import 'package:audiobook_player/src/pages/home/view/player.dart';
import 'package:audiobook_player/src/pages/libpage/view/library_screen.dart';
import 'package:audiobook_player/src/pages/profile/profile_screen.dart';
import 'package:audiobook_player/src/pages/search_page/view/search_page.dart';
import 'package:flutter/material.dart';

import '../../settings/settings_view.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home_page';

  const HomePage({Key? key}) : super(key: key);
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State {
  var _currentPage = 1;
  final List<Widget> _pages = [SearchPage(), const HomeScreen(), Library()];
  final List<String> _pageTitles = ['Search Page', 'Home Page', 'Library Page'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            alignment: Alignment.centerRight,
            icon: const Icon(Icons.image),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, ProfileScreen.routeName);
            },
          ),
          title: Text(_pageTitles.elementAt(_currentPage)),
          actions: [
            IconButton(
              icon: const Icon(Icons.history),
              onPressed: () {
                // Navigate to the settings page. If the user leaves and returns
                // to the app after it has been killed while running in the
                // background, the navigation stack is restored.
                Navigator.restorablePushNamed(context, SettingsView.routeName);
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                // Navigate to the settings page. If the user leaves and returns
                // to the app after it has been killed while running in the
                // background, the navigation stack is restored.
                Navigator.restorablePushNamed(context, SettingsView.routeName);
              },
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _pages.elementAt(_currentPage),
            Player(innerPlayer: player),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.search), label: "Search"),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.my_library_books), label: "Library"),
            ],
            currentIndex: _currentPage,
            fixedColor: Colors.red,
            onTap: (int inIndex) {
              setState(() {
                _currentPage = inIndex;
              });
            }));
  }
}
