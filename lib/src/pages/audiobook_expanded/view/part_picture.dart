import 'package:audiobook_player/src/pages/sample_item.dart';
import 'package:flutter/material.dart';
class PartPicture extends StatelessWidget {

  PartPicture({super.key, required this.audiobookPart});

  final AudiobookItem audiobookPart;
  @override
  Widget build(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Icon(Icons.image), Icon(Icons.star)]);
  }
}