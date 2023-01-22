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
  static List<AudiobookPlaylistItem> audiobooks = [];
  static bool loaded = false;

  static List<AudiobookPlaylistItem> get getAudiobooks {
    String audiobookFolder = AudiobookLoadingConfig.getAudiobookFolderPath;
    print('audiobooks folder in path: $audiobookFolder');

    var files =
        AudiobookLoadingConfig.loadAudiobooksFromFolder(audiobookFolder);

    var loadedAudiobooks =
        AudiobookLoadingConfig.convertAudiobooksFromFiles(files);
    audiobooks = loadedAudiobooks;
    loaded = true;
    return loadedAudiobooks;
  }
}
