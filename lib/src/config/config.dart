import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:uuid/uuid.dart';
import 'package:audiobook_player/src/pages/sample_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Uuid uuid = const Uuid();
bool toggle = false;

String? musicPath;
AudioPlayer player = AudioPlayer();
final OnAudioQuery _audioQuery = OnAudioQuery();

class AppLocales {
  static const String appName = 'audiobook_player';
}

// set LocalDirectory to save cash

//not test
class MediaConfig {
  static double getmediaHeight(context) {
    return MediaQuery.of(context).size.height;
  }

  static double getmediaWidht(context) {
    return MediaQuery.of(context).size.width;
  }

  static getNormalSize(double current, double min, double max) {
    // print("current ${current}");
    // print("current ${current}");

    double result = current < min
        ? min
        : current > max
            ? max
            : current;
    // print("result ${result}");

    return result;
  }

  static MediaConfig get instance {
    return MediaConfig();
  }
}

//tested
class AudiobookLoadingConfig {
  // set extensions that allowed to scan and save
  static const allowedExtensions = [
    'mp3',
  ];

  //folder to scan audiobooks
  // static String _audiobookFolderPath = "";

  // static set setAudiobookFolderPath(String folderPath) =>
  //     _audiobookFolderPath = folderPath;

  // static String get getAudiobookFolderPath => _audiobookFolderPath;

  static Future<List<AudiobookPlaylistItem>> getConvertedAudiobooks(
      UriType? uritype) async {
    /// load audibook files from AudiobookConfig.audiobookFolder path and convert to AudiobookItem in AudiobookPlaylistItem List
    // String audiobookFolder = AudiobookLoadingConfig.getAudiobookFolderPath;
    // print('audiobooks folder in path: $audiobookFolder');

    // load from folder
    List<SongModel>? loadedAudiobooks =
        await _audioQuery.querySongs(uriType: uritype);
    AudiobookPlaylistItem unnalocatedPlaylist =
        AudiobookPlaylistItem(-1, 'unnalocated audiobooks', null);
    List<AudiobookItem> convertedAudiobooks = [];

    
    // convert files
    if (loadedAudiobooks.isEmpty) {
      return [];
    }

    for (var audiobook in loadedAudiobooks) {
      print(audiobook.fileExtension);
      if (allowedExtensions.contains(audiobook.fileExtension)){
          convertedAudiobooks.add(AudiobookItem(
          uuid.v1(),
          audiobook.displayName,
          unnalocatedPlaylist,
          audiobook.album == null ? 'not exist' : audiobook.album!,
          audiobook.artist == null ? 'not artist' : audiobook.artist!,
          audiobook.duration == null
              ? const Duration(seconds: 0)
              : Duration(milliseconds: audiobook.duration!),
          audiobook.data));
      }
      
    }

    unnalocatedPlaylist.parts = convertedAudiobooks;


    // CurrentPlayingMusicConfig.updateCurrentPlayingAudiobook(
    //     loadedAudiobooks.first);

    // change toggle to false
    toggle = false;

    return [unnalocatedPlaylist];
  }
}

//tested
// class FolderPathDialog {
//   static Future<String> saveAudiobookFolderPathDialog(
//       BuildContext context, AudioPlayer player) async {
//     String? result = await FilePicker.platform.getDirectoryPath();
//     print(result.toString());
//     if (result is String) {
//       // AudiobookLoadingConfig.setAudiobookFolderPath = result.toString();
//       await AudiobookSource.loadAndCashAudiobooksAsync();
//       toggle = false;

//       if (player.playing) {
//         player.stop();
//       }
//       await LocalPathProvider.saveMusicDirectoryPath(result.toString());
//     }
//     // result = AudiobookLoadingConfig.getAudiobookFolderPath;

//     // ignore: await_only_futures, use_build_context_synchronously
//     await Navigator.restorablePushNamed(context, HomePage.routeName);

//     return result;
//   }
// }

//tested
class CurrentPlayingMusicConfig {
  static AudiobookItem updateCurrentPlayingAudiobook(
      AudiobookPlaylistItem playlist) {
    if (playlist.hasParts) {
      _currentPlayingAudiobook = playlist.parts!.first;
    } else {
      _currentPlayingAudiobook = AudiobookItem.getAudiobookItem();
    }
    return _currentPlayingAudiobook;
  }

  static AudiobookItem _currentPlayingAudiobook =
      AudiobookItem.getAudiobookItem();

  static AudiobookItem get getAudiobook {
    return _currentPlayingAudiobook;
  }

  static set setMusic(AudiobookItem audiobook) {
    if (kDebugMode) {
      print(audiobook);
    }
    _currentPlayingAudiobook = audiobook;
  }
}
