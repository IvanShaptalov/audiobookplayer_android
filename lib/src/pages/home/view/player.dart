
// ignore_for_file: must_be_immutable

import 'package:audiobook_player/src/config/config.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Player extends StatelessWidget {
  AudioPlayer player = AudioPlayer();

  void playAudio() async {
    String musicPath = CurrentPlayingMusicConfig.getMusic;
    final duration = await player.setFilePath(musicPath);
    player.play();

  }

  // int result = player.playBytes(audiobytes);
  @override
  Widget build(BuildContext context) {
    return Align(
      child: IconButton(
        alignment: Alignment.bottomCenter,
        icon: const Icon(Icons.play_arrow),
        onPressed: () {
          playAudio();
          print("good, audio played");
        },
      ),
      
    );
  }
}
