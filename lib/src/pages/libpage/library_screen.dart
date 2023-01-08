import 'package:flutter/material.dart';

import '../../config/config.dart';
import '../sample_item.dart';

class Library extends StatelessWidget {
  const Library({
    super.key,
    this.items = const [
      AudiobookPlaylistItem(1, 'The witcher, Last Wish', true, [
        SampleItem(1, 'Part 1'),
        SampleItem(2, 'Part 2'),
        SampleItem(3, 'Part 3'),
        SampleItem(4, 'Part 4'),
        SampleItem(5, 'Part 5'),
        SampleItem(6, 'Part 6'),
      ]),
      AudiobookPlaylistItem(2, 'The whisperer in darkness', true, [
        SampleItem(1, 'Part 1'),
        SampleItem(2, 'Part 2'),
        SampleItem(3, 'Part 3'),
        SampleItem(4, 'Part 4'),
        SampleItem(5, 'Part 5'),
        SampleItem(6, 'Part 6'),
      ]),
      AudiobookPlaylistItem(3, 'Stupid book', false, [SampleItem(1, 'Part 1')]),
      AudiobookPlaylistItem(3, 'Stupid book', false, [SampleItem(1, 'Part 1')]),
      AudiobookPlaylistItem(3, 'Stupid book', false, [SampleItem(1, 'Part 1')]),
      AudiobookPlaylistItem(3, 'Stupid book', false, [SampleItem(1, 'Part 1')]),
      AudiobookPlaylistItem(3, 'Stupid book', false, [SampleItem(1, 'Part 1')]),
      AudiobookPlaylistItem(3, 'Stupid book', false, [SampleItem(1, 'Part 1')]),
      AudiobookPlaylistItem(3, 'Stupid book', false, [SampleItem(1, 'Part 1')]),
      AudiobookPlaylistItem(4, 'The witcher, Blood of elves', true, [
        SampleItem(1, 'Part 1'),
        SampleItem(2, 'Part 2'),
        SampleItem(3, 'Part 3'),
        SampleItem(4, 'Part 4'),
      ]),
    ],
  });

  final List<AudiobookPlaylistItem> items;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.6,
        child: Scrollbar(
          scrollbarOrientation: ScrollbarOrientation.right,
          thumbVisibility: true,
          child: ListView.builder(
            // Providing a restorationId allows the ListView to restore the
            // scroll position when a user leaves and returns to the app after it
            // has been killed while running in the background.
            restorationId: 'LibraryItems',
            scrollDirection: Axis.vertical,
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              final item = items[index];

              return Container(
                  margin: EdgeInsets.only(right: 20.0, top: 20.0, bottom: 20.0),
                  width: RecentAudiobooksConfig.getDefaultElementWidth(context),
                  color: const Color.fromARGB(57, 122, 205, 130),
                  // ignore: prefer_const_constructors
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(width: LibraryConfig.getDefaultElementWidth(context),child: 
                      ListTile(
                          
                          title: Text('${item.title}',
                              maxLines: LibraryConfig.maxLines),
                          leading: const CircleAvatar(
                            // Display the Flutter Logo image asset.
                            foregroundImage:
                                AssetImage('assets/images/flutter_logo.png'),
                          ),
                          onTap: () {
                            // Navigate to the details page. If the user leaves and returns to
                            // the app after it has been killed while running in the
                            // background, the navigation stack is restored.
                          }),),
                      IconButton(onPressed: (){}, icon: const Icon(Icons.drag_handle)),
                      IconButton(alignment: Alignment.centerRight,onPressed: (){}, icon: const Icon(Icons.more_vert)),
                    ],
                  ));
            },
          ),
        ));
  }
}
