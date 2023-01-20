// ignore_for_file: must_be_immutable

import 'package:audiobook_player/src/config/config.dart' show MediaConfig;
import 'package:audiobook_player/src/pages/home/view/source.dart';
import 'package:audiobook_player/src/pages/libpage/view/lib_audiobooks.dart';
import 'package:audiobook_player/src/pages/sample_item.dart';
import 'package:flutter/material.dart';

class LibraryConfig {
  final double _minHeight = 100;
  final double _maxHeight = 101;


  final int _maxLines = 2;

  final double _minElementWidth = 200;
  final double _maxElementWidth = 500;

  int get maxLines {
    return _maxLines;
  }

  double getDefaultElementWidth(context) {
    double currentWidth = MediaConfig.getmediaWidht(context) / 3;
    return MediaConfig.getNormalSize(
        currentWidth, _minElementWidth, _maxElementWidth);
  }

  double getDefaultRowHeight(context) {
    double currentHeight = MediaConfig.getmediaHeight(context) / 6;
    return MediaConfig.getNormalSize(
        currentHeight, _minHeight, _maxHeight); //min _max size checks
  }

  static LibraryConfig get instance {
    return LibraryConfig();
  }
}

class Library extends StatelessWidget {
  Library({
    super.key,
  });

  late List<AudiobookPlaylistItem> items;

  @override
  Widget build(BuildContext context) {
    items = AudiobookSource.getAudiobooks;

    return SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        child: LibAudiobooks(items: items));
  }

  
}
