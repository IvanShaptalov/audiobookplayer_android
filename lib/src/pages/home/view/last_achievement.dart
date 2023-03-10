import 'package:audiobook_player/src/pages/achievements/view/achievements_screen.dart';
import 'package:flutter/material.dart';
import 'package:audiobook_player/src/config/config.dart' show MediaConfig;

class LastAchievementsConfig {
  static const double _minHeight = 75;
  static const double _maxHeight = 76;

  static const double _minWidth = 170;
  static const double _maxWidth = 200;


  static double getDefaultRowHeight(context) {
    double currentHeight = MediaConfig.getmediaHeight(context) / 6;
    return MediaConfig.getNormalSize(
        currentHeight, _minHeight, _maxHeight); //min max size checks
  }

  static double getDefaultRowWidth(context) {
    double currentWidth = MediaConfig.getmediaWidht(context) / 3;
    return MediaConfig.getNormalSize(currentWidth, _minWidth, _maxWidth);
  }

  static LastAchievementsConfig get instance {
    return LastAchievementsConfig();
  }
}


class LastAchievement extends StatelessWidget {
  const LastAchievement({super.key});

  // int result = player.playBytes(audiobytes);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 20.0),
        width: LastAchievementsConfig.getDefaultRowWidth(context),
        height: LastAchievementsConfig.getDefaultRowHeight(context),
        color: const Color.fromARGB(179, 48, 194, 109),
        child: Align(
          alignment: Alignment.centerLeft,
          child: ListTile(
              // Last Achievement
              title: const Text('last achievement'),
              leading: const CircleAvatar(
                // Display the Flutter Logo image asset.
                foregroundImage: AssetImage('assets/images/flutter_logo.png'),
              ),
              onTap: () {
                // Navigate to the details page. If the user leaves and returns to
                // the app after it has been killed while running in the
                // background, the navigation stack is restored.
                Navigator.restorablePushNamed(
                  context,
                  AchievementsList.routeName,
                );
              }),
        ));
  }
}
