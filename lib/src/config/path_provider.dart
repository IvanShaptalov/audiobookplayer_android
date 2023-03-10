import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:flutter/foundation.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as p;
import 'package:audiobook_player/src/config/config.dart';
import 'package:path_provider/path_provider.dart';

class LocalPathProvider {
  static String?
      appDocPath; //use createAppDirAsync to set appDocPath to string path
  static String?
      cashLocalPath; // use createAppDirAsync to set cashLocalPath to string path

  static Future<void> initAppDirectoryAndLocalFile() async {
    Directory appDir = await getApplicationSupportDirectory();

    appDocPath = await _createAppDir(appDir.path).then((dir) => dir.path);
    
    // create local file to store data
    await _createCashLocal();

    if (kDebugMode) {
      print(' localpath: ${LocalPathProvider.appDocPath}');
    }
  }

  static Future<bool> deleteAppFolder() async{
    // return true if deleted
    assert(appDocPath is String, true);
    assert(cashLocalPath is String, true);
    var dir = Directory(appDocPath!);
    if (await dir.exists()){
      await dir.delete(recursive: true);
    }
    return !await dir.exists();
  }

  static Future<bool> saveMusicDirectoryPath(String musicPath) async { 
    //create cash file if not exists
    await _createCashLocal();
    assert(cashLocalPath is String);
    // ensure that file exists
    var file = File(cashLocalPath!);
    if (await file.exists()) {
      await file.writeAsString(musicPath);
      // file saved
      return true;
    }
    // file not exists
    return false;
  }

  // use this method to create appDocPath
  static Future<Directory> _createAppDir(String docDir) async {
    var appDirPath = p.join(docDir, AppLocales.appName);

    Directory dir = Directory(appDirPath);
    // if dir not exists, create it
    if (!await Directory(appDirPath).exists()) {
      dir = await Directory(appDirPath).create(recursive: true);

      
    }
    assert(await dir.exists());
    return dir;
  }

  static Future<void> _createCashLocal() async {
    // appDocPath directory must be created, use
    assert(appDocPath is String);
    String path = p.join(appDocPath!, 'localInfo.txt');
    cashLocalPath = path;

    // create if not exists
    if (!await File(path).exists()) {
      await File(path).create();
    }
  }
}
