import 'package:audiobook_player/src/pages/sample_item.dart';
import 'package:flutter/material.dart';

class AudioEqualizer extends StatelessWidget {
  const AudioEqualizer({super.key, required this.audiobookPart});

  final AudiobookItem audiobookPart;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(alignment: Alignment.centerLeft, child: const Icon(Icons.equalizer)),
      const Text('Equalizer')
    ]);
  }
}
