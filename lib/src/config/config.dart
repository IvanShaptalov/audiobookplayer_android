import 'dart:io';
import 'package:uuid/uuid.dart';
import 'package:audiobook_player/src/pages/audiobookparts/audiobook_parts.dart';
import 'package:audiobook_player/src/pages/sample_item.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

Uuid uuid = const Uuid();

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
      audiobooksItems.add(AudiobookItem(uuid.v1(), audiobook.path.substring(audiobook.path.lastIndexOf('/')+1,audiobook.path.indexOf('.')), playlist));
    }
    playlist.parts = audiobooksItems;
    AudiobookPlaylistItem theWitcherLastWish =
        AudiobookPlaylistItem(1, 'The witcher, Last Wish', null);
    theWitcherLastWish.parts = [
      AudiobookItem("1", 'Part 0', theWitcherLastWish),
      AudiobookItem("2", 'Part1', theWitcherLastWish),
      AudiobookItem("3", 'Part2', theWitcherLastWish),
      AudiobookItem("4", 'Part3', theWitcherLastWish),
      AudiobookItem("5", 'Part4', theWitcherLastWish),
      AudiobookItem("6", 'Part5', theWitcherLastWish),
      AudiobookItem("7", 'Part6', theWitcherLastWish),
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
