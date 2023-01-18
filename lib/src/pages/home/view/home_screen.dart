import 'package:audiobook_player/src/config/config.dart';
import 'package:audiobook_player/src/pages/audiobook_expanded/audibook_expanded.dart';
import 'package:audiobook_player/src/pages/home/view/current_playing.dart';
import 'package:audiobook_player/src/pages/home/view/last_achievement.dart';
import 'package:audiobook_player/src/pages/home/view/recent_listened_audiobooks.dart';
import 'package:audiobook_player/src/pages/home/view/source.dart';
import 'package:flutter/material.dart';
import 'package:audiobook_player/src/pages/sample_item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
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
          children: [
            LastAchievement(),
            // child: LastAchievement()
            CurrentPlayingBook(),
          ],
        ),
      ],
    );
  }
}
