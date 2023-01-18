import 'package:audiobook_player/src/pages/home/view/current_playing.dart';
import 'package:audiobook_player/src/pages/home/view/last_achievement.dart';
import 'package:audiobook_player/src/pages/home/view/recent_listened_audiobooks.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RecentListenedAudiobooks(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            LastAchievement(),
            // child: LastAchievement()
            CurrentPlayingBook(),
          ],
        ),
      ],
    );
  }
}
