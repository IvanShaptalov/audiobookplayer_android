import 'package:audiobook_player/src/pages/audiobookparts/audiobook_parts.dart';
import 'package:audiobook_player/src/pages/home/home_screen.dart';
import 'package:flutter/material.dart';

import '../../config/config.dart';
import '../sample_item.dart';

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
                  width: RecentAudiobooksConfig.getDefaultElementWidth(context),
                  color: const Color.fromARGB(57, 122, 205, 130),
                  // ignore: prefer_const_constructors
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: LibraryConfig.getDefaultElementWidth(context),
                        child: ListTile(
                            title: Text('${item.title}',
                                maxLines: LibraryConfig.maxLines),
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
