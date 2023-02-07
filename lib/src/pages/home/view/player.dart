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

  StreamSubscription? soundTitleSub;

  @override
  void initState() {
    toggleSub = pMethods.toggleListener(innerPlayer).listen((event) {
      print('eventnow !!!!$event');
      setState(() {});
    });
    soundTitleSub = pMethods
        .audioTitleListener(CurrentPlayingMusicConfig.getAudiobook.title)
        .listen((event) {
      print('reacted, changed to $event');
      setState(() {});
    });
    // add title listener
    super.initState();
  }

  @override
  void dispose() {
    if (toggleSub != null) {
      toggleSub!.cancel();
    }
    if (soundTitleSub != null) {
      soundTitleSub!.cancel();
    }
    super.dispose();
  }

  void nextAudio() {
    setState(() {});
    pMethods.nextAudio();
  }

  void previousAudio() {
    setState((() {}));
    pMethods.previousAudio();
  }

  void nextState() {
    pMethods.nextState();
  }

  void jumpTo(int seconds) {
    pMethods.jumpTo(seconds, SeekOperation.add);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      SizedBox(
          child:
              Text(CurrentPlayingMusicConfig.getAudiobook.title, maxLines: 1)),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Column(
          children: [
            const Text('10'),
            IconButton(
              onPressed: () => jumpTo(-10),
              icon: const Icon(Icons.arrow_circle_left_outlined),
            ),
          ],
        ),
        IconButton(
            onPressed: () {
              previousAudio();
            },
            icon: const Icon(Icons.skip_previous)),
        IconButton(
          key: UniqueKey(),
          alignment: Alignment.bottomCenter,
          icon: innerPlayer.playing
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
        Column(
          children: [
            const Text('10'),
            IconButton(
              onPressed: () => jumpTo(10),
              icon: const Icon(Icons.arrow_circle_right_outlined),
            ),
          ],
        ),
      ]),
      AudioSlider(
        innerPlayer: innerPlayer,
      )
    ]);
  }
}

enum SeekOperation {
  replace,
  add,
}

class PlayerMethods {
  PlayerMethods({required this.innerPlayer});

  AudioPlayer innerPlayer;

  Stream<bool> toggleListener(AudioPlayer innerPlayer) async* {
    print('started listed toggle, now : $innerPlayer.playing');
    bool innerToggle = innerPlayer.playing;
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      if (innerToggle != innerPlayer.playing) {
        print('toggle changed to : $innerPlayer.playing');
        innerToggle = innerPlayer.playing;
        yield innerToggle;
      }
    }
  }

  Stream<String> audioTitleListener(String currentAudioSongTitle) async* {
    String oldString = '';
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      if (oldString != currentAudioSongTitle) {
        oldString = currentAudioSongTitle;
        print('title changed!');
        yield oldString;
      }
    }
  }

  void jumpTo(int seconds, SeekOperation operation) {
    //TODO test jump
    int minPositionSeconds = 0;
    int? maxPositionSeconds = innerPlayer.duration?.inSeconds;
    int validatedSeconds = validateJump(
        seconds, minPositionSeconds, maxPositionSeconds,
        seekOperation: operation);
    print('jumped');
    innerPlayer.seek(Duration(seconds: validatedSeconds));
  }

  int validateJump(int currentValue, int minValue, int? maxValue,
      {seekOperation = SeekOperation.add}) {
    //TODO test validate jump
    int currentPosition = innerPlayer.position.inSeconds;

    //set minmax position
    int jumpDurationSeconds;
    switch (seekOperation) {
      case SeekOperation.add:
        jumpDurationSeconds = currentPosition + currentValue;
        break;
      case SeekOperation.replace:
        jumpDurationSeconds = currentValue;
        break;
      default:
        jumpDurationSeconds = currentPosition + currentValue;
    }

    if (jumpDurationSeconds <= minValue) {
      return minValue;
    }
    if (maxValue != null && jumpDurationSeconds >= maxValue) {
      return maxValue;
    }

    return jumpDurationSeconds;
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
    if (innerPlayer.playing) {
      pauseAudio();
    } else {
      playAudio();
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
    PlayerMethods pm = PlayerMethods(innerPlayer: innerPlayer);

    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      print('i work');
      
      if (innerPlayer.position.inSeconds > 0) {
        setState(() {});
      }
      if (innerPlayer.duration != null &&innerPlayer.position.inSeconds >= innerPlayer.duration!.inSeconds) {
          pm.nextAudio();
        }
      
    });

    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
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

    PlayerMethods pm = PlayerMethods(innerPlayer: innerPlayer);

    void jumpToPosition(int seconds) {
      pm.jumpTo(seconds, SeekOperation.replace);
    }

    var max = innerPlayer.duration?.inMilliseconds.toDouble() ?? 0;
    double currentValue = innerPlayer.position.inMilliseconds.toDouble() <= max
        ? innerPlayer.position.inMilliseconds.toDouble()
        : max;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(durationToHFormat(innerPlayer.position.toString())),
        SizedBox(
          width: MediaConfig.getmediaWidht(context) / 2,
          child: Slider(
            min: 0,
            value: currentValue,
            max: max,
            onChanged: (value) {
              jumpToPosition((value / 1000).round());
              setState(() {});
            },
          ),
        ),
        Text(durationToHFormat(innerPlayer.duration.toString())),
      ],
    );
  }
}
