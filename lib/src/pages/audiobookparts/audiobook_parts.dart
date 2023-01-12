import 'package:flutter/material.dart';

class AudiobookParts extends StatelessWidget {
  AudiobookParts({super.key});

  static const routeName = '/audiobook_parts';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Details'),
      ),
      body: Center(
        child: Text('Audiobook by parts '),
      ),
    );
  }
}
