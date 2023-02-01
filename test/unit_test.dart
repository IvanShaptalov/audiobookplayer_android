// This is an example unit test.
//
// A unit test tests a single function, method, or class. To learn more about
// writing unit tests, visit
// https://flutter.dev/docs/cookbook/testing/unit/introduction
import 'dart:io';
import 'package:audiobook_player/src/config/config.dart';
import 'package:audiobook_player/src/config/path_provider.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;

void main() {
  group('Music_Loading', () {
    group('IO', () {
      test(
          'document directory exists, and application directory created, path exists',
          () async {
        // test check that music real loading from path, expect string
        await LocalPathProvider.initAppDirectoryAndLocalFile();
        expect(await Directory(LocalPathProvider.appDocPath!).exists(), true);
      });

      test('cash file created. path exists', () async {
        // test check that music real loading from path, expect string
        await LocalPathProvider.initAppDirectoryAndLocalFile();
        expect(await File(LocalPathProvider.cashLocalPath!).exists(), true);
      });

      group('Music path directory', () {
        test('path not empty and valid, expect more 0 song', () async {
          // test check that music real loading from path, expect string
          await LocalPathProvider.initAppDirectoryAndLocalFile();
          // set path
          await LocalPathProvider.saveMusicDirectoryPath(
              path.absolute('assets/audio/'));

          // upload songs, expected only one
          var l = await AudiobookLoadingConfig.getConvertedAudiobooks(null).then((value) => value.length);

          expect(l > 0, true);

          //check that folders deleted
          expect(await LocalPathProvider.deleteAppFolder(), true);
        });
      });
    });
  });
}
