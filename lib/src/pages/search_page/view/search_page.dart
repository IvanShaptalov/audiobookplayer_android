// ignore_for_file: must_be_immutable

import 'package:audiobook_player/src/config/config.dart' show MediaConfig;
import 'package:flutter/material.dart';


class SearchPageConfig {
  static const double _minHeight = 100;
  static const double _maxHeight = 150;

  static const double _minElementWidth = 200;
  static const double _maxElementWidth = 500;

  static const int _maxLines = 2;

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
    return MediaConfig.getNormalSize(
        currentWidth, _minElementWidth, _maxElementWidth);
  }

  static MainAxisAlignment getRowAlignment() {
    return MainAxisAlignment.center;
  }

  static SearchPageConfig get instance {
    return SearchPageConfig();
  }
}

class LoginData {
  String username = "";
  String password = "";
}

class SearchPage extends StatelessWidget {
  final LoginData _loginData = LoginData();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(top: 50.0, right: 50.0, left: 50.0),
            child: Form(
                key: _formKey,
                child: Column(children: [
                  TextFormField(
                      keyboardType: TextInputType.url,
                      validator: (String? inValue) {
                        if (inValue!.isEmpty) {
                          return "Enter valid link please";
                        }
                        return null;
                      },
                      onSaved: (inValue) {
                        _loginData.username = inValue!;
                      },
                      decoration: const InputDecoration(
                          hintText: "enter link",
                          labelText: "Enter youtube audiobook link")),
                  TextButton(
                      child: Row(children: const [Icon(Icons.search), Text("Find")]),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState?.save();
                          // print("Link: ${_loginData.username}");
                        }
                      })
                ]))),
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.75,
            child: const LinearProgressIndicator(
              value: 0.25,
              backgroundColor: Color.fromARGB(255, 5, 46, 28),
              color: Color.fromARGB(255, 34, 255, 159),
              semanticsLabel: "downloading",
            )),
        Container(
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height / 16),
            child: const Text('downloading')),
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.75,
            child: const LinearProgressIndicator(
              value: 0.25,
              backgroundColor: Color.fromARGB(255, 5, 18, 46),
              color: Color.fromARGB(255, 43, 104, 234),
              semanticsLabel: "downloading",
            )),
        const Text('converting'),
        Row(
          mainAxisAlignment: SearchPageConfig.getRowAlignment(),
          children: const [
            Text('select folder'),
            Text('use default folder'),
          ],
        ),
      ],
    );
  }
}
