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

  static MediaConfig get instance {
    return MediaConfig();
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

  static CurrentPlayingConfig get instance {
    return CurrentPlayingConfig();
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

  static RecentAudiobooksConfig get instance {
    return RecentAudiobooksConfig();
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

  static LastAchievementsConfig get instance {
    return LastAchievementsConfig();
  }
}

class LibraryConfig {
  double _minHeight = 100;
  double _maxHeight = 150;

  double _minElementWidth = 200;
  double _maxElementWidth = 500;

  int _maxLines = 2;

  int get maxLines {
    return _maxLines;
  }

  double getDefaultRowHeight(context) {
    double currentHeight = MediaConfig.getmediaHeight(context) / 6;
    return MediaConfig.getNormalSize(
        currentHeight, _minHeight, _maxHeight); //min _max size checks
  }

  double getDefaultElementWidth(context) {
    double currentWidth = MediaConfig.getmediaWidht(context) / 3;
    return MediaConfig.getNormalSize(currentWidth, _minElementWidth, _maxElementWidth);
  }

  static LibraryConfig get instance {
    return LibraryConfig();
  }
}


class AudiobookExpConfig {
  double _minHeight = 0;
  double _maxHeight = 1000;

  double _minElementWidth = 0;
  double _maxElementWidth = 500;

  int _maxLines = 2;

  int get maxLines {
    return _maxLines;
  }

  double getDefaultRowHeight(context) {
    double currentHeight = MediaConfig.getmediaHeight(context) / 6;
    return MediaConfig.getNormalSize(
        currentHeight, _minHeight, _maxHeight); //min _max size checks
  }

  double getDefaultElementWidth(context) {
    double currentWidth = MediaConfig.getmediaWidht(context) / 3;
    return MediaConfig.getNormalSize(currentWidth, _minElementWidth, _maxElementWidth);
  }

  static AudiobookExpConfig get instance {
    return AudiobookExpConfig();
  }
}


class SearchPageConfig {
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

  static MainAxisAlignment getRowAlignment() {
    return MainAxisAlignment.center;
  }

  static SearchPageConfig get instance {
    return SearchPageConfig();
  }

}