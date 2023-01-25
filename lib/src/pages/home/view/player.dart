// ignore_for_file: must_be_immutable

import 'package:audiobook_player/src/config/config.dart';
import 'package:flutter/material.dart';

class Player extends StatefulWidget {
  const Player({super.key});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  String? musicPath;

  void playAudio() async {
    print("are you work?");
    if (musicPath != CurrentPlayingMusicConfig.getMusic) {
      musicPath = CurrentPlayingMusicConfig.getMusic;
      final duration = await player.setFilePath(musicPath!);
      print("duration is: ${duration!.inSeconds}");
      print("are you work after?");
    }

    player.play();
  }

  void pauseAudio() async {
    player.pause();
  }

  void nextState() {
    toggle = !toggle;
    if (toggle) {
      playAudio();
      print("good, audio played");
    } else {
      pauseAudio();
      print("good, audio stopped");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        IconButton(onPressed: () {}, icon: Icon(Icons.skip_previous)),
        IconButton(
          key: UniqueKey(),
          alignment: Alignment.bottomCenter,
          icon: toggle
              ? const Icon(Icons.pause)
              : const Icon(
                  Icons.play_arrow,
                ),
          onPressed: () {
            setState(() {
              nextState();
            });
          },
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.skip_next)),
      ]),
      Row(
        children: [],
      )
    ]);
  }
}
