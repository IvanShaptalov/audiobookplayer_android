import 'package:audiobook_player/src/config/config.dart' show MediaConfig;
import 'package:audiobook_player/src/pages/audiobookparts/audiobook_parts.dart';
import 'package:audiobook_player/src/pages/home/view/source.dart';
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
        child: Scrollbar(
          scrollbarOrientation: ScrollbarOrientation.right,
          thumbVisibility: true,
          child: ListView.builder(
            // Providing a restorationId allows the ListView to restore the
            // scroll position when a user leaves and returns to the app after it
            // has been killed while running in the background.
            restorationId: 'LibraryItems',
            scrollDirection: Axis.vertical,
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              final item = items[index];

              return Container(
                  margin: EdgeInsets.only(right: 20.0, top: 20.0, bottom: 20.0),
                  width: LibraryConfig.instance.getDefaultElementWidth(context),
                  color: const Color.fromARGB(57, 122, 205, 130),
                  // ignore: prefer_const_constructors
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: LibraryConfig.instance
                            .getDefaultElementWidth(context),
                        child: ListTile(
                            title: Text('${item.title}',
                                maxLines: LibraryConfig.instance.maxLines),
                            leading: const CircleAvatar(
                              // Display the Flutter Logo image asset.
                              foregroundImage:
                                  AssetImage('assets/images/flutter_logo.png'),
                            ),
                            onTap: () {
                              print("clicked");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AudiobookParts(audiobook: item),
                                ),
                              );
                            }),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.drag_handle)),
                      IconButton(
                          alignment: Alignment.centerRight,
                          onPressed: () {},
                          icon: const Icon(Icons.more_vert)),
                    ],
                  ));
            },
          ),
        ));
  }
}
