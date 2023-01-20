import 'package:audiobook_player/src/config/config.dart';
import 'package:audiobook_player/src/pages/sample_item.dart';
import 'package:flutter/gestures.dart';

class AchievementSource {
  static List<Achievement> get getAchievements {
    Achievement ach1 =
        Achievement(1, 'ahchievement1', 'desc_of_achievement1', true, 1);
    Achievement ach2 =
        Achievement(2, 'ahchievement2', 'desc_of_achievement2', false, 1);
    Achievement ach3 =
        Achievement(3, 'ahchievement3', 'desc_of_achievement3', true, 1);
    Achievement ach4 =
        Achievement(4, 'ahchievement4', 'desc_of_achievement4', true, 2);
    Achievement ach5 =
        Achievement(5, 'ahchievement5', 'desc_of_achievement5', false, 2);
    Achievement ach6 =
        Achievement(6, 'ahchievement6', 'desc_of_achievement6', true, 3);
    Achievement ach7 =
        Achievement(7, 'ahchievement7', 'desc_of_achievement7', false, 3);
    return [ach1, ach2, ach3, ach4, ach5, ach6, ach7];
  }
}

class AudiobookSource {
  static List<AudiobookPlaylistItem> get getAudiobooks {
    String audiobookFolder = AudiobookLoadingConfig.getAudiobookFolderPath;
    print('audiobooks folder in path: $audiobookFolder');

    var files =
        AudiobookLoadingConfig.loadAudiobooksFromFolder(audiobookFolder);

    var loadedAudiobooks =
        AudiobookLoadingConfig.convertAudiobooksFromFiles(files);

    AudiobookPlaylistItem theWitcherBloodOfElves =
        AudiobookPlaylistItem(1, 'The witcher, Blood of elves', null);
    theWitcherBloodOfElves.parts = [
      AudiobookItem("1", 'Part0', theWitcherBloodOfElves, 'assets/audio/red-indian-music.mp3'),
      AudiobookItem("2", 'Part1', theWitcherBloodOfElves, 'assets/audio/red-indian-music.mp3'),
      AudiobookItem("3", 'Part2', theWitcherBloodOfElves, 'assets/audio/red-indian-music.mp3'),
      AudiobookItem("4", 'Part3', theWitcherBloodOfElves, 'assets/audio/red-indian-music.mp3'),
      AudiobookItem("4", 'Part4', theWitcherBloodOfElves, 'assets/audio/red-indian-music.mp3'),
      AudiobookItem("4", 'Part5', theWitcherBloodOfElves, 'assets/audio/red-indian-music.mp3'),
      AudiobookItem("4", 'Part6', theWitcherBloodOfElves, 'assets/audio/red-indian-music.mp3'),
      AudiobookItem("5", 'Part7', theWitcherBloodOfElves, 'assets/audio/red-indian-music.mp3'),
      AudiobookItem("6", 'Part8', theWitcherBloodOfElves, 'assets/audio/red-indian-music.mp3'),
      AudiobookItem("7", 'Part9', theWitcherBloodOfElves, 'assets/audio/red-indian-music.mp3'),
    ];

    AudiobookPlaylistItem whisperer =
        AudiobookPlaylistItem(1, 'The whisperer in darkness', null);
    whisperer.parts = [
      AudiobookItem("2", 'Part1', whisperer, 'assets/audio/red-indian-music.mp3'),
      AudiobookItem("3", 'Part2', whisperer, 'assets/audio/red-indian-music.mp3'),
      AudiobookItem("4", 'Part3', whisperer, 'assets/audio/red-indian-music.mp3'),
      AudiobookItem("1", 'Part0', whisperer, 'assets/audio/red-indian-music.mp3'),
      AudiobookItem("5", 'Part4', whisperer, 'assets/audio/red-indian-music.mp3'),
      AudiobookItem("6", 'Part5', whisperer, 'assets/audio/red-indian-music.mp3'),
      AudiobookItem("6", 'Part6', whisperer, 'assets/audio/red-indian-music.mp3'),
      AudiobookItem("6", 'Part7', whisperer, 'assets/audio/red-indian-music.mp3'),
      AudiobookItem("6", 'Part8', whisperer, 'assets/audio/red-indian-music.mp3'),
      AudiobookItem("7", 'Part9', whisperer, 'assets/audio/red-indian-music.mp3'),
    ];

    AudiobookPlaylistItem sample1 = AudiobookPlaylistItem(1, 'sample1', null);
    sample1.parts = [
      AudiobookItem("1", 'Part0', sample1, 'assets/audio/red-indian-music.mp3'),
      AudiobookItem("2", 'Part1', sample1, 'assets/audio/red-indian-music.mp3'),
      AudiobookItem("3", 'Part2', sample1, 'assets/audio/red-indian-music.mp3'),
      AudiobookItem("4", 'Part3', sample1, 'assets/audio/red-indian-music.mp3'),
      AudiobookItem("5", 'Part4', sample1, 'assets/audio/red-indian-music.mp3'),
      AudiobookItem("6", 'Part5', sample1, 'assets/audio/red-indian-music.mp3'),
      AudiobookItem("7", 'Part6', sample1, 'assets/audio/red-indian-music.mp3'),
    ];
    return [whisperer, sample1, theWitcherBloodOfElves] + loadedAudiobooks;
  }
}
