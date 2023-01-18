import 'package:audiobook_player/src/pages/edit_page/edit_page.dart';
import 'package:audiobook_player/src/pages/sample_item.dart';
import 'package:flutter/material.dart';

class EditPart extends StatelessWidget {
  EditPart({super.key, required this.audiobookPart});

  final AudiobookItem audiobookPart;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      IconButton(
        icon: const Icon(Icons.edit),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditPage(audiobookPart: audiobookPart),
            ),
          );
        },
      ),
      const Text('Edit')
    ]);
  }
}
