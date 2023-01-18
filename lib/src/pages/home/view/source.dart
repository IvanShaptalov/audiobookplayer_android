import 'package:audiobook_player/src/pages/sample_item.dart';



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