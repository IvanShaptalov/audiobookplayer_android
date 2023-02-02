import 'dart:io';
import 'package:audiobook_player/src/config/path_provider.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: depend_on_referenced_packages

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
    });
  });
}
