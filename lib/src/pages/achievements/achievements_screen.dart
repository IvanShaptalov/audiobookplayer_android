import 'package:audiobook_player/src/config/config.dart';
import 'package:audiobook_player/src/pages/achievements/achievements_list.dart';
import 'package:audiobook_player/src/pages/achievements/top_listeners_link.dart';
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

  List<Achievement> items = AchievementSource.getAchievements;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Audiobook by parts'),
        ),
        body: Column(
          children: [
            AchievementsWidget(items: items),
            TopListenersLink(),
            Player(),
          ],
        ));
  }
}
