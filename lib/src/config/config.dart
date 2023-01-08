import 'package:flutter/material.dart';

class MediaConfig {
  static double getmediaHeight(context) {
    return MediaQuery.of(context).size.height;
  }

  static double getmediaWidht(context) {
    return MediaQuery.of(context).size.width;
  }

  static getNormalSize(double current, double min, double max) {
    // print("current ${current}");

    double result = current < min
        ? min
        : current > max
            ? max
            : current;
    // print("result ${result}");

    return result;
  }
}

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
}

class RecentAudiobooksConfig {
  static double _minHeight = 100;
  static double _maxHeight = 101;

  static double _minWidth = 170;
  static double _maxWidth = 200;

  static int _maxLines = 1;

  static int get maxLines {
    return _maxLines;
  }

  static double getDefaultRowHeight(context) {
    double currentHeight = MediaConfig.getmediaHeight(context) / 6;
    return MediaConfig.getNormalSize(
        currentHeight, _minHeight, _maxHeight); //min _max size checks
  }

  static double getDefaultElementWidth(context) {
    double currentWidth = MediaConfig.getmediaWidht(context) / 3;
    return MediaConfig.getNormalSize(currentWidth, _minWidth, _maxWidth);
  }
}


class LastAchievementsConfig {
  static double _minHeight = 75;
  static double _maxHeight = 76;

  static double _minWidth = 170;
  static double _maxWidth = 200;


  static double getDefaultRowHeight(context) {
    double currentHeight = MediaConfig.getmediaHeight(context) / 6;
    return MediaConfig.getNormalSize(
        currentHeight, _minHeight, _maxHeight); //min max size checks
  }

  static double getDefaultRowWidth(context) {
    double currentWidth = MediaConfig.getmediaWidht(context) / 3;
    return MediaConfig.getNormalSize(currentWidth, _minWidth, _maxWidth);
  }
}

class LibraryConfig {
  static double _minHeight = 100;
  static double _maxHeight = 150;

  static double _minElementWidth = 200;
  static double _maxElementWidth = 500;

  static int _maxLines = 2;

  static int get maxLines {
    return _maxLines;
  }

  static double getDefaultRowHeight(context) {
    double currentHeight = MediaConfig.getmediaHeight(context) / 6;
    return MediaConfig.getNormalSize(
        currentHeight, _minHeight, _maxHeight); //min _max size checks
  }

  static double getDefaultElementWidth(context) {
    double currentWidth = MediaConfig.getmediaWidht(context) / 3;
    return MediaConfig.getNormalSize(currentWidth, _minElementWidth, _maxElementWidth);
  }
}