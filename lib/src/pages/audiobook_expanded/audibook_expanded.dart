import 'package:audiobook_player/src/config/config.dart' show MediaConfig;
import 'package:audiobook_player/src/pages/audiobookparts/audiobook_parts.dart';
import 'package:audiobook_player/src/pages/edit_page/edit_page.dart';
import 'package:audiobook_player/src/pages/home/view/player.dart';
import 'package:flutter/material.dart';

import '../sample_item.dart';


class AudiobookExpConfig {
  double _minHeight = 0;
  double _maxHeight = 150;

  double _minElementWidth = 0;
  double _maxElementWidth = 500;

  int _maxLines = 2;

  int get maxLines {
    return _maxLines;
  }

  double getDefaultListHeight(context){
    return MediaQuery.of(context).size.height * 0.3;
  }

  double getDefaultRowHeight(context) {
    double currentHeight = MediaConfig.getmediaHeight(context) / 10;
    return currentHeight;//min _max size checks
  }

  double getEditColumnHeight(context) {
    return MediaQuery.of(context).size.height / 10;
  }

  double getDefaultElementWidth(context) {
    double currentWidth = MediaConfig.getmediaWidht(context) / 3;
    return MediaConfig.getNormalSize(currentWidth, _minElementWidth, _maxElementWidth);
  }

  double getDefaultRowWidth(context) {
    double currentWidth = MediaConfig.getmediaWidht(context) * 0.6;
    return currentWidth;
  }

  static AudiobookExpConfig get instance {
    return AudiobookExpConfig();
  }


}


class AudiobookExpanded extends StatelessWidget {
  AudiobookExpanded({super.key, required this.audiobookPart});

  final AudiobookItem audiobookPart;

  static const routeName = '/audiobook_expanded';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audiobook Details'),
      ),
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${audiobookPart.parent.title}: ${audiobookPart.title}'),
            Text('01 space')
          ],
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Icon(Icons.image), Icon(Icons.star)]),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: MediaConfig.getmediaHeight(context) * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Icon(Icons.equalizer)),
                    Text('Equalizer')
                  ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Icon(Icons.timer), Text('Sleep Timer')]),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                EditPage(audiobookPart: audiobookPart),
                          ),
                        );
                      },
                    ),
                    const Text('Edit')
                  ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Icon(Icons.share), Text('Share')]),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                    height: MediaConfig.getmediaHeight(context) * 0.5,
                    width:
                        AudiobookExpConfig.instance.getDefaultRowWidth(context),
                    child: AudiobookPartsWidget(
                        audiobook: audiobookPart.parent,
                        configObj: AudiobookExpConfig.instance))
              ],
            )
          ],
        ),
        Player()
      ]),
    );
  }
}
