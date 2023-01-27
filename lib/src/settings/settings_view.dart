import 'package:audiobook_player/src/config/config.dart';
import 'package:audiobook_player/src/pages/home/home_page.dart';
import 'package:audiobook_player/src/pages/home/view/source.dart';
import 'package:flutter/material.dart';

import 'settings_controller.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsView extends StatelessWidget {
  const SettingsView({super.key, required this.controller});

  static const routeName = '/settings';

  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body:
          // IconButton(onPressed: (){}, icon: Icon(Icons.langu)),
          // IconButton(onPressed: (){}, icon: Icon(Icons.langu)),
          Column(
        children: [
          DropdownButton<ThemeMode>(
            // Read the selected themeMode from the controller
            value: controller.themeMode,
            // Call the updateThemeMode method any time the user selects a theme.
            onChanged: controller.updateThemeMode,
            items: const [
              DropdownMenuItem(
                  value: ThemeMode.system, child: Text('System Theme')),
              DropdownMenuItem(
                value: ThemeMode.light,
                child: Icon(Icons.sunny),
              ),
              DropdownMenuItem(
                value: ThemeMode.dark,
                child: Icon(Icons.dark_mode_rounded),
              )
            ],
          ),
          TextButton(
              onPressed: () {
                AudiobookSource.cashedAudiobooks = null;

                FolderPathDialog.saveAudiobookFolderPathDialog(context, player);
              },
              child: Row(children: const [
                Icon(Icons.folder),
                Text('audiobook folders')
              ])),
          DropdownButton<ThemeMode>(
            // Read the selected themeMode from the controller
            value: controller.themeMode,
            icon: const Icon(Icons.language),
            // Call the updateThemeMode method any time the user selects a theme.
            onChanged: controller.updateThemeMode,
            items: const [
              DropdownMenuItem(
                  value: ThemeMode.system, child: Text('Ukrainian')),
              DropdownMenuItem(
                value: ThemeMode.light,
                child: Text('Deutch'),
              ),
              DropdownMenuItem(value: ThemeMode.dark, child: Text('English')),
            ],
          ),
        ],
      ),
    );
  }
}
