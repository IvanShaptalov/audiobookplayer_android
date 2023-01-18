import 'package:flutter/material.dart';

import '../audiobookparts/audiobook_parts.dart';
import '../sample_item.dart';
import 'library_screen.dart';

class LibAudiobooks extends StatelessWidget {
  final List<AudiobookPlaylistItem> items;

  const LibAudiobooks({super.key, required this.items});

  

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
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
                    width:
                        LibraryConfig.instance.getDefaultElementWidth(context),
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
                      onPressed: () {}, icon: const Icon(Icons.drag_handle)),
                  IconButton(
                      alignment: Alignment.centerRight,
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert)),
                ],
              ));
        },
      ),
    );
  }
}
