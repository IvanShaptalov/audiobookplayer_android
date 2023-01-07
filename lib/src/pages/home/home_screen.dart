import 'package:audiobook_player/src/pages/home/view/current_playing.dart';
import 'package:audiobook_player/src/pages/home/view/last_achievement.dart';
import 'package:audiobook_player/src/pages/home/view/player.dart';
import 'package:flutter/material.dart';

import '../../settings/settings_view.dart';
import '../sample_item.dart';
import '../sample_item_details_view.dart';

/// Displays a list of SampleItems.
class SampleItemListView extends StatelessWidget {
  const SampleItemListView({
    super.key,
    this.items = const [
      SampleItem(1, 'Audiobooks1'),
      SampleItem(2, 'Audiobook2'),
      SampleItem(3, 'Audiobook3'),
      SampleItem(4, 'Audiobook4'),
      SampleItem(5, 'Audiobook5'),
      SampleItem(6, 'Audiobook6'),
      SampleItem(7, 'Audiobook7'),
    ],
  });

  static const routeName = '/';

  final List<SampleItem> items;

  @override
  Widget build(BuildContext context) {
    double default_row_heigth =
        MediaQuery.of(context).size.height / 6;
    double default_current_playing_part_width =
        MediaQuery.of(context).size.width / 2;
    
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.my_library_books), label: "Library"),
          ],
        ),
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

        // To work with lists that may contain a large number of items, it’s best
        // to use the ListView.builder constructor.
        //
        // In contrast to the default ListView constructor, which requires
        // building all Widgets up front, the ListView.builder constructor lazily
        // builds Widgets as they’re scrolled into view.

        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Container(
                  height: default_row_heigth,
                  child: Scrollbar(
                    scrollbarOrientation: ScrollbarOrientation.bottom,
                    thumbVisibility: true,
                    child: ListView.builder(
                      // Providing a restorationId allows the ListView to restore the
                      // scroll position when a user leaves and returns to the app after it
                      // has been killed while running in the background.
                      restorationId: 'sampleItemListView',
                      scrollDirection: Axis.horizontal,
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = items[index];

                        return Container(
                            margin: EdgeInsets.symmetric(vertical: 20.0),
                            width: MediaQuery.of(context).size.width / 3,
                            color: Color.fromARGB(179, 48, 194, 109),
                            // ignore: prefer_const_constructors
                            child: Align(
                                alignment: Alignment.center,
                                child: ListTile(
                                    title: Text('${item.title}', maxLines: 2),
                                    leading: const CircleAvatar(
                                      // Display the Flutter Logo image asset.
                                      foregroundImage: AssetImage(
                                          'assets/images/flutter_logo.png'),
                                    ),
                                    onTap: () {
                                      // Navigate to the details page. If the user leaves and returns to
                                      // the app after it has been killed while running in the
                                      // background, the navigation stack is restored.
                                      Navigator.restorablePushNamed(
                                        context,
                                        SampleItemDetailsView.routeName,
                                      );
                                    })));
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LastAchievement(),
                            // child: LastAchievement()
                    CurrentPlayingBook(),
                  ],
                ),
              ],
            ),
            Player(),
          ],
        ));
  }
}
