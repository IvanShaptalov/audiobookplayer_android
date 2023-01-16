import 'package:audiobook_player/src/config/config.dart';
import 'package:audiobook_player/src/pages/home/home_screen.dart';
import 'package:audiobook_player/src/pages/home/view/player.dart';
import 'package:audiobook_player/src/pages/libpage/library_screen.dart';
import 'package:audiobook_player/src/pages/sample_item.dart';
import 'package:flutter/material.dart';

class TopListeners extends StatelessWidget {
  static const String routeName = '/top_listeners';
  Color setLvlColor(int lvl) {
    switch (lvl) {
      case 1:
        return Color.fromARGB(57, 199, 120, 23);
      case 2:
        return Color.fromARGB(57, 20, 4, 239);
      case 3:
        return Color.fromARGB(57, 27, 15, 208);
      default:
        return Color.fromARGB(57, 255, 255, 255);
    }
  }

  List<Achievement> items = AchievementSource.getAchievements;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Audiobook by parts'),
        ),
        body: Column(
          children: [
            Container(
                height: MediaConfig.getmediaHeight(context) * 0.7,
                child: Scrollbar(
                  scrollbarOrientation: ScrollbarOrientation.right,
                  thumbVisibility: true,
                  child: ListView.builder(
                    // Providing a restorationId allows the ListView to restore the
                    // scroll position when a user leaves and returns to the app after it
                    // has been killed while running in the background.
                    restorationId: 'LibraryItems',
                    scrollDirection: Axis.vertical,
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                      final item = items[index];

                      return Container(
                        margin: EdgeInsets.only(
                            right: 20.0, top: 20.0, bottom: 20.0),
                        width: LibraryConfig.instance
                            .getDefaultElementWidth(context),
                        color: setLvlColor(item.lvl),
                        // ignore: prefer_const_constructors
                        child: Container(
                            width: LibraryConfig.instance
                                .getDefaultRowWidth(context),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: LibraryConfig.instance
                                      .getDefaultElementWidth(context),
                                  child: ListTile(
                                      title: Text('${item.title}',
                                          maxLines:
                                              LibraryConfig.instance.maxLines),
                                      leading: const CircleAvatar(
                                        // Display the Flutter Logo image asset.
                                        foregroundImage: AssetImage(
                                            'assets/images/flutter_logo.png'),
                                      ),
                                      onTap: () {}),
                                ),
                                Text('${item.description}'),
                              ],
                            )),
                      );
                    },
                  ),
                )),
            Container(
                margin: EdgeInsets.only(
                    top: 20,
                    right: MediaConfig.getmediaWidht(context) / 25,
                    left: MediaConfig.getmediaWidht(context) / 25),
                color: setLvlColor(1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: LibraryConfig.instance
                          .getDefaultElementWidth(context),
                      child: ListTile(
                          title: Text('your position',
                              maxLines: LibraryConfig.instance.maxLines),
                          leading: const CircleAvatar(
                            // Display the Flutter Logo image asset.
                            foregroundImage:
                                AssetImage('assets/images/flutter_logo.png'),
                          ),
                          onTap: () {}),
                    ),
                    Text('# 1'),
                  ],
                )),
            Player(),
          ],
        ));
  }
}
