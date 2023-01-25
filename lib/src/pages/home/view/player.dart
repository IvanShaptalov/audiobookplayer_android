// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:audiobook_player/src/config/config.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Player extends StatefulWidget {
  Player({super.key});

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  void nextAudio() {
    var audiobook = CurrentPlayingMusicConfig.getAudiobook;
    var playlist = audiobook.parent;

    if (playlist.hasParts) {
      assert(playlist.parts!.isNotEmpty);

      int l = playlist.parts!.length; // full length
      int index = playlist.parts!.indexOf(audiobook);
      var nextAudiobook = playlist.parts![index + 1 < l ? index + 1 : 0];
      CurrentPlayingMusicConfig.setMusic = nextAudiobook;
    } else {
      playAudio();
    }
    playAudio();
  }

  void previousAudio() {
    var audiobook = CurrentPlayingMusicConfig.getAudiobook;
    var playlist = audiobook.parent;

    if (playlist.hasParts) {
      assert(playlist.parts!.isNotEmpty);

      int l = playlist.parts!.length; // full length
      int index = playlist.parts!.indexOf(audiobook);
      var nextAudiobook = playlist.parts![index - 1 >= 0 ? index - 1 : l - 1];
      CurrentPlayingMusicConfig.setMusic = nextAudiobook;
    } else {
      playAudio();
    }
    playAudio();
  }

  void playAudio() {
    print("are you work?");
    if (musicPath != CurrentPlayingMusicConfig.getAudiobook) {
      print('loaded new instance');
      musicPath = CurrentPlayingMusicConfig.getAudiobook.path;
      final duration = player.setFilePath(musicPath!);
    }
    player.play();
    player.setVolume(1);
    print('play from ${player.position}');
  }

  void pauseAudio() {
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
        IconButton(
            onPressed: () {
              previousAudio();
            },
            icon: const Icon(Icons.skip_previous)),
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
        IconButton(
            onPressed: () {
              nextAudio();
            },
            icon: const Icon(Icons.skip_next)),
      ]),
      AudioSlider()
    ]);
  }
}

class AudioSlider extends StatefulWidget {
  AudioSlider({super.key});

  @override
  State<AudioSlider> createState() => _AudioSlider();
}

class _AudioSlider extends State<AudioSlider> {
  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String durationToHFormat(String stringDuration) {
      if (!stringDuration.contains('.')) {
        return stringDuration;
      }
      var reversed = stringDuration.split('').reversed.join();
      var cutted = reversed.substring(reversed.indexOf('.') + 1);
      return cutted.split('').reversed.join();
    }

    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(durationToHFormat(player.position.toString())),
        SizedBox(
          width: MediaConfig.getmediaWidht(context) / 2,
          child: Slider(
            value: player.position.inMilliseconds.toDouble(),
            max: player.duration?.inMilliseconds.toDouble() ?? 0,
            onChanged: (value) {
              player.seek(Duration(milliseconds: value.round()));
              print(player.position);
              setState(() {});
            },
          ),
        ),
        Text(durationToHFormat(player.duration.toString())),
      ],
    );
  }
}
