import 'package:audiobook_player/src/config/config.dart';
import 'package:audiobook_player/src/pages/audiobookparts/audiobook_parts.dart';
import 'package:audiobook_player/src/pages/edit_page/edit_page.dart';
import 'package:audiobook_player/src/pages/home/view/player.dart';
import 'package:flutter/material.dart';

import '../sample_item.dart';

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
