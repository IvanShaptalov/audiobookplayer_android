// This is an example Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
//
// Visit https://flutter.dev/docs/cookbook/testing/widget/introduction for
// more information about Widget testing.

import 'package:audiobook_player/src/pages/home/view/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  // group('MyWidget', () {
  //   testWidgets('should display a string of text', (WidgetTester tester) async {
  //     // Define a Widget
  //     const myWidget = MaterialApp(
  //       home: Scaffold(
  //         body: Text('Hello'),
  //       ),
  //     );

  //     // Build myWidget and trigger a frame.
  //     await tester.pumpWidget(myWidget);

  //     // Verify myWidget shows some text
  //     expect(find.byType(Text), findsOneWidget);
  //   });
  // });

  group('Player', () {
    testWidgets('check that player play and stops when clicked', (WidgetTester tester) async {
      // Define a Widget
      AudioPlayer testPlayer = AudioPlayer();
      var myWidget =
          MaterialApp(home: Scaffold(body: Player(innerPlayer: testPlayer)));

      // Build myWidget and trigger a frame.
      await tester.pumpWidget(myWidget);

      // Verify myWidget shows some text

      print(find.byIcon(Icons.play_arrow).description);
      expect(find.byIcon(Icons.play_arrow), findsOneWidget); // find play button

      await tester.tap(find.byIcon(Icons.play_arrow)); // click
      
      await tester.pumpWidget(myWidget);

      expect(testPlayer.playing, true); // check that player is really play
      
      await tester.tap(find.byIcon(Icons.pause)); // click

      expect(testPlayer.playing, false); // check that player stopped
    });
  });
}
