import 'package:audiobook_player/src/pages/top_listeners/top_listeners_page.dart';
import 'package:flutter/material.dart';

class TopListenersLink extends StatelessWidget {
  const TopListenersLink({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.restorablePushNamed(context, TopListeners.routeName);
        },
        child: const Text('Top Listeners'));
  }
}
