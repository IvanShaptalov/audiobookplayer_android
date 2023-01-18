import 'package:audiobook_player/src/config/config.dart' show MediaConfig;
import 'package:audiobook_player/src/pages/sample_item.dart';
import 'package:flutter/material.dart';

import '../audiobook_expanded/view/audibook_expanded_screen.dart';

class AudiobooksPartsConfig {
  final double _minHeight = 100;
  final double _maxHeight = 101;


  final int _maxLines = 2;

  final double _minElementWidth = 200;
  final double _maxElementWidth = 500;

  int get maxLines {
    return _maxLines;
  }

  double getDefaultRowWidth(context) {
    double currentWidth = MediaConfig.getmediaWidht(context) * 0.6;
    return currentWidth;
  }

  double getDefaultElementWidth(context) {
    double currentWidth = MediaConfig.getmediaWidht(context) / 3;
    return MediaConfig.getNormalSize(
        currentWidth, _minElementWidth, _maxElementWidth);
  }

  double getDefaultListHeight(context){
    return MediaQuery.of(context).size.height * 0.3;
  }

  double getDefaultRowHeight(context) {
    double currentHeight = MediaConfig.getmediaHeight(context) / 6;
    return MediaConfig.getNormalSize(
        currentHeight, _minHeight, _maxHeight); //min _max size checks
  }

  static AudiobooksPartsConfig get instance {
    return AudiobooksPartsConfig();
  }
}

class AudiobookParts extends StatelessWidget {
  const AudiobookParts({super.key, required this.audiobook});

  final AudiobookPlaylistItem audiobook;

  static const routeName = '/audiobook_parts';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Audiobook by parts'),
        ),
        body: AudiobookPartsWidget(
            audiobook: audiobook,
            configObj: AudiobooksPartsConfig.instance));
  }
}

// ignore: must_be_immutable
class AudiobookPartsWidget extends StatelessWidget {
  AudiobookPartsWidget(
      {super.key, required this.audiobook, required this.configObj});

  final AudiobookPlaylistItem audiobook;
  dynamic configObj;
  @override
  Widget build(BuildContext context) {
    dynamic items = audiobook.parts;

    return SizedBox(
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
                margin: const EdgeInsets.only(right: 20.0, top: 20.0, bottom: 20.0),
                width: configObj.getDefaultElementWidth(context),
                color: const Color.fromARGB(57, 122, 205, 130),
                // ignore: prefer_const_constructors
                child: SizedBox(
                    width: configObj.getDefaultRowWidth(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
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
                                        AudiobookExpandedScreen(audiobookPart: item),
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
