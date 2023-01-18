import 'package:audiobook_player/src/pages/sample_item.dart';
import 'package:flutter/material.dart';
class AudiobookHead extends StatelessWidget {

  const AudiobookHead({super.key, required this.audiobookPart});

  final AudiobookItem audiobookPart;
  @override
  Widget build(BuildContext context) {
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${audiobookPart.parent.title}: ${audiobookPart.title}'),
            const Text('01 space')
          ],
        );
  }
}