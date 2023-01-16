import 'package:audiobook_player/src/config/config.dart';
import 'package:audiobook_player/src/pages/home/home_screen.dart';
import 'package:audiobook_player/src/pages/libpage/library_screen.dart';
import 'package:audiobook_player/src/pages/sample_item.dart';
import 'package:flutter/material.dart';

class AchievementsList extends StatelessWidget {
  static const String routeName = 'achievementList';
  Color setLvlColor(int lvl) {
    switch (lvl) {
      case 1:
        return Color.fromARGB(57, 122, 205, 130);
      case 2:
        return Color.fromARGB(57, 49, 76, 197);
      case 3:
        return Color.fromARGB(57, 190, 33, 193);
      default:
        return Color.fromARGB(57, 122, 205, 130);
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
            TextButton(onPressed: () {}, child: Text('Top Listeners'))
          ],
        ));
  }
}
