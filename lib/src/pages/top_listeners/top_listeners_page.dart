// ignore_for_file: must_be_immutable

import 'package:audiobook_player/src/config/config.dart';
import 'package:audiobook_player/src/pages/home/view/player.dart';
import 'package:audiobook_player/src/pages/sample_item.dart';
import 'package:flutter/material.dart';

import 'package:audiobook_player/src/pages/home/view/source.dart';

class TopListenersConfig {
  final double _minHeight = 100;
  final double _maxHeight = 101;


  final int _maxLines = 2;

  final double _minElementWidth = 200;
  final double _maxElementWidth = 500;

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

  static TopListenersConfig get instance {
    return TopListenersConfig();
  }
}



class TopListeners extends StatelessWidget {
  static const String routeName = '/top_listeners';

  TopListeners({super.key});
  Color setLvlColor(int lvl) {
    switch (lvl) {
      case 1:
        return const Color.fromARGB(57, 199, 120, 23);
      case 2:
        return const Color.fromARGB(57, 20, 4, 239);
      case 3:
        return const Color.fromARGB(57, 27, 15, 208);
      default:
        return const Color.fromARGB(57, 255, 255, 255);
    }
  }

  List<Achievement> items = AchievementSource.getAchievements;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Audiobook by parts'),
        ),
        body: Column(
          children: [
            SizedBox(
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
                        margin: const EdgeInsets.only(
                            right: 20.0, top: 20.0, bottom: 20.0),
                        width: TopListenersConfig.instance
                            .getDefaultElementWidth(context),
                        color: setLvlColor(item.lvl),
                        // ignore: prefer_const_constructors
                        child: SizedBox(
                            width: TopListenersConfig.instance
                                .getDefaultRowWidth(context),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: TopListenersConfig.instance
                                      .getDefaultElementWidth(context),
                                  child: ListTile(
                                      title: Text(item.title,
                                          maxLines:
                                              TopListenersConfig.instance.maxLines),
                                      leading: const CircleAvatar(
                                        // Display the Flutter Logo image asset.
                                        foregroundImage: AssetImage(
                                            'assets/images/flutter_logo.png'),
                                      ),
                                      onTap: () {}),
                                ),
                                Text(item.description),
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
                    SizedBox(
                      width: TopListenersConfig.instance
                          .getDefaultElementWidth(context),
                      child: ListTile(
                          title: Text('your position',
                              maxLines: TopListenersConfig.instance.maxLines),
                          leading: const CircleAvatar(
                            // Display the Flutter Logo image asset.
                            foregroundImage:
                                AssetImage('assets/images/flutter_logo.png'),
                          ),
                          onTap: () {}),
                    ),
                    const Text('# 1'),
                  ],
                )),
            Player(),
          ],
        ));
  }
}
