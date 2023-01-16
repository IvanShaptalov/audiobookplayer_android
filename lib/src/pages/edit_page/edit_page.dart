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
  AudiobookEdit audiobookEdit = new AudiobookEdit();
  GlobalKey<FormState> _audiokey = new GlobalKey<FormState>();

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
        Container(
            height: MediaConfig.getmediaHeight(context) / 6,
            child: Row(
              children: [
                Image(image: AssetImage('assets/images/flutter_logo.png')),
                IconButton(onPressed: () async {
                  await imageDialog();
                }, icon: Icon(Icons.edit)),
              ],
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width / 2,
                child: Form(
                    key: this._audiokey,
                    child: Column(children: [
                      TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (String? inValue) {
                            if (inValue?.length == 0) {
                              return "Enter valid title please";
                            }
                            return null;
                          },
                          onSaved: (inValue) {
                            this.audiobookEdit.title = inValue!;
                          },
                          decoration: InputDecoration(
                              hintText: "enter title",
                              labelText: "Enter title")),
                      TextFormField(
                          keyboardType: TextInputType.text,
                          validator: (String? inValue) {
                            if (inValue?.length == 0) {
                              return "Enter valid author please";
                            }
                            return null;
                          },
                          onSaved: (inValue) {
                            this.audiobookEdit.author = inValue!;
                          },
                          decoration: InputDecoration(
                              hintText: "enter author",
                              labelText: "Enter author")),
                      TextFormField(
                          keyboardType: TextInputType.text,
                          validator: (String? inValue) {
                            if (inValue?.length == 0) {
                              return "Enter valid description please";
                            }
                            return null;
                          },
                          onSaved: (inValue) {
                            this.audiobookEdit.description = inValue!;
                          },
                          decoration: InputDecoration(
                              hintText: "enter description",
                              labelText: "Enter description")),
                      Row(
                        children: [
                          IconButton(
                              icon: Icon(Icons.save),
                              onPressed: () {
                                if (_audiokey.currentState!.validate()) {
                                  _audiokey.currentState?.save();
                                  print(
                                      '''New title: ${this.audiobookEdit.title}
                                      \nNew author: ${this.audiobookEdit.author}
                                      \nNew description: ${this.audiobookEdit.description}''');
                                }
                              }),
                          Text('save changes')
                        ],
                      )
                    ]))),
          ],
        ),
        Player()
      ]),
    );
  }
}
