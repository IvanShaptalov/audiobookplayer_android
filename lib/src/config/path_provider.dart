import 'dart:io';

import 'package:audiobook_player/src/config/config.dart';
import 'package:path_provider/path_provider.dart';

class LocalPathProvider {
  static String? appDocPath;

  static Future<void> setAppDocDirAsync() async {
    Directory appDir = await getApplicationDocumentsDirectory();

    appDocPath = await createAppDir(appDir.path).then((dir) => dir.path);

    print(' localpath: ${LocalPathProvider.appDocPath}');
  }

  static Future<Directory> createAppDir(String docDir) async {
    Directory dir = Directory('$docDir/${AppLocales.appName}');

    // if dir not exists, create it
    if (!await Directory('$docDir/${AppLocales.appName}').exists()) {
      dir = await Directory('$docDir/${AppLocales.appName}')
          .create(recursive: true);
    }
    assert(dir.existsSync());
    return dir;
  }

  // static bool saveMusicDirectoryPath(String path) {}
}
