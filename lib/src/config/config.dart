import 'package:flutter/material.dart';



class MediaConfig {
    static double getmediaHeight(context){
    return MediaQuery.of(context).size.height;
  }

  static double getmediaWidht(context){
    return MediaQuery.of(context).size.width;
  }
}

class CurrentPlayingConfig {

  static double getDefaultRowHeight(context) {
    return MediaConfig.getmediaHeight(context) / 6;
  }

  static double getDefaultRowWidth(context) {
    return MediaConfig.getmediaWidht(context) / 3;
  }
}