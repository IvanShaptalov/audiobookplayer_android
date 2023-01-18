import 'package:audiobook_player/src/config/config.dart';
import 'package:audiobook_player/src/pages/audiobook_expanded/view/audibook_expanded_screen.dart';
import 'package:audiobook_player/src/pages/audiobookparts/audiobook_parts.dart';
import 'package:audiobook_player/src/pages/sample_item.dart';
import 'package:flutter/material.dart';
class AudiobookOtherParts extends StatelessWidget {

  const AudiobookOtherParts({super.key, required this.audiobookPart});

  final AudiobookItem audiobookPart;
  
  @override
  Widget build(BuildContext context) {
    return Column(
              children: [
                SizedBox(
                    height: MediaConfig.getmediaHeight(context) * 0.5,
                    width:
                        AudiobookExpConfig.instance.getDefaultRowWidth(context),
                    child: AudiobookPartsWidget(
                        audiobook: audiobookPart.parent,
                        configObj: AudiobookExpConfig.instance))
              ],
            );
  }
}