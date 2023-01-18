import 'package:audiobook_player/src/config/config.dart';
import 'package:audiobook_player/src/pages/audiobook_expanded/view/audibook_expanded_screen.dart';
import 'package:audiobook_player/src/pages/audiobookparts/audiobook_parts.dart';
import 'package:audiobook_player/src/pages/sample_item.dart';
import 'package:flutter/material.dart';

class AudioEqualizer extends StatelessWidget {
  AudioEqualizer({super.key, required this.audiobookPart});

  final AudiobookItem audiobookPart;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(alignment: Alignment.centerLeft, child: Icon(Icons.equalizer)),
      Text('Equalizer')
    ]);
  }
}
