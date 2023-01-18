import 'package:audiobook_player/src/config/config.dart';
import 'package:audiobook_player/src/pages/achievements/view/achievement_item.dart';
import 'package:audiobook_player/src/pages/achievements/view/achievements_screen.dart';
import 'package:audiobook_player/src/pages/sample_item.dart';
import 'package:flutter/material.dart';

class AchievementsWidget extends StatelessWidget {
  List<Achievement> items;

  AchievementsWidget({super.key, required this.items});

  

  @override
  Widget build(BuildContext context) {
    return Container(
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

              return AchievementListItem(item: item);
            },
          ),
        ));
  }
}
