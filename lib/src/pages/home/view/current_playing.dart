import 'package:audiobook_player/src/config/config.dart' show MediaConfig;
import 'package:flutter/material.dart';


class CurrentPlayingConfig {
  static double _minHeight = 75;
  static double _maxHeight = 76;


  static double _minWidth = 75;
  static double _maxWidth = 200;

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
  @override
  Widget build(BuildContext context) {
    return Container(child:  Align(
        alignment: Alignment.centerRight,
        child: Container(
          height: CurrentPlayingConfig.getDefaultRowHeight(context),
          width: CurrentPlayingConfig.getDefaultRowWidth(context),
          child: Text('new row'),
          color: Colors.amber,
        )
        )
        );
  }
}
