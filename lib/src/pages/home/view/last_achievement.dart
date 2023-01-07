import 'package:audiobook_player/src/config/config.dart';
import 'package:flutter/material.dart';

import '../../sample_item_details_view.dart';

class LastAchievement extends StatelessWidget {
  // int result = player.playBytes(audiobytes);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        width: LastAchievementsConfig.getDefaultRowWidth(context),
        height: LastAchievementsConfig.getDefaultRowHeight(context),
        color: Color.fromARGB(179, 48, 194, 109),
        child: Align(
          alignment: Alignment.centerLeft,
          child: ListTile(
              // Last Achievement
              title: Text('last achievement'),
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
                  SampleItemDetailsView.routeName,
                );
              }),
        ));
  }
}
