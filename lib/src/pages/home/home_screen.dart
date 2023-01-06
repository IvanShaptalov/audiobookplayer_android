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
      SampleItem(3, 'Audiobook3')
    ],
  });

  static const routeName = '/';

  final List<SampleItem> items;

  @override
  Widget build(BuildContext context) {
    double default_row_heigth =
        MediaQuery.of(context).size.width / (items.length * 2);
    double default_current_playing_part_width =
        MediaQuery.of(context).size.width / 2.5;
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

        // To work with lists that may contain a large number of items, it’s best
        // to use the ListView.builder constructor.
        //
        // In contrast to the default ListView constructor, which requires
        // building all Widgets up front, the ListView.builder constructor lazily
        // builds Widgets as they’re scrolled into view.

        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
            Container(
              height: default_row_heigth,
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
                      width: MediaQuery.of(context).size.width / items.length,
                      color: Color.fromARGB(179, 48, 194, 109),
                      // ignore: prefer_const_constructors
                      child: Align(
                          alignment: Alignment.center,
                          child: ListTile(
                              title: Text('${item.title}'),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    width: default_current_playing_part_width,
                    height: default_row_heigth,
                    color: Color.fromARGB(179, 48, 194, 109),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: ListTile(
                            // Last Achievement
                            title: Text('last achievement'),
                            leading: const CircleAvatar(
                              // Display the Flutter Logo image asset.
                              foregroundImage:
                                  AssetImage('assets/images/flutter_logo.png'),
                            ),
                            onTap: () {
                              // Navigate to the details page. If the user leaves and returns to
                              // the app after it has been killed while running in the
                              // background, the navigation stack is restored.
                              Navigator.restorablePushNamed(
                                context,
                                SampleItemDetailsView.routeName,
                              );
                            }))),
                Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: default_row_heigth,
                      width: default_current_playing_part_width,
                      child: Text('new row'),
                      color: Colors.amber,
                    )),
              ],
            ),],),
            Align( // place to player
              alignment: Alignment.bottomCenter, child: Text('place to player')),
          ],
        ));
  }
}
