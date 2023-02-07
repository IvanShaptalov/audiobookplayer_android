import 'dart:io';
import 'package:audiobook_player/src/config/path_provider.dart';
import 'package:audiobook_player/src/pages/home/view/player.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:just_audio/just_audio.dart';
// ignore: depend_on_referenced_packages

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

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
    group('Player', () {
      test('jump seconds validation add operator', () async {
        AudioPlayer p = AudioPlayer();
        var pm = PlayerMethods(innerPlayer: p);

        // expect max value
        expect(
            pm.validateJump(13, 0, 10, seekOperation: SeekOperation.add), 10);

        // expect max value
        expect(pm.validateJump(10, 0, 10), 10);

        // expect current value
        expect(pm.validateJump(5, 0, 10), 5);

        // expect min value
        expect(pm.validateJump(-5, 0, 10), 0);

        // expect min value
        expect(pm.validateJump(0, 0, 10), 0);
      });
      test('jump seconds validation replace', () async {
        AudioPlayer p = AudioPlayer();
        var pm = PlayerMethods(innerPlayer: p);

        // expect max value
        expect(pm.validateJump(13, 0, 10, seekOperation: SeekOperation.replace),
            10);

        // expect max value
        expect(pm.validateJump(10, 0, 10), 10);

        // expect current value
        expect(pm.validateJump(5, 0, 10), 5);

        // expect min value
        expect(pm.validateJump(-5, 0, 10), 0);

        // expect min value
        expect(pm.validateJump(0, 0, 10), 0);
      });
    });
  });
}
