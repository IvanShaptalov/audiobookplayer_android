// This is an example unit test.
//
// A unit test tests a single function, method, or class. To learn more about
// writing unit tests, visit
// https://flutter.dev/docs/cookbook/testing/unit/introduction
import 'dart:io';

import 'package:audiobook_player/src/config/config.dart';
import 'package:audiobook_player/src/config/path_provider.dart';
import 'package:audiobook_player/src/pages/sample_item.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:just_audio/just_audio.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;

void main() {
  group('Music_Loading', () {
    test('should load music from asset', () async {
      // test check that music real loading from path
      AudiobookLoadingConfig.audiobookFolderPath =
          path.absolute('assets/audio/');
      // expect LIST AUDIOBOOKPLAYLISTITEM with ONE AUIDOBOOK
      List<AudiobookPlaylistItem> expectedAudiobookPlaylist =
          await AudiobookLoadingConfig.getConvertedAudiobooks();
      // ignore: unnecessary_null_comparison
      expect(expectedAudiobookPlaylist != null, true);
      expect(expectedAudiobookPlaylist.first.hasParts, true);

      AudiobookItem audio = expectedAudiobookPlaylist.first.parts!.first;
      AudiobookItem expectedAudio = AudiobookItem.getAudiobookItem();
      expect(audio.title == expectedAudio.title, true);
      expect(
          audio.path.toString() == path.absolute(expectedAudio.path).toString(),
          true);
    });

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

      test(
          'should load music from asset and update current music to first and stop player',
          () async {
        // test check that music real loading from path
        AudiobookLoadingConfig.audiobookFolderPath =
            path.absolute('assets/audio/');
        // expect LIST AUDIOBOOKPLAYLISTITEM with ONE AUIDOBOOK
        List<AudiobookPlaylistItem> expectedAudiobookPlaylist =
            await AudiobookLoadingConfig.getConvertedAudiobooks();
        // ignore: unnecessary_null_comparison
        expect(expectedAudiobookPlaylist != null, true);
        expect(expectedAudiobookPlaylist.first.hasParts, true);

        AudiobookItem audio = expectedAudiobookPlaylist.first.parts!.first;
        AudiobookItem expectedAudio = AudiobookItem.getAudiobookItem();
        expect(audio.title == expectedAudio.title, true);
        expect(
            audio.path.toString() ==
                path.absolute(expectedAudio.path).toString(),
            true);

        // expect(audiobook, AudiobookItem.getAudiobookItem());

        expect(CurrentPlayingMusicConfig.getAudiobook,
            expectedAudiobookPlaylist.first.parts!.first);
      });

      test('path not provided', () async {
        // test check that music real loading from path
        AudiobookLoadingConfig.audiobookFolderPath = "";
        // expect LIST AUDIOBOOKPLAYLISTITEM with ONE AUIDOBOOK
        List<AudiobookPlaylistItem> expectedAudiobookPlaylist =
            await AudiobookLoadingConfig.getConvertedAudiobooks();
        // ignore: unnecessary_null_comparison
        expect(expectedAudiobookPlaylist.length == 1, true);

        expect(expectedAudiobookPlaylist.first.hasParts,
            false); //exists only one unnalocated playlist without audiobooks;
      });

      test('path not provided and audiobook not changed, player stopped',
          () async {
        // test check that music real loading from path
        AudiobookLoadingConfig.audiobookFolderPath = "";
        // expect LIST AUDIOBOOKPLAYLISTITEM with ONE AUIDOBOOK
        List<AudiobookPlaylistItem> expectedAudiobookPlaylist =
            await AudiobookLoadingConfig.getConvertedAudiobooks();
        // ignore: unnecessary_null_comparison
        expect(expectedAudiobookPlaylist.length == 1, true);

        expect(expectedAudiobookPlaylist.first.hasParts, false);

        //exists only one unnalocated playlist without audiobooks;

        //check that audiobook updated to default
        expect(CurrentPlayingMusicConfig.getAudiobook,
            AudiobookItem.getAudiobookItem());
      });

      group('Music path directory', () {
        test('path not empty and valid, expect 1 song', () async {
          // test check that music real loading from path, expect string
          await LocalPathProvider.initAppDirectoryAndLocalFile();
          // set path
          await LocalPathProvider.saveMusicDirectoryPath(path.absolute('assets/audio/'));

          // upload songs, expected only one
          var l = await AudiobookLoadingConfig.getConvertedAudiobooks().then((value) => value.length);
          

          expect(l == 1, true);


          //check that folders deleted
          expect(await LocalPathProvider.deleteAppFolder(), true);
        });

        test('path broken, expect default song', () async {
          // test check that music real loading from path, expect string
          await LocalPathProvider.initAppDirectoryAndLocalFile();
          // set path
          await LocalPathProvider.saveMusicDirectoryPath(path.absolute('assets/audio/daslfkjapodifhe'));

          // upload songs, expected only one
          var l = await AudiobookLoadingConfig.getConvertedAudiobooks().then((value) => value.length);
          

          expect(l == 1, true);


          //check that folders deleted
          expect(await LocalPathProvider.deleteAppFolder(), true);
        });

        test('path empty, expect default value', () async {
          // test check that music real loading from path, expect string
          await LocalPathProvider.initAppDirectoryAndLocalFile();
          // set path
          await LocalPathProvider.saveMusicDirectoryPath("");

          // upload songs, expected only one
          var l = await AudiobookLoadingConfig.getConvertedAudiobooks().then((value) => value.length);
          

          expect(l == 1, true);


          //check that folders deleted
          expect(await LocalPathProvider.deleteAppFolder(), true);
        });
      });
    });
  });
}
