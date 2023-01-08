import 'package:audiobook_player/src/config/config.dart';
import 'package:audiobook_player/src/pages/home/view/current_playing.dart';
import 'package:audiobook_player/src/pages/home/view/last_achievement.dart';
import 'package:flutter/material.dart';
import '../sample_item.dart';
import 'view/sample_item_details_view.dart';

/// Displays a list of SampleItems.
class SampleItemListView extends StatelessWidget {
  const SampleItemListView({
    super.key,
    this.items = const [
      SampleItem(1, 'Audiobooks1'),
      SampleItem(2, 'Audiobook2'),
      SampleItem(3, 'Audiobook3'),
      SampleItem(4, 'Audiobook4'),
      SampleItem(5, 'Audiobook5'),
      SampleItem(6, 'Audiobook6'),
      SampleItem(7, 'Audiobook7'),
    ],
  });

  final List<SampleItem> items;

  @override
  Widget build(BuildContext context) {
    
    
    return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
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
                      itemCount: items.length,
                      itemBuilder: (BuildContext context, int index) {
                        final item = items[index];

                        return Container(
                            margin: EdgeInsets.symmetric(vertical: 20.0),
                            width: RecentAudiobooksConfig.getDefaultElementWidth(context),
                            color: Color.fromARGB(179, 48, 194, 109),
                            // ignore: prefer_const_constructors
                            child: Align(
                                alignment: Alignment.center,
                                child: ListTile(
                                    title: Text('${item.title}', maxLines: RecentAudiobooksConfig.maxLines),
                                    leading: const CircleAvatar(
                                      // Display the Flutter Logo image asset.
                                      foregroundImage: AssetImage(
                                          'assets/images/flutter_logo.png'),
                                    ),
                                    onTap: () {
                                      // Navigate to the details page. If the user leaves and returns to
                                      // the app after it has been killed while running in the
                                      // background, the navigation stack is restored.
                                      Navigator.restorablePushNamed(
                                        context,
                                        SampleItemDetailsView.routeName,
                                      );
                                    })));
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LastAchievement(),
                            // child: LastAchievement()
                    CurrentPlayingBook(),
                  ],
                ),
              ],
            ),
          ],
        );
  }
}
