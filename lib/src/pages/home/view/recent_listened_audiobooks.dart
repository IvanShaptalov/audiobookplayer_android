// ignore_for_file: must_be_immutable

import 'package:audiobook_player/src/config/config.dart' show MediaConfig;
import 'package:audiobook_player/src/pages/audiobook_expanded/view/audibook_expanded_screen.dart';
import 'package:audiobook_player/src/pages/home/view/source.dart';
import 'package:audiobook_player/src/pages/libpage/view/library_screen.dart';
import 'package:audiobook_player/src/pages/sample_item.dart';
import 'package:flutter/material.dart';

class RecentAudiobooksConfig {
  static const double _minHeight = 100;
  static const double _maxHeight = 101;

  static const double _minWidth = 170;
  static const double _maxWidth = 200;

  static const int _maxLines = 1;

  static int get maxLines {
    return _maxLines;
  }

  static double getDefaultRowHeight(context) {
    double currentHeight = MediaConfig.getmediaHeight(context) / 6;
    return MediaConfig.getNormalSize(
        currentHeight, _minHeight, _maxHeight); //min _max size checks
  }

  static double getDefaultElementWidth(context) {
    double currentWidth = MediaConfig.getmediaWidht(context) / 3;
    return MediaConfig.getNormalSize(currentWidth, _minWidth, _maxWidth);
  }

  static LibraryConfig get instance {
    return LibraryConfig();
  }
}

class RecentListenedAudiobooks extends StatelessWidget {
  late AudiobookPlaylistItem playlist;

  RecentListenedAudiobooks({super.key});

  @override
  Widget build(BuildContext context) {
    playlist = AudiobookSource.getAudiobooks.first;

    return Column(children: [
      SizedBox(
        height: RecentAudiobooksConfig.getDefaultRowHeight(context),
        child: Scrollbar(
          scrollbarOrientation: ScrollbarOrientation.bottom,
          thumbVisibility: true,
          child: ListView.builder(
            // Providing a restorationId allows the ListView to restore the
            // scroll position when a user leaves and returns to the app after it
            // has been killed while running in the background.
            restorationId: 'sampleItemListView',
            scrollDirection: Axis.horizontal,
            itemCount: playlist.parts!.length,
            itemBuilder: (BuildContext context, int index) {
              final item = playlist.parts![index];

              return Container(
                  margin: const EdgeInsets.symmetric(vertical: 20.0),
                  width: RecentAudiobooksConfig.getDefaultElementWidth(context),
                  color: const Color.fromARGB(179, 48, 194, 109),
                  // ignore: prefer_const_constructors
                  child: Align(
                      alignment: Alignment.center,
                      child: ListTile(
                          title: Text(item.title,
                              maxLines: RecentAudiobooksConfig.maxLines),
                          leading: const CircleAvatar(
                            // Display the Flutter Logo image asset.
                            foregroundImage:
                                AssetImage('assets/images/flutter_logo.png'),
                          ),
                          onTap: () {
                            // Navigate to the details page. If the user leaves and returns to
                            // the app after it has been killed while running in the
                            // background, the navigation stack is restored.
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    AudiobookExpandedScreen(audiobookPart: item),
                              ),
                            );
                          })));
            },
          ),
        ),
      ),
    ]);
  }
}
