import 'package:audiobook_player/src/config/config.dart';
import 'package:audiobook_player/src/pages/audiobook_expanded/view/audiobook_other_parts.dart';
import 'package:audiobook_player/src/pages/audiobook_expanded/view/edit_part.dart';
import 'package:audiobook_player/src/pages/audiobook_expanded/view/equalizer.dart';
import 'package:audiobook_player/src/pages/audiobook_expanded/view/head.dart';
import 'package:audiobook_player/src/pages/audiobook_expanded/view/part_picture.dart';
import 'package:audiobook_player/src/pages/audiobook_expanded/view/share_part.dart';
import 'package:audiobook_player/src/pages/audiobook_expanded/view/sleep_timer.dart';
import 'package:audiobook_player/src/pages/home/home_page.dart';
import 'package:audiobook_player/src/pages/home/view/home_screen.dart';
import 'package:audiobook_player/src/pages/home/view/player.dart';
import 'package:flutter/material.dart';

import '../../sample_item.dart';

class AudiobookExpConfig {
  final double _minElementWidth = 0;
  final double _maxElementWidth = 500;

  final int _maxLines = 2;

  int get maxLines {
    return _maxLines;
  }

  double getDefaultListHeight(context) {
    return MediaQuery.of(context).size.height * 0.3;
  }

  double getDefaultRowHeight(context) {
    double currentHeight = MediaConfig.getmediaHeight(context) / 10;
    return currentHeight; //min _max size checks
  }

  double getEditColumnHeight(context) {
    return MediaQuery.of(context).size.height / 10;
  }

  double getDefaultElementWidth(context) {
    double currentWidth = MediaConfig.getmediaWidht(context) / 3;
    return MediaConfig.getNormalSize(
        currentWidth, _minElementWidth, _maxElementWidth);
  }

  double getDefaultRowWidth(context) {
    double currentWidth = MediaConfig.getmediaWidht(context) * 0.6;
    return currentWidth;
  }

  static AudiobookExpConfig get instance {
    return AudiobookExpConfig();
  }
}

class AudiobookExpandedScreen extends StatelessWidget {
  const AudiobookExpandedScreen({super.key, required this.audiobookPart});

  final AudiobookItem audiobookPart;

  static const routeName = '/audiobook_expanded';

  @override
  Widget build(BuildContext context) {
    CurrentPlayingMusicConfig.setMusic = audiobookPart.path;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.restorablePushNamed(context, HomePage.routeName);
          },
        ),
        automaticallyImplyLeading: false,
        title: const Text('Audiobook Details'),
      ),
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        AudiobookHead(audiobookPart: audiobookPart),
        PartPicture(audiobookPart: audiobookPart),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: MediaConfig.getmediaHeight(context) * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AudioEqualizer(audiobookPart: audiobookPart),
                  SleepTimer(audiobookPart: audiobookPart),
                  EditPart(audiobookPart: audiobookPart),
                  SharePart(audiobookPart: audiobookPart),
                ],
              ),
            ),
            AudiobookOtherParts(audiobookPart: audiobookPart),
          ],
        ),
        Player()
      ]),
    );
  }
}
