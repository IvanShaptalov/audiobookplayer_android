import 'package:audiobook_player/src/config/config.dart';
import 'package:audiobook_player/src/pages/home/view/player.dart';
import 'package:audiobook_player/src/pages/home/view/source.dart';
import 'package:audiobook_player/src/pages/sample_item.dart';
import 'package:audiobook_player/src/pages/top_listeners/top_listeners_page.dart';
import 'package:flutter/material.dart';



class AchievementsConfig {
  double _minHeight = 100;
  double _maxHeight = 101;

  double _minWidth = 170;
  double _maxWidth = 200;

  int _maxLines = 2;

  double _minElementWidth = 200;
  double _maxElementWidth = 500;

  int get maxLines {
    return _maxLines;
  }

  double getDefaultElementWidth(context) {
    double currentWidth = MediaConfig.getmediaWidht(context) / 3;
    return MediaConfig.getNormalSize(
        currentWidth, _minElementWidth, _maxElementWidth);
  }

  double getDefaultRowHeight(context) {
    double currentHeight = MediaConfig.getmediaHeight(context) / 6;
    return MediaConfig.getNormalSize(
        currentHeight, _minHeight, _maxHeight); //min _max size checks
  }

  double getDefaultRowWidth(context) {
    double currentWidth = MediaConfig.getmediaWidht(context);
    return currentWidth;
  }

  static AchievementsConfig get instance {
    return AchievementsConfig();
  }
}



class AchievementsList extends StatelessWidget {
  static const String routeName = '/achievement_list';
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
                        width: AchievementsConfig.instance
                            .getDefaultElementWidth(context),
                        color: setLvlColor(item.lvl),
                        // ignore: prefer_const_constructors
                        child: Container(
                            width: AchievementsConfig.instance.getDefaultRowWidth(context),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: AchievementsConfig.instance
                                      .getDefaultElementWidth(context),
                                  child: ListTile(
                                      title: Text('${item.title}',
                                          maxLines:
                                              AchievementsConfig.instance.maxLines),
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
            TextButton(onPressed: () {
              Navigator.restorablePushNamed(context, TopListeners.routeName);
            }, child: Text('Top Listeners')),
            Player(),
          ],
          
        ));
  }
}
