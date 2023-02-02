// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:audiobook_player/src/config/config.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Player extends StatefulWidget {
  Player({super.key, required this.innerPlayer});

  AudioPlayer innerPlayer;

  @override
  // ignore: no_logic_in_create_state
  State<Player> createState() => _PlayerState(
      innerPlayer: innerPlayer,
      pMethods: PlayerMethods(innerPlayer: innerPlayer));
}

class _PlayerState extends State<Player> {
  _PlayerState({required this.innerPlayer, required this.pMethods});

  AudioPlayer innerPlayer;

  PlayerMethods pMethods;

  StreamSubscription? toggleSub;


  @override
  void initState() {
    toggleSub = pMethods.toggleListener().listen((event) {
      print('event');
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    if (toggleSub != null){
      toggleSub!.cancel();
    }
    super.dispose();
  }

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
  PlayerMethods({required this.innerPlayer});

  AudioPlayer innerPlayer;

  Stream<bool> toggleListener() async* {
    print('started listed toggle, now : $toggle');
    bool innerToggle = toggle;
    while (true) {
      await Future.delayed(Duration(seconds: 1));
      if (innerToggle != toggle) {
        print('toggle changed to : $toggle');
        innerToggle = toggle;
      }
    }
  }

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
    if (musicPath != CurrentPlayingMusicConfig.getAudiobook.path) {
      musicPath = CurrentPlayingMusicConfig.getAudiobook.path;
      innerPlayer.setFilePath(musicPath!);
    }
    innerPlayer.play();
  }

  void pauseAudio() {
    innerPlayer.pause();
  }

  void nextState() {
    toggle = !toggle;
    if (toggle) {
      playAudio();
    } else {
      pauseAudio();
    }
  }
}

class AudioSlider extends StatefulWidget {
  AudioSlider({super.key, required this.innerPlayer});

  AudioPlayer innerPlayer;
  @override
  // ignore: no_logic_in_create_state
  State<AudioSlider> createState() => _AudioSlider(innerPlayer: innerPlayer);
}

class _AudioSlider extends State<AudioSlider> {
  _AudioSlider({required this.innerPlayer});

  AudioPlayer innerPlayer;
  late Timer timer;
  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!innerPlayer.playing) {
        toggle = false;
      }

      if (innerPlayer.position.inSeconds > 0) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    if (timer.isActive) {
      timer.cancel();
    }
    super.dispose();
  }

  @override
  void deactivate() {
    if (timer.isActive) {
      timer.cancel();
    }
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
            min: 0,
            value: innerPlayer.position.inMilliseconds.toDouble(),
            max: innerPlayer.duration?.inMilliseconds.toDouble() ?? 0,
            onChanged: (value) {
              innerPlayer.seek(Duration(milliseconds: value.round()));
              setState(() {});
            },
          ),
        ),
        Text(durationToHFormat(innerPlayer.duration.toString())),
      ],
    );
  }
}
