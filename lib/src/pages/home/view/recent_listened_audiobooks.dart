import 'package:audiobook_player/src/config/config.dart';
import 'package:audiobook_player/src/pages/audiobook_expanded/audibook_expanded.dart';
import 'package:audiobook_player/src/pages/home/view/source.dart';
import 'package:audiobook_player/src/pages/sample_item.dart';
import 'package:flutter/material.dart';

class RecentListenedAudiobooks extends StatelessWidget {
  late AudiobookPlaylistItem playlist;

  @override
  Widget build(BuildContext context) {
    playlist = AudiobookSource.getAudiobooks.first;

    return Column(children: [
      Container(
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
                  margin: EdgeInsets.symmetric(vertical: 20.0),
                  width: RecentAudiobooksConfig.getDefaultElementWidth(context),
                  color: Color.fromARGB(179, 48, 194, 109),
                  // ignore: prefer_const_constructors
                  child: Align(
                      alignment: Alignment.center,
                      child: ListTile(
                          title: Text('${item.title}',
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
                                    AudiobookExpanded(audiobookPart: item),
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
