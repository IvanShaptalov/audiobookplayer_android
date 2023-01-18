import 'package:audiobook_player/src/extensions.dart';
import 'package:audiobook_player/src/pages/achievements/view/achievements_screen.dart';
import 'package:audiobook_player/src/pages/sample_item.dart';
import 'package:flutter/material.dart';

class AchievementListItem extends StatelessWidget {
  Achievement item;

  AchievementListItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20.0, top: 20.0, bottom: 20.0),
      width: AchievementsConfig.instance.getDefaultElementWidth(context),
      color: Extensions.setLvlColor(item.lvl),
      // ignore: prefer_const_constructors
      child: Container(
          width: AchievementsConfig.instance.getDefaultRowWidth(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width:
                    AchievementsConfig.instance.getDefaultElementWidth(context),
                child: ListTile(
                    title: Text('${item.title}',
                        maxLines: AchievementsConfig.instance.maxLines),
                    leading: const CircleAvatar(
                      // Display the Flutter Logo image asset.
                      foregroundImage:
                          AssetImage('assets/images/flutter_logo.png'),
                    ),
                    onTap: () {}),
              ),
              Text('${item.description}'),
            ],
          )),
    );
  }
}
