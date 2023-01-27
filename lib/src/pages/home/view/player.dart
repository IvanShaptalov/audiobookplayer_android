// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:audiobook_player/src/config/config.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Player extends StatefulWidget {
  Player({super.key, required AudioPlayer this.innerPlayer});

  AudioPlayer innerPlayer;

  @override
  State<Player> createState() => _PlayerState(
      innerPlayer: innerPlayer,
      pMethods: PlayerMethods(innerPlayer: innerPlayer));
}

class _PlayerState extends State<Player> {
  _PlayerState(
      {required AudioPlayer this.innerPlayer,
      required PlayerMethods this.pMethods});

  AudioPlayer innerPlayer;

  PlayerMethods pMethods;

  void nextAudio() {
    setState(() {
      toggle = true;
    });
    pMethods.nextAudio();
  }

  void previousAudio() {
    setState((() {
      toggle = true;
    }));
    pMethods.previousAudio();
  }

  void nextState() {
    pMethods.nextState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
          child:
              Text(CurrentPlayingMusicConfig.getAudiobook.title, maxLines: 1)),
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
      AudioSlider(
        innerPlayer: innerPlayer,
      )
    ]);
  }
}

class PlayerMethods {
  PlayerMethods({required AudioPlayer this.innerPlayer});

  AudioPlayer innerPlayer;

  void nextAudio() {
    // start play music and change play button to pause icon

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
    // start play music and change play button to pause icon

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
    if (musicPath != CurrentPlayingMusicConfig.getAudiobook.path) {
      print('loaded new instance');
      musicPath = CurrentPlayingMusicConfig.getAudiobook.path;
      final duration = innerPlayer.setFilePath(musicPath!);
    }
    innerPlayer.play();
    print('play from ${innerPlayer.position}');
  }

  void pauseAudio() {
    innerPlayer.pause();
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
}

class AudioSlider extends StatefulWidget {
  AudioSlider({super.key, required AudioPlayer this.innerPlayer});

  AudioPlayer innerPlayer;
  @override
  State<AudioSlider> createState() => _AudioSlider(innerPlayer: innerPlayer);
}

class _AudioSlider extends State<AudioSlider> {
  _AudioSlider({required this.innerPlayer});

  AudioPlayer innerPlayer;
  late Timer timer;
  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (innerPlayer.position.inSeconds > 0) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void deactivate() {
    timer.cancel();
    super.deactivate();
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

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(durationToHFormat(innerPlayer.position.toString())),
        SizedBox(
          width: MediaConfig.getmediaWidht(context) / 2,
          child: Slider(
            value: innerPlayer.position.inMilliseconds.toDouble(),
            max: innerPlayer.duration?.inMilliseconds.toDouble() ?? 0,
            onChanged: (value) {
              innerPlayer.seek(Duration(milliseconds: value.round()));
              print(innerPlayer.position);
              setState(() {});
            },
          ),
        ),
        Text(durationToHFormat(innerPlayer.duration.toString())),
      ],
    );
  }
}
