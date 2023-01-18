// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Statistics extends StatelessWidget {
  static const String routeName = "/statistics";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Full stats'),
      ),
    );
  }
}
