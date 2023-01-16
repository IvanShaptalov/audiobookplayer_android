import 'package:audiobook_player/src/config/config.dart';
import 'package:audiobook_player/src/pages/audiobook_expanded/audibook_expanded.dart';
import 'package:audiobook_player/src/pages/home/view/current_playing.dart';
import 'package:audiobook_player/src/pages/home/view/last_achievement.dart';
import 'package:flutter/material.dart';
import '../sample_item.dart';
import 'view/sample_item_details_view.dart';

class AchievementSource {
  static List<Achievement> get getAchievements {
    Achievement ach1 = Achievement(1, 'ahchievement1', 'desc_of_achievement1', true, 1);
    Achievement ach2 = Achievement(2, 'ahchievement2', 'desc_of_achievement2', false, 1);
    Achievement ach3 = Achievement(3, 'ahchievement3', 'desc_of_achievement3', true, 1);
    Achievement ach4 = Achievement(4, 'ahchievement4', 'desc_of_achievement4', true, 2);
    Achievement ach5 = Achievement(5, 'ahchievement5', 'desc_of_achievement5', false, 2);
    Achievement ach6 = Achievement(6, 'ahchievement6', 'desc_of_achievement6', true, 3);
    Achievement ach7 = Achievement(7, 'ahchievement7', 'desc_of_achievement7', false, 3);
    return [ach1, ach2, ach3, ach4, ach5, ach6, ach7];
  }
}

class AudiobookSource {
  static List<AudiobookPlaylistItem> get getAudiobooks {
    AudiobookPlaylistItem theWitcherLastWish =
        AudiobookPlaylistItem(1, 'The witcher, Last Wish', null);
    theWitcherLastWish.parts = [
      AudiobookItem(1, 'Part 0', theWitcherLastWish),
      AudiobookItem(2, 'Part1', theWitcherLastWish),
      AudiobookItem(3, 'Part2', theWitcherLastWish),
      AudiobookItem(4, 'Part3', theWitcherLastWish),
      AudiobookItem(5, 'Part4', theWitcherLastWish),
      AudiobookItem(6, 'Part5', theWitcherLastWish),
      AudiobookItem(7, 'Part6', theWitcherLastWish),
    ];

    AudiobookPlaylistItem theWitcherBloodOfElves =
        AudiobookPlaylistItem(1, 'The witcher, Blood of elves', null);
    theWitcherBloodOfElves.parts = [
      AudiobookItem(1, 'Part0', theWitcherBloodOfElves),
      AudiobookItem(2, 'Part1', theWitcherBloodOfElves),
      AudiobookItem(3, 'Part2', theWitcherBloodOfElves),
      AudiobookItem(4, 'Part3', theWitcherBloodOfElves),
      AudiobookItem(4, 'Part4', theWitcherBloodOfElves),
      AudiobookItem(4, 'Part5', theWitcherBloodOfElves),
      AudiobookItem(4, 'Part6', theWitcherBloodOfElves),
      AudiobookItem(5, 'Part7', theWitcherBloodOfElves),
      AudiobookItem(6, 'Part8', theWitcherBloodOfElves),
      AudiobookItem(7, 'Part9', theWitcherBloodOfElves),
    ];

    AudiobookPlaylistItem whisperer =
        AudiobookPlaylistItem(1, 'The whisperer in darkness', null);
    whisperer.parts = [
      AudiobookItem(1, 'Part0', whisperer),
      AudiobookItem(2, 'Part1', whisperer),
      AudiobookItem(3, 'Part2', whisperer),
      AudiobookItem(4, 'Part3', whisperer),
      AudiobookItem(5, 'Part4', whisperer),
      AudiobookItem(6, 'Part5', whisperer),
      AudiobookItem(6, 'Part6', whisperer),
      AudiobookItem(6, 'Part7', whisperer),
      AudiobookItem(6, 'Part8', whisperer),
      AudiobookItem(7, 'Part9', whisperer),
    ];

    AudiobookPlaylistItem sample1 = AudiobookPlaylistItem(1, 'sample1', null);
    sample1.parts = [
      AudiobookItem(1, 'Part0', sample1),
      AudiobookItem(2, 'Part1', sample1),
      AudiobookItem(3, 'Part2', sample1),
      AudiobookItem(4, 'Part3', sample1),
      AudiobookItem(5, 'Part4', sample1),
      AudiobookItem(6, 'Part5', sample1),
      AudiobookItem(7, 'Part6', sample1),
    ];

    return [theWitcherLastWish, theWitcherBloodOfElves, whisperer, sample1];
  }
}

class SampleItemListView extends StatelessWidget {
  SampleItemListView({
    super.key,
  });

  late AudiobookPlaylistItem playlist;

  @override
  Widget build(BuildContext context) {
    playlist = AudiobookSource.getAudiobooks.first;
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
                  itemCount: playlist.parts!.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = playlist.parts![index];

                    return Container(
                        margin: EdgeInsets.symmetric(vertical: 20.0),
                        width: RecentAudiobooksConfig.getDefaultElementWidth(
                            context),
                        color: Color.fromARGB(179, 48, 194, 109),
                        // ignore: prefer_const_constructors
                        child: Align(
                            alignment: Alignment.center,
                            child: ListTile(
                                title: Text('${item.title}',
                                    maxLines: RecentAudiobooksConfig.maxLines),
                                leading: const CircleAvatar(
                                  // Display the Flutter Logo image asset.
                                  foregroundImage: AssetImage(
                                      'assets/images/flutter_logo.png'),
                                ),
                                onTap: () {
                                  // Navigate to the details page. If the user leaves and returns to
                                  // the app after it has been killed while running in the
                                  // background, the navigation stack is restored.
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AudiobookExpanded(
                                          audiobookPart: item),
                                    ),
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
