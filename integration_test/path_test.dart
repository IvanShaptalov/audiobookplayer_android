import 'package:audiobook_player/src/config/config.dart';
import 'package:audiobook_player/src/config/path_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;
import 'package:permission_handler/permission_handler.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('path not empty and valid, expect more 0 song', (tester) async {
    await Permission.manageExternalStorage.request();
    assert(await Permission.manageExternalStorage.isGranted, true);
    // test check that music real loading from path, expect string
    await LocalPathProvider.initAppDirectoryAndLocalFile();
    // set path
    await LocalPathProvider.saveMusicDirectoryPath(
        path.absolute('assets/audio/'));

    // upload songs, expected only one
    var l = await AudiobookLoadingConfig.getConvertedAudiobooks(null)
        .then((value) => value.length);

    expect(l > 0, true);

    //check that folders deleted
    expect(await LocalPathProvider.deleteAppFolder(), true);
  });
}
