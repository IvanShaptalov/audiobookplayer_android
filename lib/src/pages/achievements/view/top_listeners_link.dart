import 'package:audiobook_player/src/pages/top_listeners/top_listeners_page.dart';
import 'package:flutter/material.dart';

class TopListenersLink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.restorablePushNamed(context, TopListeners.routeName);
        },
        child: Text('Top Listeners'));
  }
}
