
// ignore_for_file: must_be_immutable

import 'package:audiobook_player/src/config/config.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Player extends StatelessWidget {
  AudioPlayer player = AudioPlayer();

  Player({super.key});

  Future<int> playAudio() async {
    String audioasset = CurrentPlayingMusicConfig.getMusic;
    ByteData bytes = await rootBundle.load(audioasset); //load audio from assets
    Uint8List audiobytes =
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    int result = await player.playBytes(audiobytes);
    if (result == 1) {
      //play success
      print("audio is playing.");
    } else {
      print("Error while playing audio.");
    }
    print('all ok playing');
    return result;
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
          // print("good, audio played");
        },
      ),
      
    );
  }
}
