// This is an example unit test.
//
// A unit test tests a single function, method, or class. To learn more about
// writing unit tests, visit
// https://flutter.dev/docs/cookbook/testing/unit/introduction
import 'package:audiobook_player/src/config/config.dart';
import 'package:audiobook_player/src/pages/sample_item.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;

void main() {
  group('Plus Operator', () {
    test('should add two numbers together', () {
      expect(1 + 1, 2);
    });
  });

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

    test('should load music from asset and update current music to first', () async {
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

      // expect(audiobook, AudiobookItem.getAudiobookItem());
      
      expect(CurrentPlayingMusicConfig.getAudiobook, expectedAudiobookPlaylist.first.parts!.first);

    });


    test('path not provided', () async {
      // test check that music real loading from path
      AudiobookLoadingConfig.audiobookFolderPath = "";
      // expect LIST AUDIOBOOKPLAYLISTITEM with ONE AUIDOBOOK
      List<AudiobookPlaylistItem> expectedAudiobookPlaylist =
          await AudiobookLoadingConfig.getConvertedAudiobooks();
      // ignore: unnecessary_null_comparison
      expect(expectedAudiobookPlaylist.length == 1, true);

      expect(expectedAudiobookPlaylist.first.hasParts, false); //exists only one unnalocated playlist without audiobooks;
    });


    test('path not provided and audiobook not changed', () async {
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
      expect(CurrentPlayingMusicConfig.getAudiobook, AudiobookItem.getAudiobookItem());
    });
  });
}
