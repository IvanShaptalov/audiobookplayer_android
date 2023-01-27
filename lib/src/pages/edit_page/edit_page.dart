// ignore_for_file: must_be_immutable

import 'package:audiobook_player/src/config/config.dart';
import 'package:audiobook_player/src/pages/home/view/player.dart';
import 'package:audiobook_player/src/pages/sample_item.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class AudiobookEdit {
  String title = "";
  String author = "";
  String description = "";
}

class EditPage extends StatelessWidget {
  AudiobookEdit audiobookEdit = AudiobookEdit();
  final GlobalKey<FormState> _audiokey = GlobalKey<FormState>();

  EditPage({super.key, required this.audiobookPart});

  Future<FilePickerResult?> imageDialog() async {
    return await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
    );
  }

  final AudiobookItem audiobookPart;

  static const String routeName = '/edit_audiobook';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit ${audiobookPart.parent.title}')),
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(
            height: MediaConfig.getmediaHeight(context) / 6,
            child: Row(
              children: [
                const Image(
                    image: AssetImage('assets/images/flutter_logo.png')),
                IconButton(
                    onPressed: () async {
                      await imageDialog();
                    },
                    icon: const Icon(Icons.edit)),
              ],
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width / 2,
                child: Form(
                    key: _audiokey,
                    child: Column(children: [
                      TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (String? inValue) {
                            if (inValue!.isEmpty) {
                              return "Enter valid title please";
                            }
                            return null;
                          },
                          onSaved: (inValue) {
                            audiobookEdit.title = inValue!;
                          },
                          decoration: const InputDecoration(
                              hintText: "enter title",
                              labelText: "Enter title")),
                      TextFormField(
                          keyboardType: TextInputType.text,
                          validator: (String? inValue) {
                            if (inValue!.isEmpty) {
                              return "Enter valid author please";
                            }
                            return null;
                          },
                          onSaved: (inValue) {
                            audiobookEdit.author = inValue!;
                          },
                          decoration: const InputDecoration(
                              hintText: "enter author",
                              labelText: "Enter author")),
                      TextFormField(
                          keyboardType: TextInputType.text,
                          validator: (String? inValue) {
                            if (inValue!.isEmpty) {
                              return "Enter valid description please";
                            }
                            return null;
                          },
                          onSaved: (inValue) {
                            audiobookEdit.description = inValue!;
                          },
                          decoration: const InputDecoration(
                              hintText: "enter description",
                              labelText: "Enter description")),
                      Row(
                        children: [
                          IconButton(
                              icon: const Icon(Icons.save),
                              onPressed: () {
                                if (_audiokey.currentState!.validate()) {
                                  _audiokey.currentState?.save();
                                  // print(
                                  //     '''New title: ${audiobookEdit.title}
                                  //     \nNew author: ${audiobookEdit.author}
                                  //     \nNew description: ${audiobookEdit.description}''');
                                }
                              }),
                          const Text('save changes')
                        ],
                      )
                    ]))),
          ],
        ),
        Player(innerPlayer: player),
      ]),
    );
  }
}
