import 'package:audiobook_player/src/config/config.dart' show MediaConfig;
import 'package:audiobook_player/src/pages/audiobookparts/audiobook_parts.dart';
import 'package:audiobook_player/src/pages/home/view/source.dart';
import 'package:audiobook_player/src/pages/libpage/lib_audiobooks.dart';
import 'package:audiobook_player/src/pages/sample_item.dart';
import 'package:flutter/material.dart';

class LibraryConfig {
  double _minHeight = 100;
  double _maxHeight = 101;

  double _minWidth = 170;
  double _maxWidth = 200;

  int _maxLines = 2;

  double _minElementWidth = 200;
  double _maxElementWidth = 500;

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

    return Container(
        height: MediaQuery.of(context).size.height * 0.6,
        child: LibAudiobooks(items: items));
  }
}
