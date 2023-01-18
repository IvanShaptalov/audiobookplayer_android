import 'package:audiobook_player/src/pages/sample_item.dart';
import 'package:flutter/material.dart';

class SharePart extends StatelessWidget {
  const SharePart({super.key, required this.audiobookPart});

  final AudiobookItem audiobookPart;

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: [const Icon(Icons.share), const Text('Share')]);
  }
}
