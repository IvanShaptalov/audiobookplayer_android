import 'package:audiobook_player/src/pages/sample_item.dart';
import 'package:flutter/material.dart';

import '../../config/config.dart';
import '../audiobook_expanded/audibook_expanded.dart';

class AudiobookParts extends StatelessWidget {
  AudiobookParts({super.key, required this.audiobook});

  final AudiobookPlaylistItem audiobook;

  static const routeName = '/audiobook_parts';

  @override
  Widget build(BuildContext context) {
    dynamic items = audiobook.parts;
    return Scaffold(
        appBar: AppBar(
          title: Text('Audiobook by parts'),
        ),
        body: Container(
            child: AudiobookPartsWidget(
                audiobook: audiobook, configObj: LibraryConfig.instance)));
  }
}

class AudiobookPartsWidget extends StatelessWidget {
  AudiobookPartsWidget(
      {super.key, required this.audiobook, required this.configObj});

  final AudiobookPlaylistItem audiobook;
  dynamic configObj;
  @override
  Widget build(BuildContext context) {
    dynamic items = audiobook.parts;

    return Container(
        height: configObj.getDefaultListHeight(context),
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
                width: configObj.getDefaultElementWidth(context),
                color: const Color.fromARGB(57, 122, 205, 130),
                // ignore: prefer_const_constructors
                child: Container(
                    width: configObj.getDefaultRowWidth(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: configObj.getDefaultElementWidth(context),
                          child: ListTile(
                              title: Text('${audiobook.title}:${item.title}',
                                  maxLines: configObj.maxLines),
                              leading: const CircleAvatar(
                                // Display the Flutter Logo image asset.
                                foregroundImage: AssetImage(
                                    'assets/images/flutter_logo.png'),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        AudiobookExpanded(audiobookPart: item),
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
                    )),
              );
            },
          ),
        ));
  }
}
