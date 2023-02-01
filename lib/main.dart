import 'dart:developer';

import 'package:audiobook_player/src/config/config.dart';
import 'package:audiobook_player/src/config/path_provider.dart';
import 'package:audiobook_player/src/pages/home/view/source.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

void main() async {
  // init bindings
  WidgetsFlutterBinding.ensureInitialized();
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load settings
  await settingsController.loadSettings();

  print('load directory or not');

  // create app directory if not exist
  await LocalPathProvider.initAppDirectoryAndLocalFile();

  //get Audiobook folder path from file
  // AudiobookLoadingConfig.setAudiobookFolderPath =
  //     await LocalPathProvider.getSavedMusicDirectoryPath();

  // load audiobooks if exist
  // if (AudiobookLoadingConfig.getAudiobookFolderPath != "") {
  var status = await Permission.storage.status;
  if (!status.isGranted) {
    await Permission.storage.request();
  }

  if (status == PermissionStatus.granted) {
    await AudiobookSource.loadAndCashAudiobooksAsync();
  }

  // }
  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(MyApp(settingsController: settingsController));
}
