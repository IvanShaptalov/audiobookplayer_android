import 'package:audiobook_player/src/config/config.dart';
import 'package:flutter/material.dart';


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
