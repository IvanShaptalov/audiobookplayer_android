import 'dart:io';
import 'package:audiobook_player/src/pages/home/home_page.dart';
import 'package:audiobook_player/src/pages/home/view/source.dart';
import 'package:just_audio/just_audio.dart';
import 'package:uuid/uuid.dart';
import 'package:audiobook_player/src/pages/sample_item.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

Uuid uuid = const Uuid();
bool toggle = false;

String? musicPath;
AudioPlayer player = AudioPlayer();

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
  static const ALLOWED_EXTENSIONS = [
    'mp3',
  ];

  //folder to scan audiobooks
  static String _audiobookFolderPath = "";

  static set audiobookFolderPath(String folderPath) =>
      _audiobookFolderPath = folderPath;

  static get getAudiobookFolderPath => _audiobookFolderPath;

  static List<FileSystemEntity> _loadAudiobooksFromFolder(String dirPath) {
    Directory dir = Directory(dirPath);
    List<FileSystemEntity> files;
    List<FileSystemEntity> fileSongs = [];
    files = dir.listSync(recursive: false, followLinks: false);
    for (FileSystemEntity entity in files) {
      String path = entity.path;
      for (String extension in ALLOWED_EXTENSIONS) {
        if (path.endsWith(extension)) {
          fileSongs.add(entity);
          break;
        }
      }
    }

    // ignore: avoid_print
    print(fileSongs.length);
    return fileSongs;
  }

  static Future<List<AudiobookPlaylistItem>> getConvertedAudiobooks() async {
    /// load audibook files from AudiobookConfig.audiobookFolder path and convert to AudiobookItem in AudiobookPlaylistItem List
    String audiobookFolder = AudiobookLoadingConfig.getAudiobookFolderPath;
    print('audiobooks folder in path: $audiobookFolder');

    var files = _loadAudiobooksFromFolder(audiobookFolder);

    var loadedAudiobooks = await _convertAudiobooksFromFiles(files);

    CurrentPlayingMusicConfig.updateCurrentPlayingAudiobook(
        loadedAudiobooks.first);

    // change toggle to false
    toggle = false;

    return loadedAudiobooks;
  }

  static Future<List<AudiobookPlaylistItem>> _convertAudiobooksFromFiles(
      List<FileSystemEntity> audiobooksFiles) async {
    print(audiobooksFiles);
    var playlist = AudiobookPlaylistItem(0, 'Unnalocated audiobooks', null);
    List<AudiobookItem> audiobooksItems = [];

    for (FileSystemEntity audiobook in audiobooksFiles) {
      Duration? duration;

      audiobooksItems.add(AudiobookItem(
          uuid.v1(),
          audiobook.path.substring(audiobook.path.lastIndexOf('/') + 1,
              audiobook.path.indexOf('.mp3')),
          playlist,
          audiobook.path));
    }

    playlist.parts = audiobooksItems;
    return [playlist];
  }
}

class FolderPathDialog {
  static Future<String> saveAudiobookFolderPathDialog(
      BuildContext context, AudioPlayer player) async {
    dynamic result = await FilePicker.platform.getDirectoryPath();
    print(result.toString());
    AudiobookLoadingConfig.audiobookFolderPath = result.toString();
    await AudiobookSource.loadAndCashAudiobooksAsync();
    toggle = false;

    if (player.playing){
      player.stop();
    }
    // ignore: await_only_futures, use_build_context_synchronously
    await Navigator.restorablePushNamed(context, HomePage.routeName);

    return result;
  }
}

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
    print(audiobook);
    _currentPlayingAudiobook = audiobook;
  }
}
