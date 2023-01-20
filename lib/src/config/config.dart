import 'dart:io';
import 'package:just_audio/just_audio.dart';
import 'package:uuid/uuid.dart';
import 'package:audiobook_player/src/pages/audiobookparts/audiobook_parts.dart';
import 'package:audiobook_player/src/pages/sample_item.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

Uuid uuid = const Uuid();

bool toggle = false;
AudioPlayer player = AudioPlayer();

class MediaConfig {
  static double getmediaHeight(context) {
    return MediaQuery.of(context).size.height;
  }

  static double getmediaWidht(context) {
    return MediaQuery.of(context).size.width;
  }

  static getNormalSize(double current, double min, double max) {
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

class AudiobookLoadingConfig {
  static const ALLOWED_EXTENSIONS = [
    'mp3',
  ];

  static String _audiobookFolderPath = "";
  static set audiobookFolderPath(String folderPath) =>
      _audiobookFolderPath = folderPath;
  static get getAudiobookFolderPath => _audiobookFolderPath;

  static late String _cash;
  static set cashSet(String cashPath) => _cash = cashPath;
  static String get cashGet => _cash;

  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  static List<FileSystemEntity> loadAudiobooksFromFolder(String dirPath) {
    Directory dir = Directory(dirPath);
    List<FileSystemEntity> files;
    List<FileSystemEntity> songs = [];
    files = dir.listSync(recursive: false, followLinks: false);
    for (FileSystemEntity entity in files) {
      String path = entity.path;
      for (String extension in ALLOWED_EXTENSIONS) {
        if (path.endsWith(extension)) {
          songs.add(entity);
          break;
        }
      }
    }
    // ignore: avoid_print
    print(songs);
    print(songs.length);
    return songs;
  }

  static List<AudiobookPlaylistItem> convertAudiobooksFromFiles(
      List<FileSystemEntity> audiobooksFiles) {
    print(audiobooksFiles);
    var playlist = AudiobookPlaylistItem(0, 'Unnalocated audiobooks', null);
    List<AudiobookItem> audiobooksItems = [];
    for (FileSystemEntity audiobook in audiobooksFiles) {
      audiobooksItems.add(AudiobookItem(
          uuid.v1(),
          audiobook.path.substring(
              audiobook.path.lastIndexOf('/') + 1, audiobook.path.indexOf('.')),
          playlist,
          audiobook.path));
    }
    playlist.parts = audiobooksItems;
    AudiobookPlaylistItem theWitcherLastWish =
        AudiobookPlaylistItem(1, 'The witcher, Last Wish', null);
    theWitcherLastWish.parts = [
      AudiobookItem("1", 'Part 0', theWitcherLastWish,
          'assets/audio/red-indian-music.mp3'),
      AudiobookItem("2", 'Part1', theWitcherLastWish,
          'assets/audio/red-indian-music.mp3'),
      AudiobookItem("3", 'Part2', theWitcherLastWish,
          'assets/audio/red-indian-music.mp3'),
      AudiobookItem("4", 'Part3', theWitcherLastWish,
          'assets/audio/red-indian-music.mp3'),
      AudiobookItem("5", 'Part4', theWitcherLastWish,
          'assets/audio/red-indian-music.mp3'),
      AudiobookItem("6", 'Part5', theWitcherLastWish,
          'assets/audio/red-indian-music.mp3'),
      AudiobookItem("7", 'Part6', theWitcherLastWish,
          'assets/audio/red-indian-music.mp3'),
    ];
    return [playlist];
  }
}

class FolderPathDialog {
  static Future<String> saveAudiobookFolderPathDialog() async {
    dynamic result = await FilePicker.platform.getDirectoryPath();
    print(result.toString());
    AudiobookLoadingConfig.audiobookFolderPath = result.toString();
    return result;
  }
}

class CurrentPlayingMusicConfig {
  static String _currentPlayingMusic = "";

  static String get getMusic {
    return _currentPlayingMusic;
  }

  static set setMusic(String cpm) {
    print(cpm);
    _currentPlayingMusic = cpm;
  }
}
