import 'package:audiobook_player/src/config/config.dart' show MediaConfig;
import 'package:flutter/material.dart';


class CurrentPlayingConfig {
  static const double _minHeight = 75;
  static const double _maxHeight = 76;


  static const double _minWidth = 75;
  static const double _maxWidth = 200;

  static double getDefaultRowHeight(context) {
    double currentHeight = MediaConfig.getmediaHeight(context) / 6;
    return MediaConfig.getNormalSize(
        currentHeight, _minHeight, _maxHeight); //min _max size checks
  }

  static double getDefaultRowWidth(context) {
    double currentWidth = MediaConfig.getmediaWidht(context) / 3;
    return MediaConfig.getNormalSize(currentWidth, _minWidth, _maxWidth);
  }

  static CurrentPlayingConfig get instance {
    return CurrentPlayingConfig();
  }
}


class CurrentPlayingBook extends StatelessWidget {
  const CurrentPlayingBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: Container(
          height: CurrentPlayingConfig.getDefaultRowHeight(context),
          width: CurrentPlayingConfig.getDefaultRowWidth(context),
          color: Colors.amber,
          child: const Text('new row'),
        )
        );
  }
}
