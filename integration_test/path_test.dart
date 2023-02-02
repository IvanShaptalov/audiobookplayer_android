// import 'package:audiobook_player/src/config/config.dart';
// import 'package:audiobook_player/src/config/path_provider.dart';
// import 'package:flutter_test/flutter_test.dart';
// // ignore: depend_on_referenced_packages
// import 'package:path/path.dart' as path;

// void main() {
//      group('Music path directory', () {
//         testWidgets('path not empty and valid, expect more 0 song', (tester)  async {
//           // test check that music real loading from path, expect string
//           await LocalPathProvider.initAppDirectoryAndLocalFile();
//           // set path
//           await LocalPathProvider.saveMusicDirectoryPath(
//               path.absolute('assets/audio/'));

//           // upload songs, expected only one
//           var l = await AudiobookLoadingConfig.getConvertedAudiobooks(null).then((value) => value.length);

//           expect(l > 0, true);

//           //check that folders deleted
//           expect(await LocalPathProvider.deleteAppFolder(), true);
//         });
//       });
// }