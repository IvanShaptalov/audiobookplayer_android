import 'package:audiobook_player/src/pages/sample_item.dart';
import 'package:flutter/material.dart';

class SleepTimer extends StatelessWidget {
  const SleepTimer({super.key, required this.audiobookPart});

  final AudiobookItem audiobookPart;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [Icon(Icons.timer), Text('Sleep Timer')]);
  }
}
