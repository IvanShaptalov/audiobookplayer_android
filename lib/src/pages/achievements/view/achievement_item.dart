import 'package:audiobook_player/src/extensions.dart';
import 'package:audiobook_player/src/pages/achievements/view/achievements_screen.dart';
import 'package:audiobook_player/src/pages/sample_item.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AchievementListItem extends StatelessWidget {
  Achievement item;

  AchievementListItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20.0, top: 20.0, bottom: 20.0),
      width: AchievementsConfig.instance.getDefaultElementWidth(context),
      color: Extensions.setLvlColor(item.lvl),
      // ignore: prefer_const_constructors
      child: SizedBox(
          width: AchievementsConfig.instance.getDefaultRowWidth(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width:
                    AchievementsConfig.instance.getDefaultElementWidth(context),
                child: ListTile(
                    title: Text(item.title,
                        maxLines: AchievementsConfig.instance.maxLines),
                    leading: const CircleAvatar(
                      // Display the Flutter Logo image asset.
                      foregroundImage:
                          AssetImage('assets/images/flutter_logo.png'),
                    ),
                    onTap: () {}),
              ),
              Text(item.description),
            ],
          )),
    );
  }
}
