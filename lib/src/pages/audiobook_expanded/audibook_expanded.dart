import 'package:flutter/material.dart';

import '../sample_item.dart';
class AudiobookExpanded extends StatelessWidget {
 AudiobookExpanded({super.key,required this.audiobook});

  final AudiobookPlaylistItem audiobook;

  static const routeName = '/audiobook_expanded';

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}